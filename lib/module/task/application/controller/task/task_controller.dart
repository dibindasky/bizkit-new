import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:bizkit/core/model/pagination_query/pagination_query.dart';
import 'package:bizkit/module/task/application/controller/folder/folder_controller.dart';
import 'package:bizkit/module/task/application/controller/home_controller/home_controller.dart';
import 'package:bizkit/module/task/data/service/task/task_service.dart';
import 'package:bizkit/module/task/data/sqfilte/task/task_local_service.dart';
import 'package:bizkit/module/task/domain/model/folders/edit_task_responce/edit_task_responce.dart';
import 'package:bizkit/module/task/domain/model/folders/remove_user_from_assigned_model/remove_user_from_assigned_model.dart';
import 'package:bizkit/module/task/domain/model/quick_task/complete_quick_task/complete_quick_task.dart';
import 'package:bizkit/module/task/domain/model/quick_task/create_quick_task/create_quick_task.dart';
import 'package:bizkit/module/task/domain/model/quick_task/quick_tasks_responce/quick_tasks.dart';
import 'package:bizkit/module/task/domain/model/quick_task/update_quick_task/update_quick_task.dart';
import 'package:bizkit/module/task/domain/model/requests/accept_or_reject_model/accept_or_reject_model.dart';
import 'package:bizkit/module/task/domain/model/requests/received_requests_responce/task.dart';
import 'package:bizkit/module/task/domain/model/requests/send_requests_responce/sent_request.dart';
import 'package:bizkit/module/task/domain/model/task/add_new_assined_users_model/add_new_assined_users_model.dart';
import 'package:bizkit/module/task/domain/model/task/completed_or_killed_success_responce/task.dart';
import 'package:bizkit/module/task/domain/model/task/completed_task_model/completed_task_model.dart';
import 'package:bizkit/module/task/domain/model/task/filter_by_deadline_model/filter_by_deadline_model.dart';
import 'package:bizkit/module/task/domain/model/task/filter_by_type_model/filter_by_type_model.dart';
import 'package:bizkit/module/task/domain/model/task/filter_pinned_task_by_type_model/filter_pinned_task_by_type_model.dart';
import 'package:bizkit/module/task/domain/model/task/get_single_task_model/get_single_task_model.dart';
import 'package:bizkit/module/task/domain/model/task/get_task_responce/assigned_to_detail.dart';
import 'package:bizkit/module/task/domain/model/task/get_task_responce/get_task_responce.dart';
import 'package:bizkit/module/task/domain/model/task/kill_a_task_model/kill_a_task_model.dart';
import 'package:bizkit/module/task/domain/model/task/pinned_task/pinned_a_task_model/pinned_a_task_model.dart';
import 'package:bizkit/module/task/domain/model/task/pinned_task/unpin_a_task_model/unpin_a_task_model.dart';
import 'package:bizkit/module/task/domain/model/task/self_to_others_type_responce/task.dart';
import 'package:bizkit/module/task/domain/model/task/spot_light_task/spot_light_task.dart';
import 'package:bizkit/module/task/domain/model/task/sub_task/completed_sub_task/completed_sub_task.dart';
import 'package:bizkit/module/task/domain/model/task/sub_task/completed_sub_task_success_responce/sub_task.dart';
import 'package:bizkit/module/task/domain/model/task/sub_task/delete_sub_task_model/delete_sub_task_model.dart';
import 'package:bizkit/module/task/domain/model/task/sub_task/edit_sub_task_model/edit_sub_task_model.dart';
import 'package:bizkit/module/task/domain/model/task/sub_task/sub_task_add_model/sub_task_add_model.dart';
import 'package:bizkit/module/task/domain/model/task/task_expense_and_time_success_responce/task_expense_and_time_success_responce.dart';
import 'package:bizkit/module/task/domain/model/task/task_model/assigned_to.dart';
import 'package:bizkit/module/task/domain/model/task/task_model/attachment.dart';
import 'package:bizkit/module/task/domain/model/task/task_model/task_model.dart';
import 'package:bizkit/module/task/domain/model/task/tasks_count_model/tasks_count_model.dart';
import 'package:bizkit/core/model/userSearch/user_search_model/user_search_model.dart';
import 'package:bizkit/core/model/userSearch/user_search_success_responce/user_search_success_responce.dart';
import 'package:bizkit/module/task/domain/repository/service/task_repo.dart';
import 'package:bizkit/module/task/domain/repository/sqfilte/task_local_repo.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/debouncer/debouncer.dart';
import 'package:bizkit/utils/intl/intl_date_formater.dart';
import 'package:bizkit/utils/snackbar/snackbar.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../domain/model/task/task_model/sub_task.dart';
import 'package:bizkit/module/task/domain/model/task/get_task_responce/sub_task.dart'
    as subtask;

class CreateTaskController extends GetxController {
  final Debouncer debouncer = Debouncer(milliseconds: 300);

  /// ScrollControllers for different task-related lists and search functionality
  final ScrollController scrollController =
      ScrollController(); // search participants scroll controller
  final ScrollController taskSearchScrollController =
      ScrollController(); // Scroll controller for task search
  final ScrollController deadlineTasksScrollController =
      ScrollController(); // Scroll controller for tasks filtered by deadline
  final ScrollController typeTasksScrollController =
      ScrollController(); // Scroll controller for tasks filtered by type
  final ScrollController pinnedTasksScrollController =
      ScrollController(); // Scroll controller for pinned tasks
  final ScrollController quickTasksScrollController =
      ScrollController(); // Scroll controller for quick tasks

// Stores selected task type for task creation
  Rx<TaskType> createTaskTupe = TaskType.official.obs;

  // Stores selected priority level for task creation
  Rx<PriorityLevel> createPriorityLevel = PriorityLevel.medium.obs;

  // Stores selected filter type for task filtering
  Rx<FilterTypes> filterTypes = FilterTypes.all.obs;

  // Stores selected recurring time period for task creation
  Rx<RecurringTimePeriod> createRecurringTimePeriod =
      RecurringTimePeriod.none.obs;

