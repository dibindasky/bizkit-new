import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:bizkit/module/task/application/controller/folder/folder_controller.dart';
import 'package:bizkit/module/task/application/controller/home_controller/home_controller.dart';
import 'package:bizkit/module/task/data/service/task/task_service.dart';
import 'package:bizkit/module/task/domain/model/folders/edit_task_responce/edit_task_responce.dart';
import 'package:bizkit/module/task/domain/model/folders/remove_user_from_assigned_model/remove_user_from_assigned_model.dart';
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
import 'package:bizkit/module/task/domain/model/userSearch/user_search_model/user_search_model.dart';
import 'package:bizkit/module/task/domain/model/userSearch/user_search_success_responce/user_search_success_responce.dart';
import 'package:bizkit/module/task/domain/repository/service/task_repo.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
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
  //Controller for page comes bottom
  final ScrollController scrollController = ScrollController();

  Rx<TaskType> createTaskTupe = TaskType.official.obs;
  Rx<PriorityLevel> createPriorityLevel = PriorityLevel.medium.obs;
  Rx<FilterTypes> filterTypes = FilterTypes.all.obs;
  Rx<RecurringTimePeriod> createRecurringTimePeriod =
      RecurringTimePeriod.none.obs;
  RxBool createRecurring = false.obs;
  RxString deadlineDate = ''.obs;
  RxString deadlineDateForTaskCreation = ''.obs;
  RxBool taskscountChanged = false.obs;

  // List of participants involved in the task
  // var participants = <TaskAssignedTo>[].obs;
  var userslistNew = <UserSearchSuccessResponce>[].obs;
  var participantsForEditTask = <AssignedToDetail>[].obs;

  RxList<TaskExpenseAndTimeSuccessResponce> taskTotalTime =
      <TaskExpenseAndTimeSuccessResponce>[].obs;
  RxList<TaskExpenseAndTimeSuccessResponce> taskExpense =
      <TaskExpenseAndTimeSuccessResponce>[].obs;

  // Lists for storing various task types and deadlines
  RxList<Task> typeTasks = <Task>[].obs;
  RxList<Task> deadlineTasks = <Task>[].obs;
  RxList<SentRequest> sentRequests = <SentRequest>[].obs;
  RxList<Task> allPinnedTasks = <Task>[].obs;
  RxList<TasksCompletedOrKilled> completedTasks =
      <TasksCompletedOrKilled>[].obs;
  RxList<TasksCompletedOrKilled> killedTasks = <TasksCompletedOrKilled>[].obs;
  RxList<UserSearchSuccessResponce> userslist =
      <UserSearchSuccessResponce>[].obs;
  RxList<Task> tasksSearch = <Task>[].obs;
  RxList<Task> selectedTasks = <Task>[].obs;
  RxList<ReceivedTask> receivedRequests = <ReceivedTask>[].obs;
  RxMap<String, RxInt> tasksCounts = <String, RxInt>{}.obs;
  RxList<CompletedSubTasks> completedSubTasks = <CompletedSubTasks>[].obs;

  // Holds a single task response
  var singleTask = GetTaskResponce().obs;

  // Reactive list to store selected files
  RxList<PlatformFile> selectedFiles = <PlatformFile>[].obs;

  // List of subtasks related to the main task
  RxList<SubTask> subTasks = <SubTask>[].obs;

  // List of all available tags
  var tags = <String>[].obs;
  var tagsForEdit = <String>[].obs;

  // List of selected tags
  // var selectedTags = <String>[].obs;

  // List of colors for tags
  final List<Color> tagColor = [kred, kblue, kgreen, kgrey, kOrange];

  @override
  void onInit() {
    getTasksCountWithoutDate();
    final DateTime todaydate = DateTime.now();
    // Initialize with today's date for deadline filtering
    deadlineDate.value = DateFormat('yyyy-MM-dd').format(todaydate);
    log('Deadline  === > ${deadlineDate.value}');
    taskFilterByDeadline(
        filterByDeadline: FilterByDeadlineModel(date: deadlineDate.value));

    super.onInit();
  }

  // Test task ID for validation or testing purposes
  String testTaskId = '';

  RxBool fetchSingleTaskError = false.obs;

  // Reactive variable for loading state
  RxBool isLoading = false.obs;
  RxBool loadgingForFilterByType = false.obs;
  RxBool filterByTypeLoading = false.obs;
  RxBool taskCreationLoading = false.obs;
  RxBool taskEditLoading = false.obs;
  RxBool searchLoading = false.obs;
  RxBool taskSearchLoading = false.obs;
  RxBool pinLoader = false.obs;
  RxBool isLoadingForSpotLight = false.obs;
  RxBool taksListLoading = false.obs;
  RxBool loadingForSendRequests = false.obs;
  RxBool loadingForRecivedRequests = false.obs;

  RxList<String> taskTotalTimeKeys = <String>[].obs;
  RxList<String> taskExpenseKeys = <String>[].obs;

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
  // void toggleTagSelection(String tag) {
  //   if (selectedTags.contains(tag)) {
  //     selectedTags.remove(tag);
  //   } else {
  //     selectedTags.add(tag);
  //     log('selectedTags : $selectedTags');
  //   }
  // }

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
        log('${success.message}');
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

    log('Edit assignedTo  ==> ${taskModel.assignedTo}');

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
        log('receivedRequests :=> $receivedRequests');
        loadingForRecivedRequests.value = false;
      },
    );
  }

  // Filters tasks by deadline using the provided model
  void taskFilterByDeadline(
      {required FilterByDeadlineModel filterByDeadline}) async {
    taksListLoading.value = true;

    final result =
        await taskService.filterByDeadline(filterByDeadline: filterByDeadline);
    result.fold(
      (failure) {
        log(failure.message.toString());
        taksListLoading.value = false;
      },
      (success) {
        deadlineTasks.assignAll(success.tasks ?? []);

        taksListLoading.value = false;
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
        }
        if (tasksFromTasksList) {
          taskFilterByDeadline(
              filterByDeadline:
                  FilterByDeadlineModel(date: deadlineDate.value));
        }

        scaffoldMessenger.showSnackBar(
          const SnackBar(
            content: Text('Successfully Pinned this task'),
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
        }

        if (tasksFromTasksList) {
          taskFilterByDeadline(
              filterByDeadline:
                  FilterByDeadlineModel(date: deadlineDate.value));
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
  void filterByType({required FilterByTypeModel filterByType}) async {
    filterByTypeLoading.value = true;
    final result = await taskService.filterByType(filterByType: filterByType);

    result.fold(
      (failure) {
        filterByTypeLoading.value = false;
        log(failure.message.toString());
      },
      (success) {
        typeTasks.assignAll(success.tasks ?? []);
        filterByTypeLoading.value = false;
        update(); // Update the UI or state
      },
    );
  }

  // Filters pinned tasks by type using the provided model
  void filterPinnedTasksByType(
      {required FilterPinnedTaskByTypeModel filterPinnedTask,
      bool pinn = false}) async {
    filterByTypeLoading.value = true;
    final result = await taskService.filterPinnedTaskByType(
        filterPinnedTaskByType: filterPinnedTask);
    update();
    result.fold(
      (failure) {
        filterByTypeLoading.value = false;
      },
      (success) {
        allPinnedTasks.assignAll(success.tasks ?? []);
        filterByTypeLoading.value = false;

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
      },
    );
  }

  // Searches for tasks based on the search term
  void searchTasks({required String searchItem}) async {
    taskSearchLoading.value = true;

    final result = await taskService.taskSearch(
        taskSearchItem: UserSearchModel(searchTerm: searchItem));
    result.fold(
      (failure) {
        taskSearchLoading.value = false;
        log(failure.message.toString());
      },
      (success) {
        if (success.tasks != null) {
          tasksSearch.clear();
          tasksSearch.addAll(success.tasks ?? []);
          taskSearchLoading.value = false;
        } else {
          log("Received null tasks in the response");
        }
      },
    );
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
    // log('SubTask completed = > ${completedSubTask.toJson()}');

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

  void fetchTaskExpense({required GetSingleTaskModel taskId}) async {
    isLoading.value = true;
    final result = await taskService.getTaskExpense(taskId: taskId);

    result.fold(
      (failure) {
        isLoading.value = false;
        log(failure.message.toString());
      },
      (success) {
        taskExpenseKeys.value = success.keys.toList();
        List<TaskExpenseAndTimeSuccessResponce> tempList = [];

        for (var element in taskExpenseKeys) {
          tempList.add(
            TaskExpenseAndTimeSuccessResponce.fromJson(success[element]),
          );
        }

        taskExpense.value = tempList;
        log('taskExpense  ====> ${taskExpense.toJson()}');

        isLoading.value = false;
      },
    );
  }

  void fetchTaskTotalTime({required GetSingleTaskModel taskId}) async {
    isLoading.value = true;
    final result = await taskService.getTaskTotalTime(taskId: taskId);

    result.fold(
      (failure) {
        isLoading.value = false;
        log(failure.message.toString());
      },
      (success) {
        taskTotalTimeKeys.value = success.keys.toList();
        List<TaskExpenseAndTimeSuccessResponce> tempList = [];

        for (var element in taskTotalTimeKeys) {
          tempList.add(
            TaskExpenseAndTimeSuccessResponce.fromJson(success[element]),
          );
        }

        taskTotalTime.value = tempList;
        log('taskTotalTime  ====> ${taskTotalTime.toJson()}');
        isLoading.value = false;
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
  }
}
