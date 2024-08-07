// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:bizkit/module/task/data/service/home/home_service.dart';
import 'package:bizkit/module/task/domain/model/dashboard/genearate_report_model/genearate_report_model.dart';
import 'package:bizkit/module/task/domain/model/dashboard/get_report_model/get_report_model.dart';
import 'package:bizkit/module/task/domain/model/dashboard/get_report_success_responce/task.dart';
import 'package:bizkit/module/task/domain/model/dashboard/progres_bar_success_responce/counts.dart';
import 'package:bizkit/module/task/domain/repository/service/home_repo.dart';
import 'package:bizkit/packages/pdf/pdf_generator.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

class TaskHomeScreenController extends GetxController {
  final HomeRepo homeService = HomeService();

  RxBool isLoading = false.obs;
  RxBool fileDownloading = false.obs;
  RxString taskCategory = ''.obs;
  Rx<Counts> progresBarCounts = Counts().obs;
  RxList<ReportTask> reportTasks = <ReportTask>[].obs;
  RxString taskReport = ''.obs;

  // RxList to hold selected fields
  RxList<String> selectedFields = <String>[].obs;
  RxString selectedReportType = 'pdf'.obs;
  RxList<String> selectedTaskIds = <String>[].obs;

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

  void getReport({required GetReportModel getReportModel}) async {
    isLoading.value = true;

    final result = await homeService.getReport(getReportModel: getReportModel);

    result.fold(
      (failure) {
        isLoading.value = false;
        log(failure.message.toString());
      },
      (success) {
        reportTasks.assignAll(success.tasks ?? []);
        isLoading.value = false;
      },
    );
  }

  // Future<void> downloadReport(String base64Data, String fileType) async {
  //   try {
  //     final bytes = base64Decode(base64Data);

  //     final directory = await getApplicationDocumentsDirectory();
  //     final path = '${directory.path}/task_report.$fileType';

  //     final file = File(path);
  //     await file.writeAsBytes(bytes);

  //     Get.snackbar(
  //       'Download Complete',
  //       'Your $fileType report has been saved and is accessible',
  //       snackPosition: SnackPosition.BOTTOM,
  //     );

  //     log('Report saved to $path');
  //   } catch (e) {
  //     log('Failed to download report: $e');
  //     Get.snackbar(
  //       'Download Failed',
  //       'An error occurred while downloading the report',
  //       snackPosition: SnackPosition.BOTTOM,
  //     );
  //   }
  // }

  void generateReport(
      {required GenearateReportModel generateReportModel}) async {
    fileDownloading.value = true;

    final result = await homeService.generateReport(
        generateReportModel: generateReportModel);

    result.fold(
      (failure) {
        fileDownloading.value = false;
        log(failure.message.toString());
      },
      (success) async {
        taskReport.value = success.report ?? '';
        selectedFields.clear();
        selectedReportType.value = '';
        selectedTaskIds.clear();
        update();
        // if (selectedReportType.value == 'pdf') {
        pdfGenerator(success.report ?? '');
        Get.snackbar('Success', 'Success');
        //downloadReport(taskReport.value, selectedReportType.value);
        fileDownloading.value = false;
        Get.back();
      },
    );
  }
}
