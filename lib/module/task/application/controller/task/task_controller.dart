// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:bizkit/core/model/pagination_query/pagination_query.dart';
import 'package:bizkit/module/module_manager/application/controller/profile_controller/profile_controller.dart';
import 'package:bizkit/module/module_manager/data/sqflite/user_history_service.dart';
import 'package:bizkit/module/task/application/controller/folder/folder_controller.dart';
import 'package:bizkit/module/task/application/controller/home_controller/home_controller.dart';
import 'package:bizkit/module/task/data/service/task/task_service.dart';
import 'package:bizkit/module/task/data/sqfilte/task/task_local_service.dart';
import 'package:bizkit/module/task/domain/model/folders/edit_task_responce/edit_task_responce.dart';
import 'package:bizkit/module/task/domain/model/folders/edit_task_responce/next_action_date.dart';
import 'package:bizkit/module/task/domain/model/folders/remove_user_from_assigned_model/remove_user_from_assigned_model.dart';
import 'package:bizkit/module/task/domain/model/quick_task/complete_quick_task/complete_quick_task.dart';
import 'package:bizkit/module/task/domain/model/quick_task/create_quick_task/create_quick_task.dart';
import 'package:bizkit/module/task/domain/model/quick_task/quick_task_accept_or_reject/quick_task_accept_or_reject.dart';
import 'package:bizkit/module/task/domain/model/quick_task/quick_task_assigned_to/quick_task_assigned_to.dart';
import 'package:bizkit/module/task/domain/model/quick_task/quick_tasks_responce/completed_by.dart';
import 'package:bizkit/module/task/domain/model/quick_task/quick_tasks_responce/quick_tasks.dart';
import 'package:bizkit/module/task/domain/model/quick_task/received_quick_task_requests/datum.dart';
import 'package:bizkit/module/task/domain/model/quick_task/update_quick_task_model/update_quick_task_model.dart';
import 'package:bizkit/module/task/domain/model/requests/accept_or_reject_model/accept_or_reject_model.dart';
import 'package:bizkit/module/task/domain/model/requests/received_requests_responce/task.dart';
import 'package:bizkit/module/task/domain/model/requests/send_requests_responce/sent_request.dart';
import 'package:bizkit/module/task/domain/model/task/add_new_assined_users_model/add_new_assined_users_model.dart';
import 'package:bizkit/module/task/domain/model/task/completed_or_killed_success_responce/task.dart';
import 'package:bizkit/module/task/domain/model/task/completed_task_model/completed_task_model.dart';
import 'package:bizkit/module/task/domain/model/task/delete_attachments_model/delete_attachments_model.dart';
import 'package:bizkit/module/task/domain/model/task/filter_by_deadline_model/filter_by_deadline_model.dart';
import 'package:bizkit/module/task/domain/model/task/filter_by_type_model/filter_by_type_model.dart';
import 'package:bizkit/module/task/domain/model/task/filter_pinned_task_by_type_model/filter_pinned_task_by_type_model.dart';
import 'package:bizkit/module/task/domain/model/task/get_single_task_model/get_single_task_model.dart';
import 'package:bizkit/module/task/domain/model/task/get_task_responce/assigned_to_detail.dart';
import 'package:bizkit/module/task/domain/model/task/get_task_responce/get_task_responce.dart';
import 'package:bizkit/module/task/domain/model/task/get_task_responce/attachment.dart'
    as attachment;
import 'package:bizkit/module/task/domain/model/task/kill_a_task_model/kill_a_task_model.dart';
import 'package:bizkit/module/task/domain/model/task/next_action_date_responce/next_action_date_responce.dart';
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
import 'package:bizkit/service/secure_storage/flutter_secure_storage.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/debouncer/debouncer.dart';
import 'package:bizkit/utils/intl/intl_date_formater.dart';
import 'package:bizkit/utils/snackbar/flutter_toast.dart';
import 'package:bizkit/utils/snackbar/snackbar.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../domain/model/quick_task/quick_tasks_responce/assigned_to.dart';
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

  RxString nextActionDate = ''.obs;
  RxBool nextActionDateAddedError = false.obs;

  RxString userSearchfilterType = 'all'.obs;

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

  var participantsForEditQuickTask = <QuickTaskAssignedToResponce>[].obs;

// Stores time and expense information related to tasks
  RxList<TaskExpenseAndTimeSuccessResponce> taskExpenseAndTime =
      <TaskExpenseAndTimeSuccessResponce>[].obs;

// Scroll controller for participant search
  ScrollController searchScrollController =
      ScrollController(); // Scroll controller for participant search
  ScrollController organizationSearchScrollController = ScrollController();

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
  RxList<UserSearchSuccessResponce> recentlySearcheduserslist =
      <UserSearchSuccessResponce>[].obs;
  RxList<UserSearchSuccessResponce> organizationUserslist =
      <UserSearchSuccessResponce>[].obs;

  // List of tasks based on search results
  RxList<Task> tasksSearch = <Task>[].obs;

  // List of tasks selected by the user
  RxList<Task> selectedTasks = <Task>[].obs;

  // List of received task requests
  RxList<ReceivedTask> receivedRequests = <ReceivedTask>[].obs;

  // List of received quick task by the user
  RxList<QuickTaskRequests> receivedQuickTasksReqs = <QuickTaskRequests>[].obs;

  // Map of task counts
  RxMap<String, RxInt> tasksCounts = <String, RxInt>{}.obs;

  // List of completed subtasks
  RxList<CompletedSubTasks> completedSubTasks = <CompletedSubTasks>[].obs;

  // List of quick tasks
  RxList<QuickTasks> quickTasks = <QuickTasks>[].obs;

  // List of completed quick tasks
  RxList<QuickTasks> completedQuickTasks = <QuickTasks>[].obs;

