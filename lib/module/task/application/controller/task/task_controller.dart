import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:bizkit/module/task/application/controller/home_controller/home_controller.dart';
import 'package:bizkit/module/task/data/service/task/task_service.dart';
import 'package:bizkit/module/task/domain/model/requests/accept_or_reject_model/accept_or_reject_model.dart';
import 'package:bizkit/module/task/domain/model/requests/received_requests_responce/received_requests_responce.dart';
import 'package:bizkit/module/task/domain/model/requests/send_requests_responce/sent_request.dart';
import 'package:bizkit/module/task/domain/model/task/filter_by_deadline_model/filter_by_deadline_model.dart';
import 'package:bizkit/module/task/domain/model/task/filter_by_type_model/filter_by_type_model.dart';
import 'package:bizkit/module/task/domain/model/task/filter_pinned_task_by_type_model/filter_pinned_task_by_type_model.dart';
import 'package:bizkit/module/task/domain/model/task/get_single_task_model/get_single_task_model.dart';
import 'package:bizkit/module/task/domain/model/task/get_task_responce/get_task_responce.dart';
import 'package:bizkit/module/task/domain/model/task/kill_a_task_model/kill_a_task_model.dart';
import 'package:bizkit/module/task/domain/model/task/pinned_task/pinned_a_task_model/pinned_a_task_model.dart';
import 'package:bizkit/module/task/domain/model/task/pinned_task/unpin_a_task_model/unpin_a_task_model.dart';
import 'package:bizkit/module/task/domain/model/task/self_to_others_type_responce/task.dart';
import 'package:bizkit/module/task/domain/model/task/spot_light_task/spot_light_task.dart';
import 'package:bizkit/module/task/domain/model/task/sub_task/delete_sub_task_model/delete_sub_task_model.dart';
import 'package:bizkit/module/task/domain/model/task/sub_task/edit_sub_task_model/edit_sub_task_model.dart';
import 'package:bizkit/module/task/domain/model/task/sub_task/sub_task_add_model/sub_task_add_model.dart';
import 'package:bizkit/module/task/domain/model/task/task_model/assigned_to.dart';
import 'package:bizkit/module/task/domain/model/task/task_model/attachment.dart';
import 'package:bizkit/module/task/domain/model/task/task_model/task_model.dart';
import 'package:bizkit/module/task/domain/model/task/tasks_count_model/tasks_count_model.dart';
import 'package:bizkit/module/task/domain/model/userSearch/user_search_model/user_search_model.dart';
import 'package:bizkit/module/task/domain/model/userSearch/user_search_success_responce/user_search_success_responce.dart';
import 'package:bizkit/module/task/domain/repository/service/task_repo.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/utils/intl/intl_date_formater.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:intl/intl.dart';

// import 'package:intl/intl.dart';

import '../../../domain/model/task/task_model/sub_task.dart';

class CreateTaskController extends GetxController {
  //Controller for page comes bottom
  final ScrollController scrollController = ScrollController();

  Rx<TaskType> createTaskTupe = TaskType.official.obs;
  Rx<PriorityLevel> createPriorityLevel = PriorityLevel.medium.obs;
  Rx<FilterTypes> filterTypes = FilterTypes.all.obs;
  Rx<RecurringTimePeriod> createRecurringTimePeriod =
      RecurringTimePeriod.none.obs;
  RxBool createRecurring = false.obs;
  RxString deadlineDate = ''.obs;

  // List of participants involved in the task
  var participants = <TaskAssignedTo>[].obs;

  // Lists for storing various task types and deadlines
  RxList<Task> typeTasks = <Task>[].obs;
  RxList<Task> deadlineTasks = <Task>[].obs;
  RxList<SentRequest> sentRequests = <SentRequest>[].obs;
  RxList<ReceivedRequestsResponce> receivedRequests =
      <ReceivedRequestsResponce>[].obs;
  RxList<Task> allPinnedTasks = <Task>[].obs;
  RxList<UserSearchSuccessResponce> userslist =
      <UserSearchSuccessResponce>[].obs;
  RxList<Task> tasksSearch = <Task>[].obs;
  RxList<Task> selectedTasks = <Task>[].obs;
  RxMap<String, RxInt> tasksCounts = <String, RxInt>{}.obs;
  // Holds a single task response
  Rx<GetTaskResponce> singleTask = GetTaskResponce().obs;

