import 'dart:developer';

import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/data/service/hierarchy/hierarchy_service.dart';
import 'package:bizkit/module/task/domain/model/dashboard/progres_bar_success_responce/counts.dart';
import 'package:bizkit/module/task/domain/model/hierarchy/employee_tasks_based_on_type/employee_tasks_based_on_type.dart';
import 'package:bizkit/module/task/domain/model/hierarchy/employees_list_responce/employee.dart';
import 'package:bizkit/module/task/domain/model/hierarchy/tasks_counts_model/tasks_counts_model.dart';
import 'package:bizkit/module/task/domain/model/task/get_single_task_model/get_single_task_model.dart';
import 'package:bizkit/module/task/domain/model/task/get_task_responce/get_task_responce.dart';
import 'package:bizkit/module/task/domain/model/task/self_to_others_type_responce/task.dart';
import 'package:bizkit/module/task/domain/repository/service/hierarchy_repo.dart';
import 'package:bizkit/service/secure_storage/flutter_secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HierarchyController extends GetxController {
  final HierarchyRepo hirerachyService = HierarchyService();

  final ScrollController filterTasksScrollController =
      ScrollController(); // Scroll controller for filter tasks

  // Loadings
  RxBool tasksCountsLoading = false.obs;
  RxBool empolyeesListLoading = false.obs;
  RxBool taskDetailLoading = false.obs;
  RxBool isLoading = false.obs;
  RxBool filterTasksLoadMoreLoading = false.obs;

  RxList<String> employeesKeys = <String>[].obs;
  RxMap<String, Counts> tasksCounts = <String, Counts>{}.obs;
  RxList<Employee> employees = <Employee>[].obs;
  RxList<Task> filterTasks = <Task>[].obs;

  var taskDetails = GetTaskResponce().obs;

  int filterTasksPage = 1, pageSize = 10;

  /// Task type filter string [  Stores selected task TYPE in string format ]
  RxString taskType = ''.obs;
  RxString targetUserId = ''.obs;

  var userId = '';

  @override
  void onInit() {
    filterTasksScrollController.addListener(filterTasksScrollListener);
    super.onInit();
  }

  void filterTasksScrollListener() async {
    if (filterTasksScrollController.position.pixels ==
        filterTasksScrollController.position.maxScrollExtent) {
      filterTasksByTypeLoadMore();
    }
  }

  void changeFilterTaskType(String taskType) {
    this.taskType.value = taskType;
  }

  void changeTargetUsers(String userId) {
    targetUserId.value = userId;
  }

  void fetchTasksCounts(
      {required EmpolyeesTasksCountsModel tasksCountsModel}) async {
    tasksCountsLoading.value = true;

    final result = await hirerachyService.getTasksCounts(
        tasksCountsModel: tasksCountsModel);

    result.fold(
      (failure) {
        log(failure.message.toString());
        tasksCountsLoading.value = false;
      },
      (success) {
        if (success.data != null) {
          final Map<String, dynamic> response = success.data;
          employeesKeys.value = (response).keys.toList();

          for (var element in employeesKeys) {
            tasksCounts[element] = Counts.fromJson(response[element]);
          }
          tasksCountsLoading.value = false;
        }
      },
    );
  }

  void fetchEmployeesList() async {
    empolyeesListLoading.value = true;

    final result = await hirerachyService.getEmployeeslist();

    result.fold(
      (failure) {
        log(failure.message.toString());
        empolyeesListLoading.value = false;
      },
      (success) {
        employees.value = success.employees ?? [];

        empolyeesListLoading.value = false;
        fetchTasksCounts(
            tasksCountsModel: EmpolyeesTasksCountsModel(
                userIds: employees
                    .map(
                      (element) => element.userId ?? '',
                    )
                    .toList()));
      },
    );
  }

  // Task full details
  void fetchTaskDetails({required GetSingleTaskModel taskId}) async {
    Get.find<CreateTaskController>().isLoading.value = true;

    final result = await hirerachyService.getTaskDetails(taskId: taskId);

    result.fold(
      (failure) {
        log(failure.message.toString());
        Get.find<CreateTaskController>().isLoading.value = false;
      },
      (success) {
        Get.find<CreateTaskController>().singleTask.value = success;
        Get.find<CreateTaskController>().isLoading.value = false;
      },
    );
  }

  // Employee tasks filter based on type
  void filterTasksByType({required String targetUserId}) async {
    if (userId.isEmpty) {
      userId = await SecureStorage.getUserId() ?? '';
    }
    isLoading.value = true;
    filterTasksPage = 1;
    filterTasks.value = [];
    final result = await hirerachyService.filterTasksBasedOnType(
        filterTasksBasedOnType: EmployeeTasksBasedOnType(
            page: filterTasksPage,
            pageSize: pageSize,
            taskType: taskType.value,
            targetUserId: targetUserId));

    result.fold(
      (failure) {
        log(failure.message.toString());
        isLoading.value = false;
      },
      (success) {
        filterTasks.value = success.data ?? [];
        isLoading.value = false;
      },
    );
  }

  // Employee tasks filter based on type [ Pagination ]
  void filterTasksByTypeLoadMore() async {
    if (filterTasksLoadMoreLoading.value == true) {
      return;
    }
    filterTasksLoadMoreLoading.value = true;

    final result = await hirerachyService.filterTasksBasedOnType(
        filterTasksBasedOnType: EmployeeTasksBasedOnType(
      page: ++filterTasksPage,
      pageSize: pageSize,
      taskType: taskType.value,
      targetUserId: targetUserId.value,
    ));

    result.fold(
      (failure) {
        log(failure.message.toString());
        filterTasksLoadMoreLoading.value = false;
      },
      (success) {
        filterTasks.addAll(success.data ?? []);
        filterTasksLoadMoreLoading.value = false;
      },
    );
  }
}