  // Boolean to determine if the task is recurring
  RxBool createRecurring = false.obs;

  // Stores deadline date for filtering tasks
  RxString deadlineDate = ''.obs;

  // Stores deadline date for creating a new task
  RxString deadlineDateForTaskCreation = ''.obs;

  // Stores deadline date for editing an existing task
  RxString deadlineDateForTaskEdit = ''.obs;

  // Boolean to detect changes in task count
  RxBool taskscountChanged = false.obs;

  /// Task type filter string [  Stores selected task TYPE in string format ]
  RxString taskType = ''.obs;

  /// Lists to store participants and user search responses
// List of users available for participant selection
  var userslistNew = <UserSearchSuccessResponce>[].obs;

  // List of participants assigned for task editing
  var participantsForEditTask = <AssignedToDetail>[].obs;

// Stores time and expense information related to tasks
  RxList<TaskExpenseAndTimeSuccessResponce> taskExpenseAndTime =
      <TaskExpenseAndTimeSuccessResponce>[].obs;

// Scroll controller for participant search
  ScrollController searchScrollController =
      ScrollController(); // Scroll controller for participant search

  /// Lists for storing task data filtered by different criteria

  // List of tasks filtered by type
  RxList<Task> typeTasks = <Task>[].obs;

  // List of tasks filtered by deadline
  RxList<Task> deadlineTasks = <Task>[].obs;

  // List of sent task requests
  RxList<SentRequest> sentRequests = <SentRequest>[].obs;

  // List of pinned tasks
  RxList<Task> allPinnedTasks = <Task>[].obs;

  // List of completed tasks
  RxList<TasksCompletedOrKilled> completedTasks =
      <TasksCompletedOrKilled>[].obs;

  // List of killed tasks
  RxList<TasksCompletedOrKilled> killedTasks = <TasksCompletedOrKilled>[].obs;

  // List of users for task assignment search
  RxList<UserSearchSuccessResponce> userslist =
      <UserSearchSuccessResponce>[].obs;

  // List of tasks based on search results
  RxList<Task> tasksSearch = <Task>[].obs;

  // List of tasks selected by the user
  RxList<Task> selectedTasks = <Task>[].obs;

  // List of received task requests
  RxList<ReceivedTask> receivedRequests = <ReceivedTask>[].obs;

  // Map of task counts
  RxMap<String, RxInt> tasksCounts = <String, RxInt>{}.obs;

  // List of completed subtasks
  RxList<CompletedSubTasks> completedSubTasks = <CompletedSubTasks>[].obs;

  // List of quick tasks
  RxList<QuickTasks> quickTasks = <QuickTasks>[].obs;

// Pagination controls for different task lists
  int pageNumber = 1, pageSize = 5; // Pagination for general tasks
  int taskSearchPageNumber = 1,
      taskSearchPageSize = 8; // Pagination for task search results
  int deadlineTasksPageNumber = 1,
      deadlineTasksPageSize = 11; // Pagination for deadline-filtered tasks
  int typeTasksPageNumber = 1,
      typeTasksPageSize = 15; // Pagination for type-filtered tasks

  int quickTasksPageNumber = 1,
      quickTasksPageSize = 10; // Pagination for quick tasks

  int pinnedTasksPageNumber = 1; // Pagination for pinned tasks

// Holds the data of a single task
  var singleTask = GetTaskResponce().obs;

  // List of selected files for upload (e.g., attachments)
  RxList<PlatformFile> selectedFiles = <PlatformFile>[].obs;

// List of subtasks for a given task
  RxList<SubTask> subTasks = <SubTask>[].obs;

  /// Lists to store available and selected tags for tasks
  var tags = <String>[].obs; // List of available tags for task creation
  var tagsForEdit = <String>[].obs; // List of available tags for task editing

  /// Predefined colors for tags
  final List<Color> tagColor = [kred, kblue, kgreen, kgrey, kOrange];

  // Text editing controller for participant search input
  final TextEditingController searchController = TextEditingController();

  //  Text editing controller for task search input
  final TextEditingController taskSearchController = TextEditingController();

  @override
  void onInit() {
    getTasksCountWithoutDate(); // Fetch task counts without date filtering
    final DateTime todaydate = DateTime.now(); // Get today's date
    deadlineDate.value = DateFormat('yyyy-MM-dd')
        .format(todaydate); // Set today's date as default deadline

    taskFilterByDeadline(); // Filter tasks by today's deadline

    // Add scroll listeners for various scroll controllers
    searchScrollController.addListener(searchParticipantsScrollListener);
    taskSearchScrollController.addListener(tasksSearchScrollListener);
    deadlineTasksScrollController.addListener(deadlineTasksScrollListener);
    typeTasksScrollController.addListener(typeTasksScrollListener);
    pinnedTasksScrollController.addListener(pinnedTasksScrollListener);
    quickTasksScrollController.addListener(quickTasksScrollListener);
    super.onInit();
  }

// Test task ID for validation or testing purposes
  String testTaskId = ''; // Placeholder for a test task ID

// Error state for fetching single task data
  RxBool fetchSingleTaskError =
      false.obs; // Boolean for tracking errors when fetching a single task

// Loading states for various UI components
  RxBool isLoading = false.obs; // General loading state

  RxBool deadlineTasksLoadMoreLoading =
      false.obs; // Loading state for loading more deadline tasks

  RxBool loadgingForFilterByType =
      false.obs; // Loading state for filtering tasks by type

  RxBool filterByTypeLoading =
      false.obs; // Loading state when filtering tasks by type

  RxBool pinnedTasksLoadMoreLoading =
      false.obs; // Loading state for loading more pinned tasks

  RxBool filterByTypeLoadMoreLoading =
      false.obs; // Loading state for loading more type-filtered tasks

  RxBool taskCreationLoading = false.obs; // Loading state during task creation

  RxBool taskEditLoading = false.obs; // Loading state during task editing

  RxBool searchLoading = false.obs; // Loading state for participant search

