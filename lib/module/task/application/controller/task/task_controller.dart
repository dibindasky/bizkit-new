import 'dart:developer';

import 'package:bizkit/module/task/data/service/task/task_service.dart';
import 'package:bizkit/module/task/domain/model/requests/accept_or_reject_model/accept_or_reject_model.dart';
import 'package:bizkit/module/task/domain/model/requests/received_requests_responce/assigned_to.dart';
import 'package:bizkit/module/task/domain/model/requests/received_requests_responce/received_requests_responce.dart';
import 'package:bizkit/module/task/domain/model/requests/send_requests_responce/sent_request.dart';
import 'package:bizkit/module/task/domain/model/task/all_tasks_responce/all_tasks_responce.dart';
import 'package:bizkit/module/task/domain/model/task/filter_by_deadline_model/filter_by_deadline_model.dart';
import 'package:bizkit/module/task/domain/model/task/filter_by_deadline_responce/task.dart';
import 'package:bizkit/module/task/domain/model/task/filter_by_type_model/filter_by_type_model.dart';
import 'package:bizkit/module/task/domain/model/task/filter_pinned_task_by_type_model/filter_pinned_task_by_type_model.dart';
import 'package:bizkit/module/task/domain/model/task/filter_pinned_task_by_type_success_responce/task.dart';
import 'package:bizkit/module/task/domain/model/task/pinned_task/pinned_a_task_model/pinned_a_task_model.dart';
import 'package:bizkit/module/task/domain/model/task/pinned_task/unpin_a_task_model/unpin_a_task_model.dart';
import 'package:bizkit/module/task/domain/model/task/self_to_others_type_responce/task.dart';
import 'package:bizkit/module/task/domain/model/task/task_model/assigned_to.dart';
import 'package:bizkit/module/task/domain/model/task/task_model/task_model.dart';
import 'package:bizkit/module/task/domain/model/userSearch/user_search_model/user_search_model.dart';
import 'package:bizkit/module/task/domain/model/userSearch/user_search_success_responce/user_search_success_responce.dart';
import 'package:bizkit/module/task/domain/repository/service/task_repo.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CreateTaskController extends GetxController {
  Rx<TaskType> createTaskTupe = TaskType.official.obs;
  Rx<PriorityLevel> createPriorityLevel = PriorityLevel.medium.obs;
  Rx<RecurringTimePeriod> createRecurringTimePeriod =
      RecurringTimePeriod.none.obs;
  RxBool createRecurring = false.obs;
  RxString deadlineDate = ''.obs;

  var participants = <TaskAssignedTo>[].obs;

  RxList<Tasks> allTasks = <Tasks>[].obs;

  RxList<Task> typeTasks = <Task>[].obs;

  RxList<DTasks> deadlineTasks = <DTasks>[].obs;

  RxList<SentRequest> sentRequests = <SentRequest>[].obs;

  RxList<ReceivedRequestsResponce> receivedRequests =
      <ReceivedRequestsResponce>[].obs;

  RxList<PinnedTasksByTypes> allPinnedTasks = <PinnedTasksByTypes>[].obs;

  RxList<UserSearchSuccessResponce> userslist =
      <UserSearchSuccessResponce>[].obs;

  @override
  void onInit() {
    final DateTime todaydate = DateTime.now();
    taskFilterByDeadline(
        filterByDeadline: FilterByDeadlineModel(
            date: DateFormat('yyyy-MM-dd').format(todaydate)));
    // fetchAllPinnedTasks();
    super.onInit();
  }

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
    isLoading.value = true;

    final result = await taskService.createTask(task: task);

    result.fold(
      (error) {
        isLoading.value = false;
        log('${error.error}', name: 'Error from create new task');
      },
      (success) {
        isLoading.value = false;
        log('${success.message}');
        testTaskId = success.taskId.toString();
        // isLoading.value = false;
        fetchAllTasks();
      },
    );
  }

  void fetchAllTasks() async {
    // final result = await taskService.getAllTasks();

    // result.fold(
    //   (failure) => log(failure.message.toString()),
    //   (success) {
    //     allTasks.assignAll(success.tasks);
    //   },
    // );
  }

  void fetchSendRequests() async {
    isLoading.value = true;
    final result = await taskService.getSendRequests();
    result.fold(
      (failure) {
        isLoading.value = false;
        log(failure.message.toString());
      },
      (success) {
        isLoading.value = false;
        sentRequests.assignAll(success.sentRequests ?? []);
      },
    );
  }

  void fetchReceivedRequests() async {
    isLoading.value = true;
    final result = await taskService.getReceivedRequests();
    result.fold(
      (failure) {
        isLoading.value = false;
        log(failure.message.toString());
      },
      (success) {
        isLoading.value = false;
        receivedRequests.assignAll(success);
      },
    );
  }

  void taskFilterByDeadline(
      {required FilterByDeadlineModel filterByDeadline}) async {
    isLoading.value = true;
    final result =
        await taskService.filterByDeadline(filterByDeadline: filterByDeadline);
    result.fold(
      (failure) {
        log(failure.message.toString());
        isLoading.value = false;
      },
      (success) {
        deadlineTasks.assignAll(success.tasks ?? []);
        isLoading.value = false;
      },
    );
  }

  void pinnedATask({required PinnedATaskModel pinnedATask}) async {
    isLoading.value = true;
    final result = await taskService.pinnedATask(pinnedATask: pinnedATask);
    result.fold(
      (error) {
        isLoading.value = false;
        log('${error.error}', name: 'Error from pinnedATask ');
      },
      (success) {
        log("${success.message}");
        isLoading.value = false;
        // fetchAllPinnedTasks();

        update();
      },
    );
  }

  void fetchAllPinnedTasks() async {
    isLoading.value = true;
    final result = await taskService.getAllPinnedTasks();
    result.fold(
      (failure) {
        isLoading.value = false;
        log(failure.message.toString());
      },
      (success) {
        isLoading.value = false;
        // allPinnedTasks.assignAll(success.pinnedTasks ?? []);
      },
    );
  }

  void unpinATask({required UnpinATaskModel unpinATask}) async {
    isLoading.value = true;
    final result = await taskService.unpinATask(unpinATask: unpinATask);
    result.fold(
      (failure) {
        isLoading.value = false;
        log(failure.message.toString());
      },
      (success) {
        isLoading.value = false;
        log("${success.message}");
        // fetchAllPinnedTasks();
        update();
      },
    );
  }

  void filterByType({required FilterByTypeModel filterByType}) async {
    isLoading.value = true;
    final result = await taskService.filterByType(filterByType: filterByType);

    result.fold(
      (failure) {
        isLoading.value = false;
        log(failure.message.toString());
      },
      (success) {
        typeTasks.assignAll(success.tasks ?? []);
        isLoading.value = false;
        update();
      },
    );
  }

  void filterPinnedTasksByType(
      {required FilterPinnedTaskByTypeModel filterPinnedTask}) async {
    isLoading.value = true;
    final result = await taskService.filterPinnedTaskByType(
        filterPinnedTaskByType: filterPinnedTask);
    result.fold(
      (failure) {
        isLoading.value = false;
        log(failure.message.toString());
      },
      (success) {
        allPinnedTasks.assignAll(success.tasks ?? []);
        isLoading.value = false;
      },
    );
  }

  void acceptOrReject({required AcceptOrRejectModel acceptOrReject}) async {
    isLoading.value = true;
    final result =
        await taskService.acceptOrReject(acceptOrReject: acceptOrReject);
    result.fold(
      (error) {
        isLoading.value = false;
        log('${error.error}', name: 'Error from acceptOrReject ');
      },
      (success) {
        log("${success.message}");
        isLoading.value = false;
      },
    );
  }

  void searchParticipants({required UserSearchModel user}) async {
    final result = await taskService.participantsSearch(user: user);
    result.fold(
      (failure) {
        isLoading.value = false;
        log(failure.message.toString());
      },
      (success) {
        userslist.assignAll(success);
        isLoading.value = false;
      },
    );
  }
}