// Pagination controls for different task lists
  int pageNumber = 1, pageSize = 10; // Pagination for general tasks
  int taskSearchPageNumber = 1,
      taskSearchPageSize = 8; // Pagination for task search results
  int deadlineTasksPageNumber = 1,
      deadlineTasksPageSize = 11; // Pagination for deadline-filtered tasks
  int typeTasksPageNumber = 1,
      typeTasksPageSize = 15,
      pinnedtTypeTasksPageSize = 100; // Pagination for type-filtered tasks

  int quickTasksPageNumber = 1,
      quickTasksPageSize = 10,
      completedQuickTaskPage = 1; // Pagination for quick tasks

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
  final TextEditingController nexActiondateDescriptionController =
      TextEditingController();

  @override
  void onInit() {
    getTasksCountWithoutDate(); // Fetch task counts without date filtering
    final DateTime todaydate = DateTime.now(); // Get today's date
    deadlineDate.value = DateFormat('yyyy-MM-dd')
        .format(todaydate); // Set today's date as default deadline

    taskFilterByDeadline(); // Filter tasks by today's deadline

    // Add scroll listeners for various scroll controllers
    if (userSearchfilterType.value == 'all') {
      searchScrollController.addListener(searchParticipantsScrollListener);
    } else {
      organizationSearchScrollController
          .addListener(organizationParticipantsScrollListener);
    }

    taskSearchScrollController.addListener(tasksSearchScrollListener);
    deadlineTasksScrollController.addListener(deadlineTasksScrollListener);
    typeTasksScrollController.addListener(typeTasksScrollListener);
    pinnedTasksScrollController.addListener(pinnedTasksScrollListener);
    quickTasksScrollController.addListener(quickTasksScrollListener);
    super.onInit();
  }

// Test task ID for validation or testing purposes
  String testTaskId = ''; // Placeholder for a test task ID

  // Quick task complete loading list
  RxList loadingList = [].obs;

// Error state for fetching single task data
  RxBool fetchSingleTaskError =
      false.obs; // Boolean for tracking errors when fetching a single task

  final RxBool isSyncing = false.obs;