  // Reactive list to store selected files
  RxList<PlatformFile> selectedFiles = <PlatformFile>[].obs;

  // List of subtasks related to the main task
  RxList<SubTask> subTasks = <SubTask>[].obs;

  // List of all available tags
  var tags = <String>[].obs;

  // List of selected tags
  var selectedTags = <String>[].obs;

  // List of colors for tags
  final List<Color> tagColor = [kred, kblue, kgreen, kgrey, kOrange];

  @override
  void onInit() {
    final DateTime todaydate = DateTime.now();
    // Initialize with today's date for deadline filtering
    deadlineDate.value = DateFormat('yyyy-MM-dd').format(todaydate);
    taskFilterByDeadline(
        filterByDeadline: FilterByDeadlineModel(date: deadlineDate.value));
    getTasksCountWithoutDate();
    super.onInit();
  }

  // Test task ID for validation or testing purposes
  String testTaskId = '';

  // Reactive variable for loading state
  RxBool isLoading = false.obs;
  RxBool searchLoading = false.obs;
  RxBool pinLoader = false.obs;

  // Task service instance for API interactions
  final TaskRepo taskService = TaskService();

  Rx<DateTime> selectedDate = DateTime.now().obs;

  // Converts TaskType enum to string
  String taskTypeEnumToString(TaskType tasktype) {
    switch (tasktype) {
      case TaskType.official:
        return 'official';
      case TaskType.personal:
        return 'personal';
      case TaskType.others:
        return 'others';
      default:
        return '';
    }
  }

  void selctDate(DateTime value) {
    selectedDate.value = value;
  }

  // Method to remove a participant
  void removeParticipant(TaskAssignedTo participant) {
    participants.remove(participant);
  }

  // Converts PriorityLevel enum to string
  String priorityLevelEnumToString(PriorityLevel priorityLevel) {
    switch (priorityLevel) {
      case PriorityLevel.medium:
        return 'medium';
      case PriorityLevel.low:
        return 'low';
      case PriorityLevel.high:
        return 'high';
      default:
        return '';
    }
  }

  // Converts FilterTypes enum to string
  String filterTypeToString(FilterTypes filterTypes) {
    switch (filterTypes) {
      case FilterTypes.all:
        return 'all';
      case FilterTypes.self_to_self:
        return 'self_to_self';
      case FilterTypes.self_to_others:
        return 'self_to_others';
      case FilterTypes.others_to_self:
        return 'others_to_self';
      default:
        return '';
    }
  }

  // Changes the task type based on user selection
  void changeTaskType(TaskType type) {
    createTaskTupe.value = type;
  }

  // Changes the priority level based on user selection
  void changePriorityLevel(PriorityLevel level) {
    createPriorityLevel.value = level;
  }

  // Changes the recurring time period based on user selection
  void changeRecurringTimePeriod(RecurringTimePeriod period) {
    createRecurringTimePeriod.value = period;
  }

  // Toggles the recurring task state
  void changeCreateRecorring(bool value) {
    createRecurring.value = value;
  }

  // Clears the list of selected files
  void clearSelectedFiles() {
    selectedFiles.clear();
  }

  // Function to toggle the selection of a tag
  void toggleTagSelection(String tag) {
    if (selectedTags.contains(tag)) {
      selectedTags.remove(tag);
    } else {
      selectedTags.add(tag);
    }
  }

  // Function to add a new tag to the list
  void addTag(String tag) {
    if (tag.isNotEmpty && !tags.contains(tag)) {
      tags.add(tag);
    }
  }

