// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:developer';
import 'package:bizkit/module/task/data/service/home/home_service.dart';
import 'package:bizkit/module/task/data/sqfilte/task/task_local_service.dart';
import 'package:bizkit/module/task/domain/model/dashboard/genearate_report_model/genearate_report_model.dart';
import 'package:bizkit/module/task/domain/model/dashboard/get_recent_tasks_responce/recent_tasks/recent_tasks.dart';
import 'package:bizkit/module/task/domain/model/dashboard/get_report_model/get_report_model.dart';
import 'package:bizkit/module/task/domain/model/dashboard/get_report_success_responce/task.dart';
import 'package:bizkit/module/task/domain/model/dashboard/progres_bar_success_responce/counts.dart';
import 'package:bizkit/module/task/domain/repository/service/home_repo.dart';
import 'package:bizkit/packages/pdf/pdf_generator.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/intl/intl_date_formater.dart';
import 'package:bizkit/utils/snackbar/flutter_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskHomeScreenController extends GetxController {
  final HomeRepo homeService = HomeService();

  RxBool isLoading = false.obs;
  RxBool loadingForGetReports = false.obs;
  RxBool fileDownloading = false.obs;
  RxBool loadingForRecentTasks = false.obs;
  RxBool loadingForRecentTasksNetwork = false.obs;
  RxBool loadingForRecentTasksNetworkError = false.obs;
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

  RxInt taskStatusTabIndex = 0.obs;

  final TaskLocalService taskLocalService = TaskLocalService();

  @override
  void onInit() {
    super.onInit();
    fetchRecentTasks();
    progresBar();
  }

  // Function to add or remove fields from the selectedFields list
  void addField(String value) {
    if (selectedFields.contains(value)) {
      selectedFields.remove(value);
    } else {
      selectedFields.add(value);
    }
  }

  void taskStatusTabController(int index) async {
    taskStatusTabIndex.value = index;
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

  Future<void> fetchRecentTasks() async {
    loadingForRecentTasks.value = true;
    loadingForRecentTasksNetwork.value = true;
    loadingForRecentTasksNetworkError.value = false;
    selfieTasks.value = [];
    toOthersTasks.value = [];
    toMeTasks.value = [];
    // Step 1: Fetch and display local data first
    await fetchRecentTasksFromLocalDb();

    // Step 2: Then update with any network data if available
    await fetchRecentTaskFromNetWork();

    loadingForRecentTasksNetwork.value = false;
    loadingForRecentTasks.value = false;
  }

  Future<void> fetchRecentTasksFromLocalDb() async {
    loadingForRecentTasks.value = true;
    final localDbResult =
        await taskLocalService.getRecentsTasksFromLocalStorage();

    localDbResult.fold(
      (failure) {
        log(failure.message.toString());
      },
      (success) {
        toMeTasks.assignAll(success.othersToSelf ?? []);
        toOthersTasks.assignAll(success.selfToOthers ?? []);
        selfieTasks.assignAll(success.selfToSelf ?? []);
      },
    );
  }

  Future<void> fetchRecentTaskFromNetWork() async {
    final result = await homeService.getRecentTasks();
    result.fold(
      (failure) {
        loadingForRecentTasks.value = false;
        loadingForRecentTasksNetworkError.value = true;
        log(failure.message.toString());
      },
      (success) async {
        toMeTasks.assignAll(success.othersToSelf ?? []);
        toOthersTasks.assignAll(success.selfToOthers ?? []);
        selfieTasks.assignAll(success.selfToSelf ?? []);
        loadingForRecentTasks.value = false;

        // Delete all previous recent tasks from local storage
        await taskLocalService.deleteRecentTaskFromLocalStorage();

        // Other to self tasks add to local storage
        for (var task in toMeTasks) {
          taskLocalService.addRecentTaskToLocalStorage(
            recentTaskId: task.taskId ?? '',
            recentTaskType: 'others_to_self',
          );
        }

        // Self to others tasks add to local storage
        for (var task in toOthersTasks) {
          taskLocalService.addRecentTaskToLocalStorage(
              recentTaskId: task.taskId ?? '',
              recentTaskType: 'self_to_others');
        }

        // Self to self tasks add to local storage
        for (var task in selfieTasks) {
          taskLocalService.addRecentTaskToLocalStorage(
              recentTaskId: task.taskId ?? '', recentTaskType: 'self_to_self');
        }
      },
    );
  }

  double recentTaskProgress(String? date1, String? date2) {
    if (date1 == null || date2 == null) {
      log('Invalid date(s): date1=$date1, date2=$date2', name: 'TaskContainer');
      return 0;
    }

    try {
      final int first =
          DateTimeFormater.calculateDifferenceInHours(date1, date2);
      final int second = DateTimeFormater.calculateDifferenceInHours(
          date1, DateTime.now().toString());

      if (first < second) return 1;
      return second / first;
    } catch (e) {
      log('Error calculating difference in hours: $e', name: 'TaskContainer');
      return 0;
    }
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

    final result = await homeService.generateReport(
        generateReportModel: generateReportModel);

    result.fold(
      (failure) {
        fileDownloading.value = false;

        showCustomToast(
          message: errorMessage,
          backgroundColor: kred,
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

        showCustomToast(
          message: 'Task Report Downloaded Successfully',
          backgroundColor: Get.isDarkMode ? klightGrey : kblack,
          textColor: Get.isDarkMode ? kblack : kwhite,
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