  RxBool searchLoadMoreLoading =
      false.obs; // Loading state for loading more participants during search

  RxBool taskSearchLoading = false.obs; // Loading state for task search results

  RxBool taskSearchLoadMoreLoading =
      false.obs; // Loading state for loading more task search results

  RxBool pinLoader = false.obs; // Loading state for pinning tasks

  RxBool isLoadingForSpotLight =
      false.obs; // Loading state for spotlight feature

  RxBool taksListLoading = false.obs; // Loading state for task list

  RxBool loadingForSendRequests =
      false.obs; // Loading state for sending task requests

  RxBool loadingForRecivedRequests =
      false.obs; // Loading state for receiving task requests

  RxBool loadingFortTaskExpenseAndTime =
      false.obs; // Loading state for fetching task time and expense data

  RxBool loadingForQuickTask = false.obs; // Loading state for quick task

  RxBool loadingForAllQuickTasks =
      false.obs; // Loading state for all quick tasks

  RxBool quickTasksLoadMore =
      false.obs; // Loading state for all quick tasks loadmore

// Keys to track task time and expense data
  RxList<String> taskTotalTimeKeys =
      <String>[].obs; // List of keys for task total time
  RxList<String> taskExpenseKeys =
      <String>[].obs; // List of keys for task expenses

// Combined keys for task total time and expense data
  RxList<String> taskTotalTimeExpenseKeys =
      <String>[].obs; // List of combined keys for total time and expense data

  // Task service instance for API interactions
  final TaskRepo taskService = TaskService();

  /// Task Local instance for Sql interactions
  final TaskLocalRepo taskLocalService = TaskLocalService();

  Rx<DateTime> selectedDate = DateTime.now().obs;

  void changeFilterTaskType(String taskType) {
    this.taskType.value = taskType;
  }

  void searchParticipantsScrollListener() {
    if (searchScrollController.position.pixels ==
        searchScrollController.position.maxScrollExtent) {
      searchParticipantsLoadMore();
    }
  }

  void tasksSearchScrollListener() {
    if (taskSearchScrollController.position.pixels ==
        taskSearchScrollController.position.maxScrollExtent) {
      searchTasksLoadMore();
    }
  }

  void deadlineTasksScrollListener() {
    if (deadlineTasksScrollController.position.pixels ==
        deadlineTasksScrollController.position.maxScrollExtent) {
      taskFilterByDeadlineLoadMore();
    }
  }

  void typeTasksScrollListener() {
    if (typeTasksScrollController.position.pixels ==
        typeTasksScrollController.position.maxScrollExtent) {
      filterByTypeTasksLoadMore();
    }
  }

  void pinnedTasksScrollListener() {
    if (pinnedTasksScrollController.position.pixels ==
        pinnedTasksScrollController.position.maxScrollExtent) {
      filterPinnedTasksByTypeLoadMore();
    }
  }

  void quickTasksScrollListener() {
    if (quickTasksScrollController.position.pixels ==
        quickTasksScrollController.position.maxScrollExtent) {
      fetchAllQuickTasksLoadMore();
    }
  }

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
  void removeParticipant(UserSearchSuccessResponce participant) {
    userslistNew.remove(participant);
  }

  void removeTag(dynamic tag) {
    tags.remove(tag);
  }

  void removeTagForEdit(dynamic tag) {
    tagsForEdit.remove(tag);
  }

