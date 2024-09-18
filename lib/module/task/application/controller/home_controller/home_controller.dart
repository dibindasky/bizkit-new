// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:developer';
import 'package:bizkit/module/task/data/service/home/home_service.dart';
import 'package:bizkit/module/task/domain/model/dashboard/genearate_report_model/genearate_report_model.dart';
import 'package:bizkit/module/task/domain/model/dashboard/get_recent_tasks_responce/recent_tasks/recent_tasks.dart';
import 'package:bizkit/module/task/domain/model/dashboard/get_report_model/get_report_model.dart';
import 'package:bizkit/module/task/domain/model/dashboard/get_report_success_responce/task.dart';
import 'package:bizkit/module/task/domain/model/dashboard/progres_bar_success_responce/counts.dart';
import 'package:bizkit/module/task/domain/repository/service/home_repo.dart';
import 'package:bizkit/packages/pdf/pdf_generator.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskHomeScreenController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final HomeRepo homeService = HomeService();

  RxBool isLoading = false.obs;
  RxBool loadingForGetReports = false.obs;
  RxBool fileDownloading = false.obs;
  RxBool loadingForRecentTasks = false.obs;
  RxString taskCategory = ''.obs;
  Rx<Counts> progresBarCounts = Counts().obs;
  RxList<ReportTask> reportTasks = <ReportTask>[].obs;
  RxString taskReport = ''.obs;

  // RxList to hold recent tasks - to me , to others , selfie
  RxList<RecentTasks> toMeTasks = <RecentTasks>[].obs;
  RxList<RecentTasks> toOthersTasks = <RecentTasks>[].obs;
  RxList<RecentTasks> selfieTasks = <RecentTasks>[].obs;

  // RxList to hold selected fields
  RxList<String> selectedFields = <String>['title'].obs;
  RxString selectedReportType = ''.obs;
  RxList<String> selectedTaskIds = <String>[].obs;

  RxBool progresBarOrRecentTask = true.obs;

  // late AnimationController animationController;

  // @override
  // void onInit() {
  //   super.onInit();
  //   animationController = AnimationController(
  //     duration: const Duration(milliseconds: 300),
  //     vsync: this,
  //   );
  // }

  // @override
  // void onClose() {
  //   animationController.dispose();
  //   super.onClose();
  // }

  // Function to add or remove fields from the selectedFields list
  void addField(String value) {
    if (selectedFields.contains(value)) {
      selectedFields.remove(value);
    } else {
      selectedFields.add(value);
    }
  }

  // Function to set the selected report type
  void setReportType(String type) {
    selectedReportType.value = type;
  }

  // method for change the [progresBarOrRecentTask] value for home page ui change
  void changeToProgresBar() async {
    progresBarOrRecentTask.value = !progresBarOrRecentTask.value;
    if (!progresBarOrRecentTask.value) {
      progresBar();
    }
  }

  void changeSelectedTaskCategory(String selectedTaskCategory) {
    taskCategory.value = selectedTaskCategory;
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
        Timer(
          const Duration(milliseconds: 50),
          () => isLoading.value = false,
        );
      },
    );
  }

  void fetchRecentTasks() async {
    loadingForRecentTasks.value = true;
    final result = await homeService.getRecentTasks();

    result.fold(
      (failure) {
        loadingForRecentTasks.value = false;
        log(failure.message.toString());
      },
      (success) {
        toMeTasks.assignAll(success.othersToSelf ?? []);
        toOthersTasks.assignAll(success.selfToOthers ?? []);
        selfieTasks.assignAll(success.selfToSelf ?? []);
        loadingForRecentTasks.value = false;
      },
    );
  }

  void getReport({required GetReportModel getReportModel}) async {
    loadingForGetReports.value = true;

    final result = await homeService.getReport(getReportModel: getReportModel);

    result.fold(
      (failure) {
        loadingForGetReports.value = false;
        log(failure.message.toString());
      },
      (success) {
        reportTasks.assignAll(success.tasks ?? []);
        loadingForGetReports.value = false;
      },
    );
  }

  void generateReport(
      {required GenearateReportModel generateReportModel,
      required BuildContext context}) async {
    fileDownloading.value = true;
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    final result = await homeService.generateReport(
        generateReportModel: generateReportModel);

    result.fold(
      (failure) {
        fileDownloading.value = false;
        scaffoldMessenger.showSnackBar(
          const SnackBar(
            content: Text(errorMessage),
            backgroundColor: kred,
          ),
        );
        log(failure.message.toString());
      },
      (success) async {
        taskReport.value = success.report ?? '';
        selectedFields.clear();
        selectedReportType.value = '';
        selectedTaskIds.clear();
        update();

        pdfAndExcelGenerator(
            base64String: success.report ?? '',
            filetype: generateReportModel.reportType ?? '',
            context: context);
        scaffoldMessenger.showSnackBar(
          const SnackBar(
            content: Text('Task Report Downloaded Successfully'),
            backgroundColor: neonShade,
          ),
        );

        fileDownloading.value = false;
        Navigator.of(context).pop();
      },
    );
  }

  void clearAllDatas() async {
    reportTasks.clear();
    selectedFields.clear();
    selectedTaskIds.clear();
    selectedReportType.value = '';
    reportTasks.clear();
    toMeTasks.clear();
    toOthersTasks.clear();
    selfieTasks.clear();
  }
}
