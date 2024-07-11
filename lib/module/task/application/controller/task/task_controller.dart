import 'dart:developer';

import 'package:bizkit/module/task/data/service/task/task_service.dart';
import 'package:bizkit/module/task/domain/model/requests/received_requests_responce/received_requests_responce.dart';
import 'package:bizkit/module/task/domain/model/requests/send_requests_responce/sent_request.dart';
import 'package:bizkit/module/task/domain/model/task/all_tasks_responce/all_tasks_responce.dart';
import 'package:bizkit/module/task/domain/model/task/filter_by_deadline_model/filter_by_deadline_model.dart';
import 'package:bizkit/module/task/domain/model/task/filter_by_type_model/filter_by_type_model.dart';
import 'package:bizkit/module/task/domain/model/task/task_model/task_model.dart';
import 'package:bizkit/module/task/domain/repository/service/task_repo.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:get/get.dart';

class CreateTaskController extends GetxController {
  Rx<TaskType> createTaskTupe = TaskType.official.obs;
  Rx<PriorityLevel> createPriorityLevel = PriorityLevel.medium.obs;
  Rx<RecurringTimePeriod> createRecurringTimePeriod =
      RecurringTimePeriod.none.obs;
  RxBool createRecurring = false.obs;
  RxString deadlineDate = ''.obs;

  RxList<Tasks> allTasks = <Tasks>[].obs;
  RxList<SentRequest> sentRequests = <SentRequest>[].obs;
  RxList<ReceivedRequestsResponce> receivedRequests =
      <ReceivedRequestsResponce>[].obs;

  // Test task id
  String testTaskId = '';

  RxBool isLoading = false.obs;

  final TaskRepo taskService = TaskService();

  changeTaskType(TaskType type) {
    createTaskTupe.value = type;
  }

  changePriorityLevel(PriorityLevel level) {
    createPriorityLevel.value = level;
  }

  changeRecurringTimePeriod(RecurringTimePeriod period) {
    createRecurringTimePeriod.value = period;
  }

  changeCreateRecorring(bool value) {
    createRecurring.value = value;
  }

  void createNewTask({required TaskModel task}) async {
    final result = await taskService.createTask(task: task);
    isLoading.value = true;
    result.fold(
      (error) => log('${error.error}', name: 'Error from controller'),
      (success) {
        log('${success.message}');
        testTaskId = success.taskId.toString();
        isLoading.value = false;
        fetchAllTasks();
      },
    );
  }

  void fetchAllTasks() async {
    final result = await taskService.getAllTasks();

    result.fold(
      (failure) => log(failure.message.toString()),
      (success) {
        allTasks.assignAll(success.tasks);
      },
    );
  }

  void fetchSendRequests() async {
    final result = await taskService.getSendRequests();
    result.fold(
      (failure) => log(failure.message.toString()),
      (success) {
        sentRequests.assignAll(success.sentRequests ?? []);
      },
    );
  }

  void fetchReceivedRequests() async {
    final result = await taskService.getReceivedRequests();
    result.fold(
      (failure) => log(failure.message.toString()),
      (success) {
        receivedRequests.assignAll(success);
      },
    );
  }

  void taskFilterByDeadline(
      {required FilterByDeadlineModel filterByDeadline}) async {
    final result =
        await taskService.filterByDeadline(filterByDeadline: filterByDeadline);
    result.fold(
      (failure) => log(failure.message.toString()),
      (success) {
        log('filter by deadline $success');
      },
    );
  }
}
