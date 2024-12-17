import 'dart:developer';

import 'package:bizkit/module/task/data/service/folder/folder_service.dart';
import 'package:bizkit/module/task/domain/model/folders/all_folders_responce/datum.dart';
import 'package:bizkit/module/task/domain/model/folders/delete_folder_model/delete_folder_model.dart';
import 'package:bizkit/module/task/domain/model/folders/edit_folder_model/edit_folder_model.dart';
import 'package:bizkit/module/task/domain/model/folders/filter_folder_by_deadline_model/filter_folder_by_deadline_model.dart';
import 'package:bizkit/module/task/domain/model/folders/filter_folders_by_deadlin_success_responce/filtered_folder.dart';
import 'package:bizkit/module/task/domain/model/folders/folder_model/folder_model.dart';
import 'package:bizkit/module/task/domain/model/folders/get_task_inside_a_folder_params_model/get_task_inside_a_folder_params_model.dart';
import 'package:bizkit/module/task/domain/model/folders/get_tasks_inside_folder_success_responce/inner_folder.dart';
import 'package:bizkit/module/task/domain/model/folders/get_tasks_inside_folder_success_responce/task.dart';
import 'package:bizkit/module/task/domain/model/folders/inner_folder/create_folder_inside_a_folder/create_folder_inside_a_folder.dart';
import 'package:bizkit/module/task/domain/model/folders/inner_folder/delete_inner_folder_model/delete_inner_folder_model.dart';
import 'package:bizkit/module/task/domain/model/folders/inner_folder/edit_inner_folder_model/edit_inner_folder_model.dart';
import 'package:bizkit/module/task/domain/model/folders/inner_folder/filter_inner_folder_modle/filter_inner_folder_modle.dart';
import 'package:bizkit/module/task/domain/model/folders/inner_folder/filter_inner_folder_success_responce/filtered_folder.dart';
import 'package:bizkit/module/task/domain/model/folders/inner_folder/get_all_tasks_inner_folder_responce/inner_folder_task.dart';
import 'package:bizkit/module/task/domain/model/folders/inner_folder/inner_folder_tasks_get_params_model/inner_folder_tasks_get_params_model.dart';
import 'package:bizkit/module/task/domain/model/folders/inner_folder/merge_inner_folder_model/merge_inner_folder_model.dart';
import 'package:bizkit/module/task/domain/model/folders/inner_folder/task_add_or_delete_inner_folder_model/task_add_or_delete_inner_folder_model.dart';
import 'package:bizkit/module/task/domain/model/folders/merge_folder_model/merge_folder_model.dart';
import 'package:bizkit/module/task/domain/model/folders/task_add_to_folder_model/task_add_to_folder_model.dart';
import 'package:bizkit/module/task/domain/model/task/spot_light_task/spot_light_task.dart';
import 'package:bizkit/module/task/domain/repository/service/folder_repo.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/snackbar/flutter_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TaskFolderController extends GetxController {
  RxList<Datum> allFolders = <Datum>[].obs;

  RxList<String> selectedFolderIds = <String>[].obs;
  RxList<String> selectedInnerFolderIds = <String>[].obs;

  RxList<InsideAFolderTasks> tasksInsideFolder = <InsideAFolderTasks>[].obs;
  RxList<InnerFolderTask> tasksInsideInnerFolder = <InnerFolderTask>[].obs;

  RxList<InnerFolder> innerFolders = <InnerFolder>[].obs;

  RxList<FilteredFolder> filteredInnerFolders = <FilteredFolder>[].obs;

  RxList<FilteredFolders> filteredFoldersByDeadline = <FilteredFolders>[].obs;

  RxBool isLoading = false.obs;
  RxBool folderNameLoading = false.obs;
  RxBool getFoldersLoading = false.obs;

  RxString deadlineDate = ''.obs;

  // Folder Id
  String folderId = '';

  RxString foldername = ''.obs;

  String afterMergeNewFolderId = '';

  String innerFolderId = '';

  Rx<DateTime> selectedDate = DateTime.now().obs;

  RxBool selectedFolderContainer = false.obs;

  var selectedIndices = <int>[].obs;

  final FolderRepo folderService = FolderService();

  @override
  void onInit() {
    final DateTime todaydate = DateTime.now();
    deadlineDate.value = DateFormat('yyyy-MM-dd').format(todaydate);

    // Initialize with today's date for deadline filtering
    filterFoldersByDeadline(
        filterFolder:
            FilterFolderByDeadlineModel(filterDate: deadlineDate.value));
    super.onInit();
  }

  void selctDate(DateTime value) {
    selectedDate.value = value;
  }

  void longPress(int index) {
    if (selectedIndices.contains(index)) {
      selectedIndices.remove(index);
    } else {
      selectedIndices.add(index);
    }
    selectedFolderContainer.value = selectedIndices.isNotEmpty;
  }

  void toggleFolderSelection(String folderId) {
    if (selectedFolderIds.contains(folderId)) {
      selectedFolderIds.remove(folderId);
    } else {
      selectedFolderIds.add(folderId);
    }
    // log('selectedFolderIds : = > $selectedFolderIds');
    // log('selectedFolderIds : => ${selectedFolderIds.length}');
  }

  void toggleInnerFolderSelection(String innerFolderId) {
    if (selectedInnerFolderIds.contains(innerFolderId)) {
      selectedInnerFolderIds.remove(innerFolderId);
    } else {
      selectedInnerFolderIds.add(innerFolderId);
    }
    // log('selectedInnerFolderIds : = > $selectedInnerFolderIds');
    // log('selectedInnerFolderIds : => ${selectedInnerFolderIds.length}');
  }

  void createNewFolder({
    required FolderModel folder,
  }) async {
    isLoading.value = true;

    final result = await folderService.createNewFolder(folder: folder);
    result.fold(
      (failure) {
        isLoading.value = false;
        showCustomToast(
          message: errorMessage,
          backgroundColor: kred,
        );
        log(failure.message.toString());
      },
      (success) {
        log('${success.message}');
        isLoading.value = false;
        folderId = success.folderId.toString();
        // filterFoldersByDeadline(
        //     filterFolder:
        //         FilterFolderByDeadlineModel(filterDate: deadlineDate.value));
        filteredFoldersByDeadline.add(FilteredFolders(
            folderName: folder.folderName, folderId: success.folderId));

        showCustomToast(
          message: 'Folder created successfully',
          backgroundColor: Get.isDarkMode ? klightGrey : kblack,
          textColor: Get.isDarkMode ? kblack : kwhite,
        );
        isLoading.value = false;
      },
    );
    isLoading.value = false;
  }

  void editFolderName({
    required EditFolderModel editFolderName,
  }) async {
    isLoading.value = true;

    final result =
        await folderService.editFolderName(editFolderName: editFolderName);
    result.fold(
      (failure) {
        isLoading.value = false;
        showCustomToast(
          message: errorMessage,
          backgroundColor: kred,
        );
        log(failure.message.toString());
      },
      (success) {
        log('${success.message}');
        isLoading.value = false;
        // filterFoldersByDeadline(
        //     filterFolder:
        //         FilterFolderByDeadlineModel(filterDate: deadlineDate.value));
        int index = filteredFoldersByDeadline
            .indexWhere((data) => data.folderId == editFolderName.folderId);
        if (index != -1) {
          filteredFoldersByDeadline[index] = filteredFoldersByDeadline[index]
              .copyWith(folderName: editFolderName.folderName);
        }

        showCustomToast(
          message: 'Folder name edited successfully',
          backgroundColor: Get.isDarkMode ? klightGrey : kblack,
          textColor: Get.isDarkMode ? kblack : kwhite,
        );

        isLoading.value = false;
      },
    );
    isLoading.value = false;
  }

  void deleteFolder({
    required DeleteFolderModel deleteFolder,
  }) async {
    isLoading.value = true;

    final result = await folderService.deleteFolder(deleteFolder: deleteFolder);
    result.fold(
      (failure) {
        isLoading.value = false;
        showCustomToast(
          message: errorMessage,
          backgroundColor: kred,
        );
        log(failure.message.toString());
      },
      (success) {
        log('${success.message}');
        // filterFoldersByDeadline(
        //     filterFolder:
        //         FilterFolderByDeadlineModel(filterDate: deadlineDate.value));
        filteredFoldersByDeadline
            .removeWhere((data) => data.folderId == deleteFolder.folderId);

        showCustomToast(
          message: 'Folder deleted successfully',
          backgroundColor: Get.isDarkMode ? klightGrey : kblack,
          textColor: Get.isDarkMode ? kblack : kwhite,
        );

        isLoading.value = false;
      },
    );
  }

  void tasksAddToFolder({
    required TaskAddToFolderModel taskAddToFolder,
    required bool addOrDelete,
  }) async {
    isLoading.value = true;

    final result =
        await folderService.tasksAddToFolder(taskAddToFolder: taskAddToFolder);
    result.fold(
      (failure) {
        isLoading.value = false;
        showCustomToast(
          message: errorMessage,
          backgroundColor: kred,
        );
        log(failure.message.toString());
      },
      (success) {
        isLoading.value = false;
        addOrDelete == true
            ? showCustomToast(
                message: 'Tasks added successfully',
                backgroundColor: Get.isDarkMode ? klightGrey : kblack,
                textColor: Get.isDarkMode ? kblack : kwhite,
              )
            : showCustomToast(
                message: 'Task removed successfully',
                backgroundColor: Get.isDarkMode ? klightGrey : kblack,
                textColor: Get.isDarkMode ? kblack : kwhite,
              );
        isLoading.value = false;
      },
    );
    isLoading.value = false;
  }

  void mergeFolders({
    required MergeFolderModel mergeFolders,
  }) async {
    isLoading.value = true;

    final result = await folderService.mergeFolders(
      mergeFolders: mergeFolders,
    );
    result.fold(
      (failure) {
        isLoading.value = false;
        showCustomToast(
          message: errorMessage,
          backgroundColor: kred,
        );
        log(failure.message.toString());
      },
      (success) {
        isLoading.value = false;
        log('${success.message}');
        afterMergeNewFolderId = success.newFolderId ?? '';
        selectedFolderIds.clear();
        filterFoldersByDeadline(
            filterFolder:
                FilterFolderByDeadlineModel(filterDate: deadlineDate.value));

        showCustomToast(
          message: 'Folder Merged successfully',
          backgroundColor: Get.isDarkMode ? klightGrey : kblack,
          textColor: Get.isDarkMode ? kblack : kwhite,
        );
      },
    );
    isLoading.value = false;
  }

  void createNewFolderInsideFolder({
    required CreateFolderInsideAFolder createNewFolderInsideFolder,
    required String folderId,
  }) async {
    isLoading.value = true;

    final result = await folderService.createNewFolderInsideFolder(
        createNewFolderInsideFolder: createNewFolderInsideFolder);

    result.fold(
      (failure) {
        isLoading.value = false;
        showCustomToast(
          message: errorMessage,
          backgroundColor: kred,
        );
        log(failure.message.toString());
      },
      (success) {
        isLoading.value = false;
        // filterInnerFolderByDeadline(
        //     filterInnerFolder: FilterInnerFolderModel(
        //         folderId: folderId, filterDate: deadlineDate.value));
        filteredInnerFolders.add(FilteredFolder(
            innerFolderId: createNewFolderInsideFolder.folderId,
            innerFolderName: createNewFolderInsideFolder.innerFolderName));

        showCustomToast(
          message: 'Create Inner folder successfully',
          backgroundColor: Get.isDarkMode ? klightGrey : kblack,
          textColor: Get.isDarkMode ? kblack : kwhite,
        );
        isLoading.value = false;
        log('${success.message}');
      },
    );
    isLoading.value = false;
  }

  void fetchTasksInsideFolder(
      {required GetTaskInsideAFolderParamsModel taskInsideFolder}) async {
    getFoldersLoading.value = true;
    final result = await folderService.getTasksInsideFolder(
        taskInsideFolder: taskInsideFolder);

    result.fold(
      (failure) {
        getFoldersLoading.value = false;
        log(failure.message.toString());
      },
      (success) {
        foldername.value = success.data?.first.folderName ?? 'Folder Name';
        tasksInsideFolder.assignAll(success.data?.first.tasks ?? []);
        innerFolders.assignAll(success.data?.first.innerFolders ?? []);
        getFoldersLoading.value = false;
      },
    );
  }

  void deleteInnerFolder({
    required DeleteInnerFolderModel deleteInnerFolder,
    required String folderId,
  }) async {
    isLoading.value = true;

    final result = await folderService.deleteInnerFolder(
      deleteInnerFolder: deleteInnerFolder,
    );

    result.fold(
      (failure) {
        isLoading.value = false;
        showCustomToast(
          message: errorMessage,
          backgroundColor: kred,
        );
        log(failure.message.toString());
      },
      (success) {
        log('${success.message}');
        // filterInnerFolderByDeadline(
        //     filterInnerFolder: FilterInnerFolderModel(
        //         folderId: folderId, filterDate: deadlineDate.value));
        // fetchTasksInsideFolder(
        //   taskInsideFolder: GetTaskInsideAFolderParamsModel(
        //     folderId: folderId,
        //   ),
        // );

        filteredInnerFolders.removeWhere(
            (data) => data.innerFolderId == deleteInnerFolder.innerFolderId);

        showCustomToast(
          message: 'Inner folder deleted successfully',
          backgroundColor: Get.isDarkMode ? klightGrey : kblack,
          textColor: Get.isDarkMode ? kblack : kwhite,
        );

        isLoading.value = false;
      },
    );
  }

  void editInnerFolderName(
      {required EditInnerFolderModel editInnerFolderName,
      required String folderId}) async {
    isLoading.value = true;

    final result = await folderService.editInnerFolder(
        editInnerFolder: editInnerFolderName);
    result.fold(
      (failure) {
        isLoading.value = false;
        showCustomToast(
          message: errorMessage,
          backgroundColor: kred,
        );
        log(failure.message.toString());
      },
      (success) {
        isLoading.value = false;
        log('${success.message}');
        // filterInnerFolderByDeadline(
        //     filterInnerFolder: FilterInnerFolderModel(
        //         folderId: folderId, filterDate: deadlineDate.value));

        int index = filteredInnerFolders.indexWhere(
            (data) => data.innerFolderId == editInnerFolderName.innerFolderId);
        filteredInnerFolders[index] = filteredInnerFolders[index]
            .copyWith(innerFolderName: editInnerFolderName.innerFolderName);

        showCustomToast(
          message: 'Inner folder name edited successfully',
          backgroundColor: Get.isDarkMode ? klightGrey : kblack,
          textColor: Get.isDarkMode ? kblack : kwhite,
        );
        isLoading.value = false;
      },
    );
    isLoading.value = false;
  }

  void taskAddOrDeleteInnerFolder(
      {required TaskAddOrDeleteInnerFolderModel taskAddOrDelete,
      required bool addOrDelete}) async {
    isLoading.value = true;

    final result = await folderService.taskAddOrDeleteInnerFolder(
        taskAddOrDelete: taskAddOrDelete);
    result.fold(
      (failure) {
        isLoading.value = false;
        showCustomToast(
          message: errorMessage,
          backgroundColor: kred,
        );
        log(failure.message.toString());
      },
      (success) {
        isLoading.value = false;
        addOrDelete == true
            ? showCustomToast(
                message: 'Tasks added successfully',
                backgroundColor: Get.isDarkMode ? klightGrey : kblack,
                textColor: Get.isDarkMode ? kblack : kwhite,
              )
            : showCustomToast(
                message: 'Task removed successfully',
                backgroundColor: Get.isDarkMode ? klightGrey : kblack,
                textColor: Get.isDarkMode ? kblack : kwhite,
              );
        isLoading.value = false;
      },
    );
    isLoading.value = false;
  }

  void fetchAllTasksInsideAInnerFolder(
    InnerFolderTasksGetParamsModel innerFolderGetParams,
  ) async {
    getFoldersLoading.value = true;

    final result = await folderService.getTasksInsideAInnerFolder(
        innerFolderGetParams: innerFolderGetParams);
    result.fold(
      (failure) {
        getFoldersLoading.value = false;
        log(failure.message.toString());
      },
      (success) {
        tasksInsideInnerFolder
            .assignAll(success.data?.first.innerFolderTasks ?? []);
        getFoldersLoading.value = false;
      },
    );
  }

  void filterInnerFolderByDeadline({
    required FilterInnerFolderModel filterInnerFolder,
  }) async {
    getFoldersLoading.value = true;
    final result = await folderService.filterInnerFolderByDealine(
        filterInnerFolder: filterInnerFolder);
    result.fold(
      (failure) {
        getFoldersLoading.value = false;
        log(failure.message.toString());
      },
      (success) {
        filteredInnerFolders.assignAll(success.filteredFolders ?? []);
        getFoldersLoading.value = false;
      },
    );
  }

  void filterFoldersByDeadline(
      {required FilterFolderByDeadlineModel filterFolder}) async {
    getFoldersLoading.value = true;
    final result =
        await folderService.filterFolderByDeadline(filterFolder: filterFolder);
    result.fold(
      (failure) {
        getFoldersLoading.value = false;
        log(failure.message.toString());
      },
      (success) {
        filteredFoldersByDeadline.assignAll(success.filteredFolders ?? []);
        getFoldersLoading.value = false;
      },
    );
  }

  void mergeInnerFolders(
      {required MergeInnerFolderModel mergeInnerFolders,
      required String folderId}) async {
    isLoading.value = true;

    final result = await folderService.mergeInnerFolders(
        mergeInnerFolders: mergeInnerFolders);

    result.fold(
      (failure) {
        isLoading.value = false;
        showCustomToast(
          message: errorMessage,
          backgroundColor: kred,
        );
        log(failure.message.toString());
      },
      (success) {
        selectedInnerFolderIds.clear();
        selectedIndices.clear();
        selectedFolderContainer.value = false;
        filterInnerFolderByDeadline(
          filterInnerFolder: FilterInnerFolderModel(
            folderId: folderId,
            filterDate: deadlineDate.value,
          ),
        );
        showCustomToast(
          message: 'Inner Folders Merged successfully',
          backgroundColor: Get.isDarkMode ? klightGrey : kblack,
          textColor: Get.isDarkMode ? kblack : kwhite,
        );

        isLoading.value = false;
      },
    );
  }

  void folderSpotLightOnOrOff({required SpotLightTask spotLightTask}) async {
    for (var i = 0; i < tasksInsideFolder.length; i++) {
      if (tasksInsideFolder[i].taskId == spotLightTask.taskId) {
        tasksInsideFolder[i] = tasksInsideFolder[i]
            .copyWith(spotlightOn: spotLightTask.spotLightStatus);
        break;
      }
    }
  }

  void innerFolderSpotLightOnOrOff(
      {required SpotLightTask spotLightTask}) async {
    for (var i = 0; i < tasksInsideInnerFolder.length; i++) {
      if (tasksInsideInnerFolder[i].taskId == spotLightTask.taskId) {
        tasksInsideInnerFolder[i] = tasksInsideInnerFolder[i]
            .copyWith(spotlightOn: spotLightTask.spotLightStatus);
        break;
      }
    }
  }

  void clearAllDatas() async {
    tasksInsideFolder.clear();
    tasksInsideInnerFolder.clear();
    filteredInnerFolders.clear();
    filteredFoldersByDeadline.clear();
    deadlineDate.value = '';
    allFolders.clear();
    selectedFolderIds.clear();
    selectedInnerFolderIds.clear();
  }
}