  void removeParticipantsForEdit(dynamic participant) {
    participantsForEditTask.remove(participant);
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
      case FilterTypes.selftoself:
        return 'self_to_self';
      case FilterTypes.selftoothers:
        return 'self_to_others';
      case FilterTypes.otherstoself:
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

  // Function to add a new tag to the list
  void addTag(String tag) {
    if (tag.isNotEmpty && !tags.contains(tag)) {
      tags.add(tag);
    }
  }

  // Method to handle file selection
  void pickFiles() async {
    final result = await FilePicker.platform
        .pickFiles(allowedExtensions: ['jpg', 'pdf'], type: FileType.custom);
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
  void createNewTask(
      {required TaskModel task,
      required BuildContext context,
      required int navigationId}) async {
    taskCreationLoading.value = true;

    List<Attachment> attachments =
        convertFilesToAttachments(selectedFiles).cast<Attachment>();
    task.attachments = attachments;
    task.assignedTo = userslistNew
        .map(
          (e) => TaskAssignedTo(user: e.userId, isAccepted: 'pending'),
        )
        .toList();

    final result = await taskService.createTask(task: task);

    result.fold(
      (error) {
        taskCreationLoading.value = false;
        Get.back(id: navigationId);
        clearSelectedFiles();
        subTasks.clear();
        tags.clear();
        fetchSendRequests();
        attachments.clear();
        attachments.clear;
        userslistNew.clear();
        deadlineDateForTaskCreation.value = '';
        showSnackbar(context,
            message: errorMessage, backgroundColor: kred, textColor: kblack);
      },
      (success) {
        deadlineDateForTaskCreation.value = '';
        getTasksCountWithoutDate();
        taskCreationLoading.value = false;

        testTaskId = success.taskId.toString();
        Get.back(id: navigationId);
        clearSelectedFiles();
        subTasks.clear();
        tags.clear();
        fetchSendRequests();
        attachments.clear();
        attachments.clear;
        userslistNew.clear();
        Get.find<TaskHomeScreenController>().fetchRecentTasks();
        showSnackbar(
          context,
          message: 'Task created successfully',
          backgroundColor: neonShade,
          textColor: kblack,
        );
      },
    );
  }

  String getTotalCompletedSubtasksDuration() {
    final subtasks = singleTask.value.subTask ?? [];
    final completedSubtasks =
        subtasks.where((subtask) => subtask.isCompleted ?? false).toList();
    Duration totalDuration = const Duration();

    for (var subtask in completedSubtasks) {
      final duration = _parseDuration(subtask.duration);
      totalDuration += duration ?? const Duration();
    }

    return _formatDuration(totalDuration);
  }

  Duration? _parseDuration(String? duration) {
    if (duration == null || duration.isEmpty) return null;

    try {
      final parts = duration.split(':');
      if (parts.length == 3) {
        final hours = int.parse(parts[0]);
        final minutes = int.parse(parts[1]);

        return Duration(
          hours: hours,
          minutes: minutes,
        );
      }
    } catch (e) {
      log('Error parsing duration: $e');
    }
    return null;
  }

  String _formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = (duration.inMinutes % 60);

    return '$hours Hr $minutes Min';
  }

  // Edits an existing task with the provided task model
  void editTask({
    required EditTaskModel taskModel,
    required String taskId,
    required BuildContext context,
  }) async {
    taskEditLoading.value = true;

    List<TaskAssignedTo> templist = [];
    for (var i = 0; i < participantsForEditTask.length; i++) {
      if (!(singleTask.value.assignedToDetails ?? []).any(
        (element) => element.userId == participantsForEditTask[i].userId,
      )) {
        templist.add(TaskAssignedTo(
            user: participantsForEditTask[i].userId,
            isAccepted: participantsForEditTask[i].isAccepted));
      }
    }
    List<AssignedToDetail> modelList =
        singleTask.value.assignedToDetails ?? <AssignedToDetail>[];
    for (int i = 0; i < modelList.length; i++) {
      if (participantsForEditTask.any((e) => e.userId == modelList[i].userId)) {
        modelList.removeAt(i--);
      }
    }

    taskModel.assignedTo = templist +
        modelList
            .map(
              (e) => TaskAssignedTo(user: e.userId, isAccepted: e.isAccepted),
            )
            .toList();

    taskModel.tags = tagsForEdit;

    final result = await taskService.editTask(taskModel: taskModel);
    result.fold(
      (error) {
        taskEditLoading.value = false;
        showSnackbar(context,
            message: errorMessage, backgroundColor: kred, textColor: kblack);
        log('${error.error}', name: 'Error from Edit Task');
      },
      (success) {
        taskEditLoading.value = false;
        log('${success.message}');
        showSnackbar(
          context,
          message: 'Task edited successfully',
          backgroundColor: neonShade,
          textColor: kblack,
          duration: 4,
        );
        Navigator.of(context).pop();
        fetchSingleTask(singleTaskModel: GetSingleTaskModel(taskId: taskId));
      },
    );
  }

  // Complete a Task
  void completeTask({
    required CompletedTaskModel completedTaskModel,
    required BuildContext context,
  }) async {
    isLoading.value = true;
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    final result =
        await taskService.completeTask(completedTaskModel: completedTaskModel);

    result.fold(
      (failure) {
        isLoading.value = false;
        scaffoldMessenger.showSnackBar(
          const SnackBar(
            content: Text(errorMessage),
            backgroundColor: kred,
          ),
        );
        GoRouter.of(context).pop();
        log(failure.message.toString());
      },
      (success) {
        log('${success.message}');
        scaffoldMessenger.showSnackBar(
          const SnackBar(
            content: Text('Complete task successfully'),
            backgroundColor: neonShade,
          ),
        );
        GoRouter.of(context).pop();
        isLoading.value = false;
      },
    );
  }

  // Fetches the list of sent requests
  void fetchSendRequests() async {
    loadingForSendRequests.value = true;
    final result = await taskService.getSendRequests();
    result.fold(
      (failure) {
        loadingForSendRequests.value = false;
        log(failure.message.toString());
      },
      (success) {
        loadingForSendRequests.value = false;
        sentRequests.assignAll(success.sentRequests ?? []);
      },
    );
  }

  // Fetches the list of received requests
  void fetchReceivedRequests() async {
    loadingForRecivedRequests.value = true;
    final result = await taskService.getReceivedRequests();
    result.fold(
      (failure) {
        loadingForRecivedRequests.value = false;
        log(failure.message.toString());
      },
      (success) {
        receivedRequests.assignAll(success.tasks ?? []);
        loadingForRecivedRequests.value = false;
      },
    );
  }

  // Filters tasks by deadline using the provided model
  void taskFilterByDeadline() async {
    taksListLoading.value = true;
    deadlineTasksPageNumber = 1;
    deadlineTasks.value = [];
    final result = await taskService.filterByDeadline(
        filterByDeadline: FilterByDeadlineModel(
      date: deadlineDate.value,
      page: deadlineTasksPageNumber,
      pageSize: deadlineTasksPageSize,
    ));
    result.fold(
      (failure) {
        log(failure.message.toString());
        taksListLoading.value = false;
      },
      (success) {
        deadlineTasks.assignAll(success.data ?? []);

        taksListLoading.value = false;
      },
    );
    // for (var task in deadlineTasks) {
    //   await taskLocalService.addTaskToLocalStorageIfNotPresentInStorage(
    //       taskModel: task);
    // }
  }

// / Filters tasks by deadline  - [ Pagination ]
  void taskFilterByDeadlineLoadMore() async {
    if (deadlineTasksLoadMoreLoading.value == true) {
      return;
    }
    deadlineTasksLoadMoreLoading.value = true;
    final result = await taskService.filterByDeadline(
        filterByDeadline: FilterByDeadlineModel(
      date: deadlineDate.value,
      page: ++deadlineTasksPageNumber,
      pageSize: deadlineTasksPageSize,
    ));
    result.fold(
      (failure) {
        log(failure.message.toString());
        deadlineTasksLoadMoreLoading.value = false;
      },
      (success) {
        deadlineTasks.addAll(success.data ?? []);

        // for (var task in success.data ?? []) {
        //   taskLocalService.addTaskToLocalStorageIfNotPresentInStorage(
        //       taskModel: task);
        // }

        deadlineTasksLoadMoreLoading.value = false;
      },
    );
  }

  // add spotlight to a task
  void spotLightTask({required SpotLightTask spotLightTask}) async {
    isLoadingForSpotLight.value = true;
    final result =
        await taskService.spotLightTask(spotLightTask: spotLightTask);
    result.fold(
      (failure) {
        isLoadingForSpotLight.value = false;
        log(failure.message.toString());
      },
      (success) {
        isLoadingForSpotLight.value = false;
        for (var i = 0; i < deadlineTasks.length; i++) {
          if (deadlineTasks[i].id == spotLightTask.taskId) {
            deadlineTasks[i] = deadlineTasks[i]
                .copyWith(spotlightOn: spotLightTask.spotLightStatus);
            break;
          }
        }
        for (var i = 0; i < tasksSearch.length; i++) {
          if (tasksSearch[i].id == spotLightTask.taskId) {
            tasksSearch[i] = tasksSearch[i]
                .copyWith(spotlightOn: spotLightTask.spotLightStatus);
            break;
          }
        }
        for (var i = 0; i < typeTasks.length; i++) {
          if (typeTasks[i].id == spotLightTask.taskId) {
            typeTasks[i] = typeTasks[i]
                .copyWith(spotlightOn: spotLightTask.spotLightStatus);
            break;
          }
        }
        for (var i = 0; i < allPinnedTasks.length; i++) {
          if (allPinnedTasks[i].id == spotLightTask.taskId) {
            allPinnedTasks[i] = allPinnedTasks[i]
                .copyWith(spotlightOn: spotLightTask.spotLightStatus);
            break;
          }
        }

        Get.find<TaskFolderController>()
            .folderSpotLightOnOrOff(spotLightTask: spotLightTask);
        Get.find<TaskFolderController>()
            .innerFolderSpotLightOnOrOff(spotLightTask: spotLightTask);
      },
    );
  }

  // Pins a task using the provided model
  void pinnedATask(
      {required PinnedATaskModel pinnedATask,
      required BuildContext context,
      required bool tasksFromTasksList,
      required bool tasksFromFilterSection}) async {
    if (tasksFromFilterSection) {
      filterByTypeLoading.value = true;
    }
    pinLoader.value = true;
    if (tasksFromTasksList) {
      taksListLoading.value = true;
    }
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    final result = await taskService.pinnedATask(pinnedATask: pinnedATask);
    result.fold(
      (error) {
        scaffoldMessenger.showSnackBar(
          const SnackBar(
            content: Text(errorMessage),
            backgroundColor: kred,
          ),
        );
        if (tasksFromFilterSection) {
          filterByTypeLoading.value = false;
        }
        if (tasksFromTasksList) {
          taksListLoading.value = false;
        }
        pinLoader.value = false;
      },
      (success) {
        update();
        if (pinnedATask.isPinned == false) {
          allPinnedTasks.removeWhere((e) => e.id == pinnedATask.taskId);
          pinLoader.value = false;
          if (tasksFromTasksList) {
            taksListLoading.value = false;
          }
          if (tasksFromFilterSection) {
            filterByTypeLoading.value = false;
          }
          update();
        }

        if (tasksFromFilterSection) {
          filterPinnedTasksByType();
          filterByType();
        }
        if (tasksFromTasksList) {
          taskFilterByDeadline();
        }

        scaffoldMessenger.showSnackBar(
          const SnackBar(
            content: Text('Successfully pinned this task'),
            backgroundColor: neonShade,
          ),
        );
        pinLoader.value = false;
        if (tasksFromTasksList) {
          taksListLoading.value = false;
        }
        if (tasksFromFilterSection) {
          filterByTypeLoading.value = false;
        }
        update();
      },
    );
  }

  // Unpins a task using the provided model
  void unpinATask(
      {required UnpinATaskModel unpinATask,
      required BuildContext context,
      required bool tasksFromTasksList,
      required bool tasksFromFilterSection}) async {
    isLoading.value = true;
    if (tasksFromFilterSection) {
      filterByTypeLoading.value = true;
    }
    if (tasksFromTasksList) {
      taksListLoading.value = true;
    }
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    final result = await taskService.unpinATask(unpinATask: unpinATask);
    result.fold(
      (failure) {
        isLoading.value = false;
        if (tasksFromTasksList) {
          taksListLoading.value = false;
        }
        if (tasksFromFilterSection) {
          filterByTypeLoading.value = false;
        }
        scaffoldMessenger.showSnackBar(
          const SnackBar(
            content: Text(errorMessage),
            backgroundColor: kred,
          ),
        );
        log(failure.message.toString());
      },
      (success) {
        isLoading.value = false;

        if (tasksFromFilterSection) {
          filterPinnedTasksByType();
          filterByType();
        }

        if (tasksFromTasksList) {
          taskFilterByDeadline();
        }
        if (tasksFromTasksList) {
          taksListLoading.value = false;
        }
        if (tasksFromFilterSection) {
          filterByTypeLoading.value = false;
        }
        scaffoldMessenger.showSnackBar(
          const SnackBar(
            content: Text('Successfully Unpinned this task'),
            backgroundColor: neonShade,
          ),
        );

        update(); // Update the UI or state
      },
    );
  }

  // Filters tasks by type using the provided model
  void filterByType() async {
    filterByTypeLoading.value = true;
    typeTasksPageNumber = 1;
    typeTasks.value = [];
    final result = await taskService.filterByType(
      filterByType: FilterByTypeModel(
        page: typeTasksPageNumber,
        pageSize: typeTasksPageSize,
        taskType: taskType.value,
      ),
    );

    result.fold(
      (failure) {
        filterByTypeLoading.value = false;
        log(failure.message.toString());
      },
      (success) {
        typeTasks.assignAll(success.data ?? []);
        filterByTypeLoading.value = false;
        update();
      },
    );
  }

  // Filters tasks by type - [ Pagination ]
  void filterByTypeTasksLoadMore() async {
    if (filterByTypeLoadMoreLoading.value == true) {
      return;
    }

    filterByTypeLoadMoreLoading.value = true;
    final result = await taskService.filterByType(
      filterByType: FilterByTypeModel(
        page: ++typeTasksPageNumber,
        pageSize: typeTasksPageSize,
        taskType: taskType.value,
      ),
    );

    result.fold(
      (failure) {
        filterByTypeLoadMoreLoading.value = false;
        log(failure.message.toString());
      },
      (success) {
        typeTasks.addAll(success.data ?? []);
        filterByTypeLoadMoreLoading.value = false;
        update();
      },
    );
  }

  // Filters pinned tasks by type using the provided model
  void filterPinnedTasksByType({bool pinn = false}) async {
    filterByTypeLoading.value = true;
    pinnedTasksPageNumber = 1;
    allPinnedTasks.value = [];

    final result = await taskService.filterPinnedTaskByType(
        filterPinnedTaskByType: FilterPinnedTaskByTypeModel(
      isPinned: true,
      page: pinnedTasksPageNumber,
      pageSize: typeTasksPageSize,
      taskType: taskType.value,
    ));
    update();
    result.fold(
      (failure) {
        filterByTypeLoading.value = false;
      },
      (success) {
        allPinnedTasks.assignAll(success.data ?? []);
        filterByTypeLoading.value = false;

        update();
      },
    );
  }

  void filterPinnedTasksByTypeLoadMore() async {
    if (pinnedTasksLoadMoreLoading.value == true) {
      return;
    }
    pinnedTasksLoadMoreLoading.value = true;
    final result = await taskService.filterPinnedTaskByType(
        filterPinnedTaskByType: FilterPinnedTaskByTypeModel(
      isPinned: true,
      page: ++pinnedTasksPageNumber,
      pageSize: typeTasksPageSize,
      taskType: taskType.value,
    ));
    update();
    result.fold(
      (failure) {
        pinnedTasksLoadMoreLoading.value = false;
        log(failure.message.toString());
      },
      (success) {
        allPinnedTasks.addAll(success.data ?? []);
        pinnedTasksLoadMoreLoading.value = false;

        update();
      },
    );
  }

  // Accepts or rejects a request using the provided model
  void acceptOrReject({
    required AcceptOrRejectModel acceptOrReject,
    required bool isAccept,
    required BuildContext context,
  }) async {
    isLoading.value = true;
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    final result =
        await taskService.acceptOrReject(acceptOrReject: acceptOrReject);
    result.fold(
      (error) {
        isLoading.value = false;
        scaffoldMessenger.showSnackBar(
          const SnackBar(
            content: Text(errorMessage),
            backgroundColor: kred,
          ),
        );
        log('${error.error}', name: 'Error from acceptOrReject ');
      },
      (success) {
        log("${success.message}");
        isAccept == true
            ? scaffoldMessenger.showSnackBar(
                const SnackBar(
                  content: Text('Task Accepted successfully'),
                  backgroundColor: neonShade,
                ),
              )
            : scaffoldMessenger.showSnackBar(
                const SnackBar(
                  content: Text('Task Rejected successfully'),
                  backgroundColor: neonShade,
                ),
              );
        isLoading.value = false;

        fetchReceivedRequests();
      },
    );
  }

  // Searches for participants based on user input
  void searchParticipants() {
    debouncer.run(() async {
      searchLoading.value = true;
      update(['searchUser']);
      userslist.value = [];
      pageNumber = 1;
      final user = UserSearchModel(
          page: pageNumber,
          pageSize: pageSize,
          searchTerm: searchController.text);

      final result = await taskService.participantsSearch(user: user);

      result.fold(
        (failure) {
          searchLoading.value = false;
          log(failure.message.toString());
          update(['searchUser']);
        },
        (success) {
          userslist.assignAll(success);
          searchLoading.value = false;
          update(['searchUser']);
        },
      );
    });
  }

  void searchParticipantsLoadMore() async {
    debouncer.run(() async {
      if (searchLoadMoreLoading.value == true) {
        return;
      }
      searchLoadMoreLoading.value = true;
      update(['searchUser']);
      final result = await taskService.participantsSearch(
          user: UserSearchModel(
              page: ++pageNumber,
              pageSize: pageSize,
              searchTerm: searchController.text));

      result.fold(
        (failure) {
          searchLoadMoreLoading.value = false;
          log(failure.message.toString());
          update(['searchUser']);
        },
        (success) {
          userslist.addAll(success.where(
            (newUser) => !userslist
                .any((existingUser) => existingUser.userId == newUser.userId),
          ));
          searchLoadMoreLoading.value = false;
          update(['searchUser']);
        },
      );
    });
  }

  // Fetches a single task using the provided model
  void fetchSingleTask({required GetSingleTaskModel singleTaskModel}) async {
    isLoading.value = true;
    fetchSingleTaskError.value = false;
    singleTask.value = GetTaskResponce();
    final result = await taskService.getTask(singleTaskModel: singleTaskModel);
    result.fold(
      (failure) {
        isLoading.value = false;
        fetchSingleTaskError.value = true;
        log(failure.message.toString());
      },
      (success) {
        singleTask.value = success;
        isLoading.value = false;
        taskLocalService.addFullTaskDetailsToLocalStorageIfNotPresentInStorage(
            taskModel: success);
      },
    );
  }

  // Searches for tasks based on the search term
  void searchTasks() async {
    debouncer.run(() async {
      taskSearchLoading.value = true;
      taskSearchPageNumber = 1;
      tasksSearch.value = [];
      final result = await taskService.taskSearch(
          taskSearchItem: UserSearchModel(
              page: taskSearchPageNumber,
              pageSize: taskSearchPageSize,
              searchTerm: taskSearchController.text));
      result.fold(
        (failure) {
          taskSearchLoading.value = false;
          log(failure.message.toString());
        },
        (success) {
          tasksSearch.assignAll(success.data ?? []);
          taskSearchLoading.value = false;
        },
      );
    });
  }

  // searchTasks [ Pagination ]
  void searchTasksLoadMore() async {
    debouncer.run(() async {
      if (taskSearchLoadMoreLoading.value == true) {
        return;
      }
      taskSearchLoadMoreLoading.value = true;

      final result = await taskService.taskSearch(
          taskSearchItem: UserSearchModel(
              searchTerm: taskSearchController.text,
              page: ++taskSearchPageNumber,
              pageSize: taskSearchPageSize));
      result.fold(
        (failure) {
          taskSearchLoadMoreLoading.value = false;
          log(failure.message.toString());
        },
        (success) {
          tasksSearch.addAll(success.data!.where(
            (task) => !tasksSearch.any(
              (existingTask) => existingTask.id == task.id,
            ),
          ));
          taskSearchLoadMoreLoading.value = false;
        },
      );
    });
  }

  // Adds a new subtask using the provided model
  void addSubTask(
      {required SubTaskAddModel newsubtask,
      required String taskId,
      required BuildContext context}) async {
    isLoading.value = true;

    final result = await taskService.addSubTask(newsubtask: newsubtask);
    result.fold(
      (failure) {
        isLoading.value = false;
        showSnackbar(context,
            message: errorMessage, backgroundColor: kred, textColor: kblack);
        log(failure.message.toString());
      },
      (success) {
        log("${success.message}");
        final subTask = singleTask.value.subTask;
        singleTask.value.subTask = [
          ...subTask ?? [],
          subtask.SubTask.fromJson(success.data['sub_task'])
        ];
        // fetchSingleTask(singleTaskModel: GetSingleTaskModel(taskId: taskId));
        GoRouter.of(context).pop();
        showSnackbar(
          context,
          message: 'Subtask added successfully',
          backgroundColor: neonShade,
          textColor: kblack,
        );
        isLoading.value = false;
      },
    );
  }

  // Deletes a subtask using the provided model
  void deleteSubTask(
      {required DeleteSubTaskModel deletesubtask,
      required String taskId,
      required BuildContext context}) async {
    isLoading.value = true;
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    final result =
        await taskService.deleteSubTask(deletesubtask: deletesubtask);
    result.fold(
      (failure) {
        scaffoldMessenger.showSnackBar(
          const SnackBar(
            content: Text(errorMessage),
            backgroundColor: kred,
          ),
        );
        GoRouter.of(context).pop();
        isLoading.value = false;
        log(failure.message.toString());
      },
      (success) {
        log("${success.message}");
        fetchSingleTask(singleTaskModel: GetSingleTaskModel(taskId: taskId));
        scaffoldMessenger.showSnackBar(
          const SnackBar(
            content: Text('Subtask deleted successfully'),
            backgroundColor: neonShade,
          ),
        );
        GoRouter.of(context).pop();
        isLoading.value = false;
      },
    );
  }

  // Edits an existing subtask using the provided model
  void editSubTask(
      {required EditSubTaskModel editsubtask,
      required String taskId,
      required BuildContext context}) async {
    isLoading.value = true;

    final result = await taskService.editSubTask(editsubtask: editsubtask);
    result.fold(
      (failure) {
        isLoading.value = false;
        GoRouter.of(context).pop();
        showSnackbar(context,
            message: errorMessage, backgroundColor: kred, textColor: kblack);
        log(failure.message.toString());
      },
      (success) {
        log("${success.message}");
        GoRouter.of(context).pop();
        showSnackbar(
          context,
          message: 'Subtask edited successfully',
          backgroundColor: neonShade,
          textColor: kblack,
        );
        fetchSingleTask(singleTaskModel: GetSingleTaskModel(taskId: taskId));
        isLoading.value = false;
      },
    );
  }

  // Adds a subtask to the list before task creation
  void createSubtaskBeforeTaskCreation({required SubTask subTask}) async {
    subTasks.add(subTask);
  }

  // Kill a task
  void killatask(
      {required KillATaskModel killAtaskModel,
      required BuildContext context}) async {
    isLoading.value = true;
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    final result = await taskService.killATask(killatask: killAtaskModel);
    result.fold(
      (failure) {
        isLoading.value = false;
        scaffoldMessenger.showSnackBar(
          const SnackBar(
            content: Text(errorMessage),
            backgroundColor: kred,
          ),
        );
        GoRouter.of(context).pop();
        log(failure.message.toString());
      },
      (success) {
        log("${success.message}");

        scaffoldMessenger.showSnackBar(
          const SnackBar(
            content: Text('Killed task successfully'),
            backgroundColor: neonShade,
          ),
        );
        GoRouter.of(context).pop();
        isLoading.value = false;
      },
    );
  }

  // Restore the killed task
  void restoreKilledTask(
      {required KillATaskModel restoreTask,
      required BuildContext context}) async {
    isLoading.value = true;
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    final result = await taskService.restoreATask(restoreTask: restoreTask);
    result.fold(
      (failure) {
        isLoading.value = false;
        scaffoldMessenger.showSnackBar(
          const SnackBar(
            content: Text(errorMessage),
            backgroundColor: kred,
          ),
        );
        GoRouter.of(context).pop();
        log(failure.message.toString());
      },
      (success) {
        log("${success.message}");
        fetchAllKilledTasks();
        scaffoldMessenger.showSnackBar(
          const SnackBar(
            content: Text('Restore successfully'),
            backgroundColor: neonShade,
          ),
        );
        GoRouter.of(context).pop();
        isLoading.value = false;
      },
    );
  }

  void getTasksCountWithoutDate() async {
    isLoading.value = true;
    // log('DateTime ===> ${DateTimeFormater.dateTimeFormat(DateTime.now().add(const Duration(days: 31)))}');
    final result = await taskService.getTasksCountsWithDate(
        tasksCountModel: TasksCountModel(
            fromDate: DateTimeFormater.dateTimeFormat(DateTime.now()),
            toDate: DateTimeFormater.dateTimeFormat(
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

  void addNewUserToAssginedUsers(
      {required AddNewAssinedUsersModel addNewAssginedUsersModel}) async {
    isLoading.value = true;

    final result = await taskService.addNewUserToAssginedUsers(
        addNewAssginedUsersModel: addNewAssginedUsersModel);
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

  void removeUserFromAssginedUsers(
      {required RemoveUserFromAssignedModel
          removeUserFromAssignedModel}) async {
    isLoading.value = true;

    final result = await taskService.removeUserFromAssginedUsers(
        removeUserFromAssignedModel: removeUserFromAssignedModel);
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

  void fetchAllCompletedTasks() async {
    filterByTypeLoading.value = true;
    final result = await taskService.getAllCompletedTasks();
    result.fold(
      (failure) {
        filterByTypeLoading.value = false;
        log(failure.message.toString());
      },
      (success) {
        completedTasks.assignAll(success.tasks ?? []);
        filterByTypeLoading.value = false;
      },
    );
  }

  void fetchAllKilledTasks() async {
    filterByTypeLoading.value = true;
    final result = await taskService.getAllKilledTasks();
    result.fold(
      (failure) {
        filterByTypeLoading.value = false;
        log(failure.message.toString());
      },
      (success) {
        killedTasks.assignAll(success.tasks ?? []);
        filterByTypeLoading.value = false;
      },
    );
  }

  void completedSubTask({
    required CompletedSubTask completedSubTask,
    required BuildContext context,
  }) async {
    isLoading.value = true;
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    final result =
        await taskService.completedSubTask(completedSubTask: completedSubTask);
    result.fold(
      (failure) {
        isLoading.value = false;

        scaffoldMessenger.showSnackBar(
          const SnackBar(
            content: Text(errorMessage),
            backgroundColor: kred,
          ),
        );
        log(failure.message.toString());
      },
      (success) {
        log("${success.message}");
        final index = singleTask.value.subTask?.indexWhere(
          (element) => element.id == completedSubTask.subTaskId,
        );
        if (index != null && index != -1 && singleTask.value.subTask != null) {
          singleTask.value.subTask![index] =
              singleTask.value.subTask![index].copyWith(isCompleted: true);
        }
        // fetchSingleTask(
        //     singleTaskModel:
        //         GetSingleTaskModel(taskId: completedSubTask.taskId));
        scaffoldMessenger.showSnackBar(
          const SnackBar(
            content: Text('Subtask completed successfully'),
            backgroundColor: neonShade,
          ),
        );

        isLoading.value = false;
      },
    );
  }

  void fetchTaskTotalTimeAndExpense(
      {required GetSingleTaskModel taskId,
      required BuildContext context}) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    loadingFortTaskExpenseAndTime.value = true;
    final result = await taskService.getTaskTotalTimeAndExpense(taskId: taskId);

    result.fold(
      (failure) {
        loadingFortTaskExpenseAndTime.value = false;
        scaffoldMessenger.showSnackBar(
          const SnackBar(
            content: Text(errorMessage),
            backgroundColor: kred,
          ),
        );
        log(failure.message.toString());
      },
      (success) {
        taskTotalTimeExpenseKeys.value = success.keys.toList();
        List<TaskExpenseAndTimeSuccessResponce> tempList = [];

        for (var element in taskTotalTimeExpenseKeys) {
          tempList.add(
            TaskExpenseAndTimeSuccessResponce.fromJson(success[element]),
          );
        }

        taskExpenseAndTime.value = tempList;
        loadingFortTaskExpenseAndTime.value = false;
      },
    );
  }

  // Create a quick task
  void createQuickTask({required CreateQuickTask createQuickTask}) async {
    loadingForQuickTask.value = true;
    final result =
        await taskService.createQuickTask(createQuickTask: createQuickTask);

    result.fold(
      (failure) {
        loadingForQuickTask.value = false;
        log(failure.message.toString());
      },
      (success) {
        loadingForQuickTask.value = false;
      },
    );
  }

  // Update a quick task
  void updateQuickTask({required UpdateQuickTask updateQuickTask}) async {
    loadingForQuickTask.value = true;
    final result =
        await taskService.updateQuickTasks(updateQuickTask: updateQuickTask);

    result.fold(
      (failure) {
        loadingForQuickTask.value = false;
        log(failure.message.toString());
      },
      (success) {
        loadingForQuickTask.value = false;
      },
    );
  }

  // Complete a quick task
  void completeQuickTask({required CompleteQuickTask completeQuickTask}) async {
    loadingForQuickTask.value = true;
    final result = await taskService.completeQuickTasks(
        completeQuickTask: completeQuickTask);

    result.fold(
      (failure) {
        loadingForQuickTask.value = false;
        log(failure.message.toString());
      },
      (success) {
        loadingForQuickTask.value = false;
      },
    );
  }

  // fetch all quick tasks
  void fetchAllQuickTasks() async {
    loadingForAllQuickTasks.value = true;
    quickTasksPageNumber = 1;
    quickTasks.value = [];
    final result = await taskService.getQuickTasks(
        paginationQuery: PaginationQuery(
      page: quickTasksPageNumber,
      pageSize: quickTasksPageSize,
    ));

    result.fold(
      (failure) {
        loadingForAllQuickTasks.value = false;
        log(failure.message.toString());
      },
      (success) {
        quickTasks.assignAll(success.data ?? []);
        loadingForAllQuickTasks.value = false;
      },
    );
  }

  // fetch all quick tasks [ Pagination ]

  void fetchAllQuickTasksLoadMore() async {
    if (quickTasksLoadMore.value == true) {
      return;
    }
    quickTasksLoadMore.value = true;
    final result = await taskService.getQuickTasks(
        paginationQuery: PaginationQuery(
      page: ++quickTasksPageNumber,
      pageSize: quickTasksPageSize,
    ));

    result.fold(
      (failure) {
        quickTasksLoadMore.value = false;
        log(failure.message.toString());
      },
      (success) {
        quickTasks.addAll(success.data ?? []);
        quickTasksLoadMore.value = false;
      },
    );
  }

  void clearAllDatas() async {
    tasksSearch.clear();
    allPinnedTasks.clear();
    typeTasks.clear();
    deadlineTasks.clear();
    completedTasks.clear();
    killedTasks.clear();
    receivedRequests.clear();
    sentRequests.clear();
    deadlineDate.value = '';
    selectedFiles.clear();
    selectedTasks.clear();
    taskExpenseAndTime.clear();
    taskExpenseAndTime.clear();
  }
}
