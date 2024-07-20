import 'dart:async';
import 'dart:developer';

import 'package:bizkit/module/task/data/service/home/home_service.dart';
import 'package:bizkit/module/task/domain/model/dashboard/generate_task_report_model/generate_task_report_model.dart';
import 'package:bizkit/module/task/domain/model/dashboard/progres_bar_success_responce/counts.dart';
import 'package:bizkit/module/task/domain/repository/service/home_repo.dart';
import 'package:bizkit/utils/pdf/pdf_preview_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskHomeScreenController extends GetxController {
  final HomeRepo homeService = HomeService();

  RxBool isLoading = false.obs;

  RxString taskCategory = ''.obs;

  Rx<Counts> progresBarCounts = Counts().obs;

  RxString taskReport = ''.obs;

  changeSelectedTaskCategory(String selectedTaskCategory) {
    taskCategory.value = selectedTaskCategory;
    log('cont');
    update();
  }

  void progresBar() async {
    isLoading.value = true;
    final result = await homeService.progresBar();
    result.fold(
      (failure) {
        isLoading.value = false;
        log(failure.message.toString());
      },
      (success) {
        progresBarCounts.value = success.counts!;
        // log('value :=> ${progresBarCounts.value.selfToOthers?.toJson()}');
        Timer(
          const Duration(milliseconds: 50),
          () => isLoading.value = false,
        );
      },
    );
  }

  void generateTaskReport(
      {required GenerateTaskReportModel genearteTaskReport,
      required BuildContext context}) async {
    isLoading.value = true;
    final result = await homeService.genearateTaskReport(
        genearteTaskReport: genearteTaskReport);

    result.fold(
      (failure) {
        isLoading.value = false;
        Navigator.pop(context);
        log(failure.message.toString());
      },
      (success) {
        taskReport.value = success.report ?? '';
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ScreenPdfPreview(
              base64: taskReport.value,
              label: 'Task Report',
            ),
          ),
        );

        log('Report : => ${taskReport.value}');
        isLoading.value = false;
      },
    );
  }
}