  // Method to handle file selection
  void pickFiles() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: true);
    if (result != null) {
      selectedFiles.addAll(result.files);
    }
  }

  // Converts selected files to Attachment objects for task creation
  List<Attachment> convertFilesToAttachments(List<PlatformFile> files) {
    return files.map((file) {
      return Attachment(
        attachment: base64Encode(File(file.path!).readAsBytesSync()),
        type: file.extension,
      );
    }).toList();
  }

  // Creates a new task with the provided task model
  void createNewTask({required TaskModel task}) async {
    isLoading.value = true;

    List<Attachment> attachments =
        convertFilesToAttachments(selectedFiles).cast<Attachment>();
    task.attachments = attachments;

    log('task model ${task.toJson()}');
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
        clearSelectedFiles();
        subTasks.clear();
        selectedTags.clear();
        tags.clear();
        fetchSendRequests();
        participants.clear();
        attachments.clear();
        deadlineDate.value = '';

        // Filter tasks by type after creation
        filterByType(filterByType: FilterByTypeModel(taskType: 'all'));
        getTasksCountWithoutDate();
      },
    );
  }

  // Edits an existing task with the provided task model
  void editTask({required TaskModel taskModel}) async {
    isLoading.value = true;
    final result = await taskService.editTask(taskModel: taskModel);
    result.fold(
      (error) {
        isLoading.value = false;
        log('${error.error}', name: 'Error from Edit Task');
      },
      (success) {
        isLoading.value = false;
        log('${success.message}');

        // Filter tasks by type after editing
        filterByType(filterByType: FilterByTypeModel(taskType: 'all'));
      },
    );
  }

  // Fetches the list of sent requests
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

  // Fetches the list of received requests
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

  // Filters tasks by deadline using the provided model
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
        log('deadlineTasks :=> $deadlineTasks');
        isLoading.value = false;
      },
    );
  }

  // add spotlight to a task
  void spotLightTask({required SpotLightTask spotLightTask}) async {
    final result =
        await taskService.spotLightTask(spotLightTask: spotLightTask);
    result.fold(
      (failure) {
        log(failure.message.toString());
      },
      (success) {
        log('SpotLightTask :=> $deadlineTasks');
      },
    );
  }

  // Pins a task using the provided model
  void pinnedATask({required PinnedATaskModel pinnedATask}) async {
    isLoading.value = true;
    pinLoader.value = true;
    final result = await taskService.pinnedATask(pinnedATask: pinnedATask);
    result.fold(
      (error) {
        pinLoader.value = false;
        log('${error.error}', name: 'Error from pinnedATask ');
      },
      (success) {
        log("${success.message}");
        update(); // Update the UI or state
        if (pinnedATask.isPinned == false) {
          print('pinned length => ${allPinnedTasks.length}');
          allPinnedTasks.removeWhere((e) => e.id == pinnedATask.taskId);
          pinLoader.value = false;
        }
        print('pinned length => ${allPinnedTasks.length}');
        filterPinnedTasksByType(
            filterPinnedTask: FilterPinnedTaskByTypeModel(
                taskType: Get.find<TaskHomeScreenController>()
                    .taskCategory
                    .value
                    .replaceAll(' ', '_')
                    .toLowerCase(),
                isPinned: true));
        filterByType(
            filterByType: FilterByTypeModel(
                taskType: Get.find<TaskHomeScreenController>()
                    .taskCategory
                    .value
                    .replaceAll(' ', '_')
                    .toLowerCase()));
        pinLoader.value = false;
      },
    );
  }

  // Fetches all pinned tasks
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

  // Unpins a task using the provided model
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
        update(); // Update the UI or state
      },
    );
  }

  // Filters tasks by type using the provided model
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
        update(); // Update the UI or state
      },
    );
  }

  // Filters pinned tasks by type using the provided model
  void filterPinnedTasksByType(
      {required FilterPinnedTaskByTypeModel filterPinnedTask,
      bool pinn = false}) async {
    isLoading.value = true;
    print('pinned task => ${filterPinnedTask.toJson()}');
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
    update();
  }

  // Accepts or rejects a request using the provided model
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

  // Searches for participants based on user input
  void searchParticipants({required UserSearchModel user}) async {
    searchLoading.value = true;
    final result = await taskService.participantsSearch(user: user);
    update();
    result.fold(
      (failure) {
        searchLoading.value = false;
        log(failure.message.toString());
        update();
      },
      (success) {
        userslist.assignAll(success);
        searchLoading.value = false;
        update();
      },
    );
  }

  // Fetches a single task using the provided model
  void fetchSingleTask({required GetSingleTaskModel singleTaskModel}) async {
    isLoading.value = true;
    final result = await taskService.getTask(singleTaskModel: singleTaskModel);
    result.fold(
      (failure) {
        isLoading.value = false;
        log(failure.message.toString());
      },
      (success) {
        log('Get Single task : $success');
        singleTask.value = success;
        isLoading.value = false;
      },
    );
  }

  // Searches for tasks based on the search term
  void searchTasks({required String searchItem}) async {
    isLoading.value = true;

    final result = await taskService.taskSearch(
        taskSearchItem: UserSearchModel(searchTerm: searchItem));
    result.fold(
      (failure) {
        isLoading.value = false;
        log(failure.message.toString());
      },
      (success) {
        if (success.tasks != null) {
          tasksSearch.clear();
          tasksSearch.addAll(success.tasks!);
        } else {
          log("Received null tasks in the response");
        }
      },
    );
  }

  // Adds a new subtask using the provided model
  void addSubTask({required SubTaskAddModel newsubtask}) async {
    isLoading.value = true;

    final result = await taskService.addSubTask(newsubtask: newsubtask);
    result.fold(
      (failure) {
        isLoading.value = false;
        log(failure.message.toString());
      },
      (success) {
        log("${success.message}");
        isLoading.value = false;
      },
    );
  }

  // Deletes a subtask using the provided model
  void deleteSubTask({required DeleteSubTaskModel deletesubtask}) async {
    isLoading.value = true;

    final result =
        await taskService.deleteSubTask(deletesubtask: deletesubtask);
    result.fold(
      (failure) {
        isLoading.value = false;
        log(failure.message.toString());
      },
      (success) {
        log("${success.message}");
        isLoading.value = false;
      },
    );
  }

  // Edits an existing subtask using the provided model
  void editSubTask({required EditSubTaskModel editsubtask}) async {
    isLoading.value = true;

    final result = await taskService.editSubTask(editsubtask: editsubtask);
    result.fold(
      (failure) {
        isLoading.value = false;
        log(failure.message.toString());
      },
      (success) {
        log("${success.message}");
        isLoading.value = false;
      },
    );
  }

  // Adds a subtask to the list before task creation
  void createSubtaskBeforeTaskCreation({required SubTask subTask}) async {
    subTasks.add(subTask);
  }

  // Kill a task
  void killatask({required KillATaskModel killAtaskModel}) async {
    isLoading.value = true;
    final result = await taskService.killATask(killatask: killAtaskModel);
    result.fold(
      (failure) {
        isLoading.value = false;
        log(failure.message.toString());
      },
      (success) {
        log("${success.message}");
        isLoading.value = false;
      },
    );
  }

  void getTasksCountWithoutDate() async {
    isLoading.value = true;
    final result = await taskService.getTasksCountsWithDate(
        tasksCountModel: TasksCountModel(
            fromDate: DateTimeFormater.dateTimeFormat(
                DateTime.now().add(const Duration(days: 31)))));
    result.fold(
      (failure) {
        isLoading.value = false;
        log(failure.message.toString());
      },
      (success) {
        for (var element in success.taskCounts.keys) {
          tasksCounts[element] = success.taskCounts[element]!.obs;
        }

        isLoading.value = false;
      },
    );
  }
}