// Loading states for various UI components
  RxBool isLoading = false.obs; // General loading state
  RxBool subTaskLoading = false.obs;
  RxBool deadlineTasksLoadMoreLoading =
      false.obs; // Loading state for loading more deadline tasks

  RxBool loadgingForFilterByType =
      false.obs; // Loading state for filtering tasks by type

  RxBool loadingForNextActionDate = false.obs;
  RxBool filterByTypeLoading =
      false.obs; // Loading state when filtering tasks by type
  RxBool pinnedTasksFilterByTypeLoading = false.obs;
  RxBool pinnedTasksLoadMoreLoading =
      false.obs; // Loading state for loading more pinned tasks

  RxBool filterByTypeLoadMoreLoading =
      false.obs; // Loading state for loading more type-filtered tasks

  RxBool taskCreationLoading = false.obs; // Loading state during task creation

  RxBool taskEditLoading = false.obs; // Loading state during task editing

  RxBool recentlyUserSearchLoading = false.obs;
  RxBool organizationSearchLoading = false.obs;
  RxBool searchLoading = false.obs; // Loading state for participant search
  RxBool searchLoadMoreLoading = false.obs;
  RxBool organizationSearchLoadMoreLoading =
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
  RxBool getNetworkLoading = false.obs;

  RxBool loadingForQuickTask = false.obs; // Loading state for quick task
  RxBool loadingForQuickTakSyncing = false.obs;
  RxBool errorQuickTakSyncing = false.obs;
  RxBool loadingForCompletedQuickTakSyncing = false.obs;
  RxBool loadingForCompleteQuickTask = false.obs;
  RxBool loadingForQuickTaskReceivedReq = false.obs;
  RxBool errorCompletedQuickTakSyncing = false.obs;
  RxBool loadingForAllQuickTasks =
      false.obs; // Loading state for all quick tasks

  RxBool loadingForCompletedQuickTasks =
      false.obs; // Loading state for completed quick tasks

  RxBool completedQuickTasksLoadMore =
      false.obs; // Loading state for completed quick tasks

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
  // final TaskLocalRepo taskLocalService = TaskLocalService();

  final TaskLocalService taskLocalService = TaskLocalService();
  final UsersHistoryLocalService usersHistoryLocalService =
      UsersHistoryLocalService();

  Rx<DateTime> selectedDate = DateTime.now().obs;

  ///bool value for checking attach whether checked or not
  RxBool selectedAttachment = false.obs;

  ///controller attachment datas
  var selectedAttachmentsDatas = <String>[].obs;

  RxBool attachmentDeleteLoading = false.obs;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  RxBool stausExpansionTileTap = false.obs;
  RxString statusValue = ''.obs;

  void statusValueChanged({required double value}) {
    statusValue.value = value.floor().toString();
  }

  ///task detail section status percentage change function
  void statusChange(
      {required BuildContext context, required String taskId}) async {
    singleTask.value = singleTask.value.copyWith(status: statusValue.value);
    log(" status value after taping update status ${statusValue.value}");
    final result = await taskService.editTask(
      taskModel: EditTaskModel(status: statusValue.value, taskId: taskId),
    );
    result.fold((failure) {
      log('failure status change');
    }, (success) {
      log(singleTask.value.status);
    });
  }

  ///task attachment delete function
  longPressOrOnTap(String attachment) {
    if (selectedAttachmentsDatas.contains(attachment)) {
      selectedAttachmentsDatas.remove(attachment);
    } else {
      selectedAttachmentsDatas.add(attachment);
    }

    update([attachment]);

    log(selectedAttachmentsDatas.length.toString());
    selectedAttachment.value = selectedAttachmentsDatas.isNotEmpty;
  }

  Future<void> deleteAttachments(BuildContext context) async {
    bool? ownerOrNot = singleTask.value.isOwned;
    if (ownerOrNot!) {
      try {
        attachmentDeleteLoading.value = true;

        final result = await taskService.deleteAttachments(
            deleteAttachmentsModel: DeleteAttachmentsModel(
                attachments: selectedAttachmentsDatas,
                taskId: singleTask.value.id));
        result.fold((failure) {
          attachmentDeleteLoading.value = false;
          selectedAttachment.value = false;
          log('falure of controller');
        }, (success) {
          List<attachment.Attachment> list = [];
          for (int i = 0;
              i < ((singleTask.value.attachments?.length) ?? 0);
              i++) {
            if (!selectedAttachmentsDatas
                .contains(singleTask.value.attachments![i].attachment)) {
              list.add(singleTask.value.attachments![i]);
            }
          }
          singleTask.value = singleTask.value.copyWith(attachments: list);

          log(singleTask.value.attachments!.length.toString());

          selectedAttachmentsDatas.clear();
          attachmentDeleteLoading.value = false;
          selectedAttachment.value = false;
          log('success of controller');
        });
      } catch (e) {
        attachmentDeleteLoading.value = false;
        selectedAttachment.value = false;
        log(e.toString());
      }
    } else {
      selectedAttachmentsDatas.clear();
      selectedAttachment.value = false;
      fetchSingleTask(
          singleTaskModel:
              GetSingleTaskModel(taskId: singleTask.value.id ?? ''));
      showSnackbar(context,
          message: 'This task not owned by you', backgroundColor: Colors.red);
    }
  }

  void changeFilterTaskType(String taskType) {
    this.taskType.value = taskType;
  }

  void searchParticipantsScrollListener() {
    if (searchScrollController.position.pixels ==
        searchScrollController.position.maxScrollExtent) {
      searchParticipantsLoadMore();
    }
  }

  void organizationParticipantsScrollListener() {
    if (organizationSearchScrollController.position.pixels ==
        organizationSearchScrollController.position.maxScrollExtent) {
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

  void removeParticipantsForEditQuckTask(dynamic participant) {
    participantsForEditQuickTask.remove(participant);
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
        type: file.extension == 'jpg' ? 'image' : file.extension,
      );
    }).toList();
  }

  // Creates a new task with the provided task model
  void createNewTask({
    required TaskModel task,
    required BuildContext context,
  }) async {
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
        GoRouter.of(context).pop(context);
        clearSelectedFiles();
        subTasks.clear();
        tags.clear();
        fetchSendRequests();
        attachments.clear();
        attachments.clear;
        userslistNew.clear();
        deadlineDateForTaskCreation.value = '';
        showCustomToast(
          message: errorMessage,
          backgroundColor: kred,
        );
      },
      (success) {
        deadlineDateForTaskCreation.value = '';
        getTasksCountWithoutDate();
        taskCreationLoading.value = false;

        testTaskId = success.taskId.toString();
        GoRouter.of(context).pop(context);
        clearSelectedFiles();
        subTasks.clear();
        tags.clear();
        fetchSendRequests();
        attachments.clear();
        attachments.clear;
        userslistNew.clear();
        Get.find<TaskHomeScreenController>().fetchRecentTasks();
        Get.find<TaskHomeScreenController>().progresBar();

        showCustomToast(
          message: 'Task created successfully',
          backgroundColor: Get.isDarkMode ? klightGrey : kblack,
          textColor: Get.isDarkMode ? kblack : kwhite,
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
        showCustomToast(
          message: errorMessage,
          backgroundColor: kred,
        );
        log('${error.error}', name: 'Error from Edit Task');
      },
      (success) {
        taskEditLoading.value = false;
        log('${success.message}');

        showCustomToast(
          message: 'Task edited successfully',
          backgroundColor: Get.isDarkMode ? klightGrey : kblack,
          textColor: Get.isDarkMode ? kblack : kwhite,
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
    final result =
        await taskService.completeTask(completedTaskModel: completedTaskModel);

    result.fold(
      (failure) {
        isLoading.value = false;
        showCustomToast(
          message: errorMessage,
          backgroundColor: kred,
        );
        GoRouter.of(context).pop();
        log(failure.message.toString());
      },
      (success) {
        log('${success.message}');

        showCustomToast(
          message: 'Task completed successfully',
          backgroundColor: Get.isDarkMode ? klightGrey : kblack,
          textColor: Get.isDarkMode ? kblack : kwhite,
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

  // Filters tasks by deadline
  Future<void> taskFilterByDeadline() async {
    taksListLoading.value = true;
    deadlineTasksPageNumber = 1;
    deadlineTasks.value = <Task>[];
    getNetworkLoading.value = true;

    // Step 1: Fetch and display local data first
    await fetchTasksFromLocalDb();

    // Step 2: Then update with any network data if available
    await fetchTasksFromNetwork();
    getNetworkLoading.value = false;
    taksListLoading.value = false;
  }

  Future<void> fetchTasksFromLocalDb() async {
    if (deadlineDate.value.isEmpty) {
      log('fetchTasksFromLocalDb error: deadline date is empty');
      return;
    }
    taksListLoading.value = true;
    final localDbTasksResult = await taskLocalService.getTasksFromLocalStorage(
      filterByDeadline: deadlineDate.value,
      page: deadlineTasksPageNumber,
      pageSize: deadlineTasksPageSize,
    );

    localDbTasksResult.fold(
      (failure) {
        log('FetchTasksFromLocalDb error: ${failure.message}');
      },
      (tasks) {
        deadlineTasks.assignAll(tasks);
        taksListLoading.value = false;
      },
    );
  }

  Future<void> fetchTasksFromNetwork() async {
    final result = await taskService.filterByDeadline(
      filterByDeadline: FilterByDeadlineModel(
        date: deadlineDate.value,
        page: deadlineTasksPageNumber,
        pageSize: deadlineTasksPageSize,
      ),
    );

    result.fold(
      (failure) {
        log(failure.message.toString());
      },
      (success) async {
        if (success.data != null) {
          // Store new tasks in local database
          for (var task in success.data ?? <Task>[]) {
            final index = deadlineTasks.indexWhere((e) => e.id == task.id);
            if (index == -1) {
              deadlineTasks.insert(0, task);
            } else if ((task.spotlightOn ?? false) ||
                ((task.matchedNextActionDates ?? [])
                    .contains(deadlineDate.value))) {
              deadlineTasks.removeAt(index);
              deadlineTasks.insert(0, task);
            } else {
              deadlineTasks[index] = task;
            }
            await taskLocalService.addTaskToLocalStorageIfNotPresentInStorage(
              taskModel: task,
            );
          }
        }
      },
    );
  }

  Future<void> taskFilterByDeadlineLoadMore() async {
    if (deadlineTasksLoadMoreLoading.value == true) return;

    deadlineTasksLoadMoreLoading.value = true;

    // First try to get more items from local storage
    final localResult = await taskLocalService.getTasksFromLocalStorage(
      filterByDeadline: deadlineDate.value,
      page: deadlineTasksPageNumber + 1,
      pageSize: deadlineTasksPageSize,
    );

    await localResult.fold(
      (failure) async {
        log('Local load more failed: ${failure.message}');
        // If local fetch fails, try network
        await loadMoreFromNetwork();
      },
      (localTasks) async {
        if (localTasks.isNotEmpty) {
          deadlineTasksPageNumber++;
          for (var task in localTasks) {
            final index = deadlineTasks.indexWhere((e) => e.id == task.id);
            if (index == -1) {
              deadlineTasks.add(task);
            }
          }
        }
        await loadMoreFromNetwork();
      },
    );

    deadlineTasksLoadMoreLoading.value = false;
  }

  Future<void> loadMoreFromNetwork() async {
    final result = await taskService.filterByDeadline(
      filterByDeadline: FilterByDeadlineModel(
        date: deadlineDate.value,
        page: deadlineTasksPageNumber + 1,
        pageSize: deadlineTasksPageSize,
      ),
    );

    result.fold(
      (failure) {
        log(failure.message.toString());
      },
      (success) async {
        if (success.data?.isNotEmpty ?? false) {
          deadlineTasksPageNumber++;
          for (var task in success.data ?? <Task>[]) {
            final index = deadlineTasks.indexWhere((e) => e.id == task.id);
            if (index == -1) {
              deadlineTasks.add(task);
            } else {
              deadlineTasks[index] = task;
            }
            // Store new tasks in local database
            await taskLocalService.addTaskToLocalStorageIfNotPresentInStorage(
              taskModel: task,
            );
          }
        }
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
    final result = await taskService.pinnedATask(pinnedATask: pinnedATask);
    result.fold(
      (error) {
        showCustomToast(
          message: errorMessage,
          backgroundColor: kred,
        );
      },
      (success) async {
        update();
        // if (pinnedATask.isPinned == false) {
        //   allPinnedTasks.removeWhere((e) => e.id == pinnedATask.taskId);
        //   pinLoader.value = false;
        //   update();
        // }
        // Flag to track if local storage was updated
        bool localUpdated = false;

        // Update the task in the `typeTasks` list
        final typeTaskindex = typeTasks.indexWhere(
          (element) => element.id == pinnedATask.taskId,
        );

        if (typeTaskindex != null && typeTaskindex != -1) {
          // Copy the task with the updated `isPinned` value
          var task = typeTasks[typeTaskindex].copyWith(isPinned: true);

          // Update the task in the list
          typeTasks[typeTaskindex] = task;

          // Add the task to the pinned tasks list
          allPinnedTasks.insert(0, task);

          await taskLocalService.addTaskToLocalStorageIfNotPresentInStorage(
            taskModel: task, // Save the updated task locally
          );

          // Mark local storage as updated
          localUpdated = true;
        }

        // Update the task in the `deadlineTasks` list
        final deadlineTaskindex = deadlineTasks.indexWhere(
          (element) => element.id == pinnedATask.taskId,
        );

        if (deadlineTaskindex != null && deadlineTaskindex != -1) {
          var task = deadlineTasks[deadlineTaskindex].copyWith(isPinned: true);
          deadlineTasks[deadlineTaskindex] = task;

          // Save the updated task locally if not already updated
          if (!localUpdated) {
            allPinnedTasks.insert(0, task);
            await taskLocalService.addTaskToLocalStorageIfNotPresentInStorage(
              taskModel: task,
            );
          }
        }

        showCustomToast(
          message: 'Successfully pinned this task',
          backgroundColor: Get.isDarkMode ? klightGrey : kblack,
          textColor: Get.isDarkMode ? kblack : kwhite,
        );

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
    final result = await taskService.unpinATask(unpinATask: unpinATask);
    result.fold(
      (failure) {
        showCustomToast(
          message: errorMessage,
          backgroundColor: kred,
        );
        log(failure.message.toString());
      },
      (success) async {
        // Flag to track if local storage was updated
        bool localUpdated = false;

        /// Update the task in the `typeTasks` list
        final typeTaskindex = typeTasks.indexWhere(
          (element) => element.id == unpinATask.taskId,
        );

        if (typeTaskindex != null && typeTaskindex != -1) {
          // Copy the task with the updated `isPinned` value
          var task = typeTasks[typeTaskindex].copyWith(isPinned: false);

          typeTasks[typeTaskindex] = task; // Update the task in the list

          await taskLocalService.addTaskToLocalStorageIfNotPresentInStorage(
            taskModel: task, // Save the updated task locally
          );

          // Mark local storage as updated
          localUpdated = true;
        }

        /// Remove the task from the `allPinnedTasks` list
        final pinnedIndex = allPinnedTasks.indexWhere(
          (element) => element.id == unpinATask.taskId,
        );

        if (pinnedIndex != null && pinnedIndex != -1) {
          var task = allPinnedTasks[pinnedIndex].copyWith(isPinned: false);
          allPinnedTasks
              .removeAt(pinnedIndex); // Remove the task from pinned tasks

          if (!localUpdated) {
            await taskLocalService.addTaskToLocalStorageIfNotPresentInStorage(
              taskModel:
                  task, // Save the updated task locally if not already updated
            );
            localUpdated = true;
          }
        }

        /// Update the task in the `deadlineTasks` list
        final deadlineTaskindex = deadlineTasks.indexWhere(
          (element) => element.id == unpinATask.taskId,
        );

        if (deadlineTaskindex != null && deadlineTaskindex != -1) {
          var task = deadlineTasks[deadlineTaskindex].copyWith(isPinned: false);
          deadlineTasks[deadlineTaskindex] = task;
          if (!localUpdated) {
            await taskLocalService.addTaskToLocalStorageIfNotPresentInStorage(
              taskModel: task,
            );
          }
        }

        showCustomToast(
          message: 'Successfully unpinned this task',
          backgroundColor: Get.isDarkMode ? klightGrey : kblack,
          textColor: Get.isDarkMode ? kblack : kwhite,
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
    pinnedTasksFilterByTypeLoading.value = true;
    pinnedTasksPageNumber = 1;
    allPinnedTasks.value = [];

    final result = await taskService.filterPinnedTaskByType(
        filterPinnedTaskByType: FilterPinnedTaskByTypeModel(
      isPinned: true,
      page: pinnedTasksPageNumber,
      pageSize: pinnedtTypeTasksPageSize,
      taskType: taskType.value,
    ));
    update();
    result.fold(
      (failure) {
        pinnedTasksFilterByTypeLoading.value = false;
      },
      (success) {
        allPinnedTasks.assignAll(success.data ?? []);
        pinnedTasksFilterByTypeLoading.value = false;
        update();
      },
    );
  }

  // Filters pinned tasks by type - [ Pagination ]
  void filterPinnedTasksByTypeLoadMore() async {
    if (pinnedTasksLoadMoreLoading.value == true) {
      return;
    }
    pinnedTasksLoadMoreLoading.value = true;
    final result = await taskService.filterPinnedTaskByType(
        filterPinnedTaskByType: FilterPinnedTaskByTypeModel(
      isPinned: true,
      page: ++pinnedTasksPageNumber,
      pageSize: pinnedtTypeTasksPageSize,
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

    final result =
        await taskService.acceptOrReject(acceptOrReject: acceptOrReject);
    result.fold(
      (error) {
        isLoading.value = false;
        showCustomToast(
          message: errorMessage,
          backgroundColor: kred,
        );
        log('${error.error}', name: 'Error from acceptOrReject ');
      },
      (success) {
        log("${success.message}");
        isAccept == true
            ? showCustomToast(
                message: 'Task Accepted successfully',
                backgroundColor: Get.isDarkMode ? klightGrey : kblack,
                textColor: Get.isDarkMode ? kblack : kwhite,
              )
            : showCustomToast(
                message: 'Task Rejected successfully',
                backgroundColor: Get.isDarkMode ? klightGrey : kblack,
                textColor: Get.isDarkMode ? kblack : kwhite,
              );
        isLoading.value = false;

        fetchReceivedRequests();
      },
    );
  }

  void addUserToRecentlySearched(
      {required UserSearchSuccessResponce user}) async {
    log('users data == ? ${user.toJson()}');
    final result = await usersHistoryLocalService
        .addUserToSearchHistoryLocalIfNotExists(user: user);

    result.fold(
      (failure) {
        log(failure.message.toString());
        update(['searchUser']);
      },
      (success) {
        update(['searchUser']);
      },
    );
  }

  void updateUserInRecentlySearched(
      {required UserSearchSuccessResponce user}) async {
    final result = await usersHistoryLocalService
        .addUserToSearchHistoryLocalIfNotExists(user: user);

    result.fold(
      (failure) {
        log(failure.message.toString());
        update(['searchUser']);
      },
      (success) {
        update(['searchUser']);
      },
    );
  }

// Recently searched users - local db
  void recentlySearched({String? searchQuery}) async {
    recentlyUserSearchLoading.value = true;
    update(['searchUser']);
    final result = await usersHistoryLocalService.getSearchHistory(
        searchQuery: searchQuery);

    result.fold(
      (failure) {
        recentlyUserSearchLoading.value = false;
        log(failure.message.toString());
        update(['searchUser']);
      },
      (success) {
        recentlySearcheduserslist.assignAll(success);
        recentlyUserSearchLoading.value = false;
        update(['searchUser']);
      },
    );
  }

  // Searches for participants based on user input
  void searchParticipants() async {
    if (userSearchfilterType.value == 'all') {
      searchLoading.value = true;
    } else {
      organizationSearchLoading.value = true;
    }
    update(['searchUser']);
    userslist.value = [];
    pageNumber = 1;
    final user = UserSearchModel(
        filterType: userSearchfilterType.value,
        page: pageNumber,
        pageSize: pageSize,
        searchTerm: searchController.text);

    final result = await taskService.participantsSearch(user: user);

    result.fold(
      (failure) {
        if (userSearchfilterType.value == 'all') {
          searchLoading.value = false;
        } else {
          organizationSearchLoading.value = false;
        }
        update(['searchUser']);
        log(failure.message.toString());
      },
      (success) {
        if (userSearchfilterType.value == 'organization') {
          organizationUserslist.assignAll(success);
        } else {
          userslist.assignAll(success);
        }
        if (userSearchfilterType.value == 'all') {
          searchLoading.value = false;
        } else {
          organizationSearchLoading.value = false;
        }
        update(['searchUser']);
      },
    );
  }

// Searches for participants - [ Pagination ]
  void searchParticipantsLoadMore() async {
    if (userSearchfilterType.value == 'all') {
      if (searchLoadMoreLoading.value == true) {
        return;
      }
    } else {
      if (organizationSearchLoadMoreLoading.value == true) {
        return;
      }
    }
    if (userSearchfilterType.value == 'all') {
      searchLoadMoreLoading.value = true;
    } else {
      organizationSearchLoadMoreLoading.value = true;
    }

    update(['searchUser']);
    final result = await taskService.participantsSearch(
        user: UserSearchModel(
            filterType: userSearchfilterType.value,
            page: ++pageNumber,
            pageSize: pageSize,
            searchTerm: searchController.text));

    result.fold(
      (failure) {
        if (userSearchfilterType.value == 'all') {
          searchLoadMoreLoading.value = false;
        } else {
          organizationSearchLoadMoreLoading.value = false;
        }
        log(failure.message.toString());
        update(['searchUser']);
      },
      (success) {
        userslist.addAll(success.where(
          (newUser) => !userslist
              .any((existingUser) => existingUser.userId == newUser.userId),
        ));

        if (userSearchfilterType.value == 'organization') {
          organizationUserslist.addAll(success.where(
            (newUser) => organizationUserslist.any(
              (existingUser) => existingUser.userId == newUser.userId,
            ),
          ));
        }
        if (userSearchfilterType.value == 'all') {
          searchLoadMoreLoading.value = false;
        } else {
          organizationSearchLoadMoreLoading.value = false;
        }
        update(['searchUser']);
      },
    );
  }

  // Fetches a single task using the provided model
  void fetchSingleTask({required GetSingleTaskModel singleTaskModel}) async {
    isLoading.value = true;
    isSyncing.value = false;
    fetchSingleTaskError.value = false;
    singleTask.value = GetTaskResponce();
    fetchSingleTaskError.value = false;

    // Fetch the task details from local storage before making a network call
    await fetchSingleTaskFromLocalStorage(singleTaskModel);

    isSyncing.value = true; // Start syncing indication

    final result = await taskService.getTask(singleTaskModel: singleTaskModel);
    await result.fold(
      (failure) {
        isLoading.value = false;
        fetchSingleTaskError.value = true;
        isSyncing.value = false;
        log(failure.message.toString());
      },
      (success) async {
        // If the fetched task matches the current task, update the singleTask observable
        if (singleTaskModel.taskId == success.id) {
          singleTask.value = success;

          fetchSingleTaskError.value = false;
          isSyncing.value = false; // End syncing indication
        }
        isLoading.value = false;

        // Add the fetched task to local storage if it's not already stored
        await taskLocalService
            .addTaskFullDetailsToLocalStorageIfNotPresentInStorage(
                taskModel: success);
      },
    );
  }

// Task details from local storage
  Future<void> fetchSingleTaskFromLocalStorage(
      GetSingleTaskModel singleTaskModel) async {
    isLoading.value = true;

    final responseFromLocalStorage =
        await taskLocalService.getTaskFullDetailsFromLocalStorage(
            taskId: singleTaskModel.taskId ?? '');

    responseFromLocalStorage.fold(
      (failure) {
        log('Failed to fetch task from local storage: ${failure.message}');
      },
      (success) {
        singleTask.value = success;
        if (success.id != null) {
          isLoading.value = false;
        }
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
              filterType: 'all',
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
    subTaskLoading.value = true;

    final result = await taskService.addSubTask(newsubtask: newsubtask);
    result.fold(
      (failure) {
        subTaskLoading.value = false;
        showCustomToast(
          message: errorMessage,
          backgroundColor: kred,
        );
        log(failure.message.toString());
      },
      (success) {
        log("${success.message}");
        final subTask = singleTask.value.subTask;
        singleTask.value = singleTask.value.copyWith(subTask: [
          ...subTask ?? [],
          subtask.SubTask.fromJson(success.data['sub_task'])
        ]);

        showCustomToast(
          message: 'Subtask added successfully',
          backgroundColor: Get.isDarkMode ? klightGrey : kblack,
          textColor: Get.isDarkMode ? kblack : kwhite,
        );
        subTaskLoading.value = false;
        GoRouter.of(context).pop();
      },
    );
  }

  // Deletes a subtask using the provided model
  void deleteSubTask(
      {required DeleteSubTaskModel deletesubtask,
      required String taskId,
      required BuildContext context}) async {
    subTaskLoading.value = true;

    final result =
        await taskService.deleteSubTask(deletesubtask: deletesubtask);
    result.fold(
      (failure) {
        showCustomToast(
          message: errorMessage,
          backgroundColor: kred,
        );
        GoRouter.of(context).pop();
        subTaskLoading.value = false;
        log(failure.message.toString());
      },
      (success) {
        log("${success.message}");
        singleTask.value = singleTask.value.copyWith(
          subTask: singleTask.value.subTask
              ?.where((sub) => sub.id != deletesubtask.subTaskId)
              .toList(),
        );
        // fetchSingleTask(singleTaskModel: GetSingleTaskModel(taskId: taskId));

        showCustomToast(
          message: 'Subtask deleted successfully',
          backgroundColor: Get.isDarkMode ? klightGrey : kblack,
          textColor: Get.isDarkMode ? kblack : kwhite,
        );
        subTaskLoading.value = false;
      },
    );
  }

  // Edits an existing subtask using the provided model
  void editSubTask(
      {required EditSubTaskModel editsubtask,
      required String taskId,
      required BuildContext context}) async {
    subTaskLoading.value = true;

    final result = await taskService.editSubTask(editsubtask: editsubtask);
    result.fold(
      (failure) {
        subTaskLoading.value = false;
        GoRouter.of(context).pop();
        showCustomToast(
          message: errorMessage,
          backgroundColor: kred,
        );
        log(failure.message.toString());
      },
      (success) {
        log("${success.message}");
        GoRouter.of(context).pop();
        // Use copyWith to update the singleTask locally
        singleTask.value = singleTask.value.copyWith(
          subTask: singleTask.value.subTask?.map((sub) {
            // Check if the subtask is the one being edited
            if (sub.id == editsubtask.subTaskId) {
              return sub.copyWith(
                title: editsubtask.title,
                description: editsubtask.description,
              );
            }
            return sub;
          }).toList(),
        );
        showCustomToast(
          message: 'Subtask edited successfully',
          backgroundColor: Get.isDarkMode ? klightGrey : kblack,
          textColor: Get.isDarkMode ? kblack : kwhite,
        );

        subTaskLoading.value = false;
      },
    );
  }

  // Adds a subtask to the list before task creation
  void createSubtaskBeforeTaskCreation(
      {required SubTask subTask, required BuildContext context}) async {
    subTasks.add(subTask);
    GoRouter.of(context).pop();
  }

  // Kill a task
  void killatask(
      {required KillATaskModel killAtaskModel,
      required BuildContext context}) async {
    isLoading.value = true;

    final result = await taskService.killATask(killatask: killAtaskModel);
    result.fold(
      (failure) {
        isLoading.value = false;
        showCustomToast(
          message: errorMessage,
          backgroundColor: kred,
        );
        GoRouter.of(context).pop();
        log(failure.message.toString());
      },
      (success) {
        log("${success.message}");

        showCustomToast(
          message: 'Killed task successfully',
          backgroundColor: Get.isDarkMode ? klightGrey : kblack,
          textColor: Get.isDarkMode ? kblack : kwhite,
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
    final result = await taskService.restoreATask(restoreTask: restoreTask);
    result.fold(
      (failure) {
        isLoading.value = false;
        showCustomToast(
          message: errorMessage,
          backgroundColor: kred,
        );
        GoRouter.of(context).pop();
        log(failure.message.toString());
      },
      (success) {
        log("${success.message}");
        fetchAllKilledTasks();

        showCustomToast(
          message: 'Restore successfully',
          backgroundColor: Get.isDarkMode ? klightGrey : kblack,
          textColor: Get.isDarkMode ? kblack : kwhite,
        );
        GoRouter.of(context).pop();
        isLoading.value = false;
      },
    );
  }

// get tasks counts
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

// Add new users to assgined users list
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

// Remove a assgined user from assgined users list
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

// Fetch all completed tasks
  void fetchAllCompletedTasks() async {
    filterByTypeLoading.value = true;
    allPinnedTasks.value = [];
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

// Fetch all killed tasks
  void fetchAllKilledTasks() async {
    filterByTypeLoading.value = true;
    allPinnedTasks.value = [];
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

// Complete the subtask
  void completedSubTask({
    required CompletedSubTask completedSubTask,
    required BuildContext context,
  }) async {
    subTaskLoading.value = true;

    final result =
        await taskService.completedSubTask(completedSubTask: completedSubTask);
    result.fold(
      (failure) {
        subTaskLoading.value = false;

        showCustomToast(
          message: errorMessage,
          backgroundColor: kred,
        );
        log(failure.message.toString());
      },
      (success) {
        log("${success.message}");
        // final index = singleTask.value.subTask?.indexWhere(
        //   (element) => element.id == completedSubTask.subTaskId,
        // );
        // if (index != null && index != -1 && singleTask.value.subTask != null) {
        //   singleTask.value.subTask![index] =
        //       singleTask.value.subTask![index].copyWith(isCompleted: true);
        // }

        // Update the subTask list using a new list
        singleTask.value = singleTask.value.copyWith(
          subTask: singleTask.value.subTask?.map((subTask) {
            if (subTask.id == completedSubTask.subTaskId) {
              return subTask.copyWith(isCompleted: true);
            }
            return subTask;
          }).toList(),
        );
        // fetchSingleTask(
        //     singleTaskModel:
        //         GetSingleTaskModel(taskId: completedSubTask.taskId));

        subTaskLoading.value = false;

        showCustomToast(
          message: 'Subtask completed successfully',
          backgroundColor: Get.isDarkMode ? klightGrey : kblack,
          textColor: Get.isDarkMode ? kblack : kwhite,
        );
      },
    );
  }

// Fetch task total time and expense
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
  void createQuickTask(
      {required CreateQuickTask createQuickTask,
      required BuildContext context}) async {
    loadingForQuickTask.value = true;
    // Extract only the user IDs from the userslistNew
    createQuickTask.assignedTo = userslistNew
        .map(
          (element) =>
              QuickTaskAssignedTo(status: 'pending', userId: element.userId),
        )
        .toList();

    final result =
        await taskService.createQuickTask(createQuickTask: createQuickTask);

    result.fold(
      (failure) {
        loadingForQuickTask.value = false;
        log(failure.message.toString());
        showCustomToast(
          message: errorMessage,
          backgroundColor: kred,
        );
      },
      (success) {
        loadingForQuickTask.value = false;
        GoRouter.of(context).pop(context);
        userslistNew.clear();
        titleController.clear();
        descriptionController.clear();
        showCustomToast(
          message: 'Quick task created successfully',
          backgroundColor: Get.isDarkMode ? klightGrey : kblack,
          textColor: Get.isDarkMode ? kblack : kwhite,
        );
        fetchAllQuickTasks();
      },
    );
  }

  // Quick task received requests
  void fetchQuickTaskRequests() async {
    loadingForQuickTaskReceivedReq.value = true;
    final result = await taskService.getQuickTasksRequests();

    result.fold(
      (failure) {
        loadingForQuickTaskReceivedReq.value = false;
        log(failure.message.toString());
      },
      (success) {
        loadingForQuickTaskReceivedReq.value = false;
        receivedQuickTasksReqs.assignAll(success.data ?? []);
      },
    );
  }

  // Quick task accept request
  void acceptQuickTaskRequest({
    required QuickTaskAcceptOrReject acceptOrRejct,
    required BuildContext context,
  }) async {
    loadingForQuickTaskReceivedReq.value = true;
    final result =
        await taskService.acceptQuickTask(acceptOrRejct: acceptOrRejct);

    result.fold(
      (failure) {
        loadingForQuickTaskReceivedReq.value = false;
        showCustomToast(
          message: errorMessage,
          backgroundColor: kred,
        );
        log(failure.message.toString());
      },
      (success) {
        loadingForQuickTaskReceivedReq.value = false;

        showCustomToast(
          message: 'Quick Task Accepted Successfully',
          backgroundColor: Get.isDarkMode ? klightGrey : kblack,
          textColor: Get.isDarkMode ? kblack : kwhite,
        );

        fetchAllQuickTasks();
      },
    );
  }

  // Quick task reject request
  void rejectQuickTaskRequest({
    required QuickTaskAcceptOrReject acceptOrRejct,
    required BuildContext context,
  }) async {
    loadingForQuickTaskReceivedReq.value = true;
    final result =
        await taskService.rejectQuickTask(acceptOrRejct: acceptOrRejct);

    result.fold(
      (failure) {
        loadingForQuickTaskReceivedReq.value = false;
        showCustomToast(
          message: errorMessage,
          backgroundColor: kred,
        );
        log(failure.message.toString());
      },
      (success) {
        loadingForQuickTaskReceivedReq.value = false;

        showCustomToast(
          message: 'Quick Task Rejected Successfully',
          backgroundColor: Get.isDarkMode ? klightGrey : kblack,
          textColor: Get.isDarkMode ? kblack : kwhite,
        );
        fetchAllQuickTasks();
      },
    );
  }

  // Update a quick task
  void updateQuickTask(
      {required UpdateQuickTaskModel updateQuickTask,
      required BuildContext context}) async {
    loadingForQuickTask.value = true;

    updateQuickTask.assignedTo = participantsForEditQuickTask
        .map(
          (element) => QuickTaskAssignedTo(
            userId: element.userId,
            status: element.status,
          ),
        )
        .toList();

    final result =
        await taskService.updateQuickTasks(updateQuickTask: updateQuickTask);

    result.fold(
      (failure) {
        loadingForQuickTask.value = false;
        log(failure.message.toString());
        showCustomToast(
          message: errorMessage,
          backgroundColor: kred,
        );
      },
      (success) {
        loadingForQuickTask.value = false;

        showCustomToast(
          message: 'Quick task updated successfully',
          backgroundColor: Get.isDarkMode ? klightGrey : kblack,
          textColor: Get.isDarkMode ? kblack : kwhite,
        );
        fetchAllQuickTasks();
        GoRouter.of(context).pop(context);
      },
    );
  }

  // Complete a quick task
  void completeQuickTask(
      {required CompleteQuickTask completeQuickTask,
      required QuickTasks quickTask,
      required int index}) async {
    loadingList.add(completeQuickTask.quickTaskId ?? '');

    // loadingForCompleteQuickTask.value = true;
    final result = await taskService.completeQuickTasks(
        completeQuickTask: completeQuickTask);

    result.fold(
      (failure) {
        // loadingForCompleteQuickTask.value = false;
        loadingList.remove(completeQuickTask.quickTaskId ?? '');
        if (quickTasks.length > index) {
          quickTasks[index] = quickTask;
        } else {
          quickTasks.add(quickTask);
        }
        log(failure.message.toString());
      },
      (success) async {
        // loadingForCompleteQuickTask.value = false;

        // quickTasks.value = quickTasks.map((task) {
        //   if (task.id == completeQuickTask.quickTaskId) {
        //     // Match by ID or other unique identifier
        //     return task.copyWith(isCompleted: true);
        //   }
        //   return task;
        // }).toList();
        loadingList.remove(completeQuickTask.quickTaskId ?? '');
        quickTask = quickTask.copyWith(
            isCompleted: true,
            completedAt: DateTime.now().toString(),
            completedBy: [
              CompletedBy(userId: await SecureStorage.getUserId())
            ]);
        showCustomToast(
            message: '${quickTask.title ?? 'quick task'} marked as completed');
        completedQuickTasks.add(quickTask);
        await taskLocalService.addQuickTaskToLocalIfNotExists(
            quickTask: quickTask);
        fetchCompletedQuickTasks();
      },
    );
  }

  // fetch all quick tasks
  void fetchAllQuickTasks() async {
    loadingForAllQuickTasks.value = true;
    loadingForQuickTakSyncing.value = true;
    errorQuickTakSyncing.value = false;
    quickTasksPageNumber = 1;
    quickTasks.value = [];
    // get all local data
    final localresult =
        await taskLocalService.getQuickTaskList(isCompleted: false);
    localresult.fold((l) => null, (r) {
      quickTasks.value = r;
      loadingForAllQuickTasks.value = false;
    });
    final result = await taskService.getQuickTasks(
        paginationQuery: PaginationQuery(
      page: quickTasksPageNumber,
      pageSize: quickTasksPageSize,
    ));

    // get data form server
    result.fold(
      (failure) {
        loadingForAllQuickTasks.value = false;
        log(failure.message.toString());
        loadingForQuickTakSyncing.value = false;
        errorQuickTakSyncing.value = true;
      },
      (success) async {
        if (success.data != null) {
          quickTasks.assignAll(success.data ?? []);
          loadingForAllQuickTasks.value = false;
          for (var quickTask in success.data ?? <QuickTasks>[]) {
            await taskLocalService.addQuickTaskToLocalIfNotExists(
                quickTask: quickTask);
          }
        }
        loadingForQuickTakSyncing.value = false;
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
      (success) async {
        quickTasks.addAll(success.data ?? []);
        quickTasksLoadMore.value = false;
        for (var quickTask in success.data ?? <QuickTasks>[]) {
          await taskLocalService.addQuickTaskToLocalIfNotExists(
              quickTask: quickTask);
        }
      },
    );
  }

  // fetch all quick tasks
  void fetchCompletedQuickTasks() async {
    loadingForCompletedQuickTasks.value = true;
    loadingForCompletedQuickTakSyncing.value = true;
    errorCompletedQuickTakSyncing.value = false;
    completedQuickTaskPage = 1;
    completedQuickTasks.value = [];
    final localresult =
        await taskLocalService.getQuickTaskList(isCompleted: true);
    localresult.fold((l) => null, (r) {
      completedQuickTasks.value = r;
      loadingForCompletedQuickTasks.value = false;
    });
    final result = await taskService.getCompletedQuickTasks(
        paginationQuery: PaginationQuery(
      completedTasks: true,
      page: completedQuickTaskPage,
      pageSize: quickTasksPageSize,
    ));

    result.fold(
      (failure) {
        loadingForCompletedQuickTasks.value = false;
        log(failure.message.toString());
        loadingForCompletedQuickTakSyncing.value = false;
        errorCompletedQuickTakSyncing.value = true;
      },
      (success) async {
        if (success.data != null) {
          completedQuickTasks.assignAll(success.data ?? []);
          loadingForCompletedQuickTasks.value = false;

          for (var quickTask in success.data ?? <QuickTasks>[]) {
            await taskLocalService.addQuickTaskToLocalIfNotExists(
                quickTask: quickTask);
          }
        }
        loadingForCompletedQuickTakSyncing.value = false;
      },
    );
  }

  // fetch completed quick tasks [ Pagination ]
  void fetchCompletedQuickTasksLoadMore() async {
    if (completedQuickTasksLoadMore.value == true) {
      return;
    }
    completedQuickTasksLoadMore.value = true;
    final result = await taskService.getQuickTasks(
        paginationQuery: PaginationQuery(
      completedTasks: true,
      page: ++quickTasksPageNumber,
      pageSize: completedQuickTaskPage,
    ));

    result.fold(
      (failure) {
        completedQuickTasksLoadMore.value = false;
        log(failure.message.toString());
      },
      (success) async {
        completedQuickTasks.addAll(success.data ?? []);
        completedQuickTasksLoadMore.value = false;
        for (var quickTask in success.data ?? <QuickTasks>[]) {
          await taskLocalService.addQuickTaskToLocalIfNotExists(
              quickTask: quickTask);
        }
      },
    );
  }

  // Create New next action date
  void createNewNextActionDate(
      {required EditTaskModel createNadModel,
      required BuildContext context}) async {
    loadingForNextActionDate.value = true;

    var userData = await SecureStorage.getToken();

    var list = singleTask.value.nextActionDate
            ?.map(
              (nextActionDateDatas) => NextActionDate(
                date: nextActionDateDatas.date ?? '',
                description: nextActionDateDatas.description ?? '',
                byWhom: nextActionDateDatas.userId ?? '',
              ),
            )
            .toList() ??
        [];

    list.add(NextActionDate(
      date: nextActionDate.value,
      description: nexActiondateDescriptionController.text,
      byWhom: userData.uid,
    ));

    createNadModel.nextActionDate = list;

    final result = await taskService.createNewNextActionDate(
        createNewNextActionDateModel: createNadModel);
    result.fold(
      (failure) {
        loadingForNextActionDate.value = false;
        nextActionDate.value = '';
        nexActiondateDescriptionController.clear();
        Navigator.of(context).pop(context);
        showCustomToast(
          message: errorMessage,
          backgroundColor: kred,
        );
        log(failure.error.toString());
      },
      (success) async {
        // Update the singleTask value using copyWith
        singleTask.value = singleTask.value.copyWith(
          nextActionDate: [
            ...(singleTask.value.nextActionDate ?? []),
            NextActionDateResponce(
              date: nextActionDate.value,
              description: nexActiondateDescriptionController.text,
              userId: userData.uid,
              userName: userData.name,
            )
          ],
        );
        loadingForNextActionDate.value = false;
        nextActionDate.value = '';
        nextActionDateAddedError.value = false;
        nexActiondateDescriptionController.clear();
        Navigator.of(context).pop(context);
        showCustomToast(
          message: 'Next action date created successfully',
          backgroundColor: Get.isDarkMode ? klightGrey : kblack,
          textColor: Get.isDarkMode ? kblack : kwhite,
        );
      },
    );
  }

  // Update New next action date
  void editNextActionDate(
      {required int index, required BuildContext context}) async {
    loadingForNextActionDate.value = true;
    List<NextActionDate> list = [];
    for (int i = 0; i < (singleTask.value.nextActionDate ?? []).length; i++) {
      final nad = singleTask.value.nextActionDate![i];
      if (i == index) {
        list.add(NextActionDate(
            byWhom: nad.userId,
            date: nextActionDate.value,
            description: nexActiondateDescriptionController.text));
      } else {
        list.add(NextActionDate(
            byWhom: nad.userId, date: nad.date, description: nad.description));
      }
    }
    final result = await taskService.updateNextActionDate(
        updateNextActionDateModel:
            EditTaskModel(taskId: singleTask.value.id, nextActionDate: list));
    result.fold(
      (failure) {
        loadingForNextActionDate.value = false;
        Navigator.of(context).pop(context);
        showCustomToast(
          message: errorMessage,
          backgroundColor: kred,
        );
        log(failure.error.toString());
      },
      (success) {
        Navigator.of(context).pop(context);
        showCustomToast(
          message: 'Next action date updated successfully',
          backgroundColor: Get.isDarkMode ? klightGrey : kblack,
          textColor: Get.isDarkMode ? kblack : kwhite,
        );
        loadingForNextActionDate.value = false;
      },
    );
  }

  void searchUsers(int index) {
    debouncer.run(() {
      switch (index) {
        case 0:
          recentlySearched(searchQuery: searchController.text);
          break;
        case 1:
          searchParticipants();
          break;
        case 2:
          searchParticipants();
          break;
        default:
      }
    });
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
