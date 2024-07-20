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
import 'package:bizkit/module/task/domain/model/folders/inner_folder/task_add_or_delete_inner_folder_model/task_add_or_delete_inner_folder_model.dart';
import 'package:bizkit/module/task/domain/model/folders/merge_folder_model/merge_folder_model.dart';
import 'package:bizkit/module/task/domain/model/folders/task_add_to_folder_model/task_add_to_folder_model.dart';
import 'package:bizkit/module/task/domain/repository/service/folder_repo.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TaskFolderController extends GetxController {
  RxList<Datum> allFolders = <Datum>[].obs;

  RxList<String> selectedFolderIds = <String>[].obs;

  RxList<InsideAFolderTasks> tasksInsideFolder = <InsideAFolderTasks>[].obs;
  RxList<InnerFolderTask> tasksInsideInnerFolder = <InnerFolderTask>[].obs;

  RxList<InnerFolder> innerFolders = <InnerFolder>[].obs;

  RxList<FilteredFolder> filteredInnerFolders = <FilteredFolder>[].obs;

  RxList<FilteredFolders> filteredFoldersByDeadline = <FilteredFolders>[].obs;

  RxBool isLoading = false.obs;

  RxString deadlineDate = ''.obs;

  // Folder Id
  String folderId = '';

  RxString foldername = ''.obs;

  String afterMergeNewFolderId = '';

  String innerFolderId = '';

  final FolderRepo folderService = FolderService();

  @override
  void onInit() {
    final DateTime todaydate = DateTime.now();
    // Initialize with today's date for deadline filtering
    filterFoldersByDeadline(
        filterFolder: FilterFolderByDeadlineModel(
            filterDate: DateFormat('yyyy-MM-dd').format(todaydate)));
    super.onInit();
  }

  void toggleFolderSelection(String folderId) {
    if (selectedFolderIds.contains(folderId)) {
      selectedFolderIds.remove(folderId);
    } else {
      selectedFolderIds.add(folderId);
    }
    log('selectedFolderIds : = > $selectedFolderIds');
    log('selectedFolderIds : => ${selectedFolderIds.length}');
  }

  void createNewFolder({required FolderModel folder}) async {
    isLoading.value = true;
    final result = await folderService.createNewFolder(folder: folder);
    result.fold(
      (failure) {
        isLoading.value = false;
        log(failure.message.toString());
      },
      (success) {
        log('${success.message}');
        isLoading.value = false;
        folderId = success.folderId.toString();

        fetchAllFolders();
      },
    );
  }

  void fetchAllFolders() async {
    isLoading.value = true;
    final result = await folderService.getAllFolder();
    result.fold(
      (failure) {
        isLoading.value = false;
        log(failure.message.toString());
      },
      (success) {
        isLoading.value = false;
        allFolders.assignAll(success.data ?? []);
      },
    );
  }

  void editFolderName({required EditFolderModel editFolderName}) async {
    isLoading.value = true;
    final result =
        await folderService.editFolderName(editFolderName: editFolderName);
    result.fold(
      (failure) {
        isLoading.value = false;
        log(failure.message.toString());
      },
      (success) {
        log('${success.message}');
        fetchAllFolders();
        isLoading.value = false;
      },
    );
  }

  void deleteFolder({required DeleteFolderModel deleteFolder}) async {
    isLoading.value = true;
    final result = await folderService.deleteFolder(deleteFolder: deleteFolder);
    result.fold(
      (failure) {
        isLoading.value = false;
        log(failure.message.toString());
      },
      (success) {
        log('${success.message}');
        filterFoldersByDeadline(
            filterFolder: FilterFolderByDeadlineModel(
                filterDate: deadlineDate.toString()));
        isLoading.value = false;
      },
    );
  }

  void tasksAddToFolder({required TaskAddToFolderModel taskAddToFolder}) async {
    isLoading.value = true;
    final result =
        await folderService.tasksAddToFolder(taskAddToFolder: taskAddToFolder);
    result.fold(
      (failure) {
        isLoading.value = false;
        log(failure.message.toString());
      },
      (success) {
        log('${success.message}');
        isLoading.value = false;
      },
    );
  }

  void mergeFolders({required MergeFolderModel mergeFolders}) async {
    isLoading.value = true;
    final result = await folderService.mergeFolders(
      mergeFolders: mergeFolders,
    );
    result.fold(
      (failure) {
        isLoading.value = false;
        log(failure.message.toString());
      },
      (success) {
        isLoading.value = false;
        log('${success.message}');
        afterMergeNewFolderId = success.newFolderId ?? '';
        selectedFolderIds.clear();
        fetchAllFolders();
      },
    );
  }

  void createNewFolderInsideFolder(
      {required CreateFolderInsideAFolder createNewFolderInsideFolder}) async {
    isLoading.value = true;
    final result = await folderService.createNewFolderInsideFolder(
        createNewFolderInsideFolder: createNewFolderInsideFolder);

    result.fold(
      (failure) {
        isLoading.value = false;
        log(failure.message.toString());
      },
      (success) {
        isLoading.value = false;
        log('${success.message}');
      },
    );
  }

  void fetchTasksInsideFolder(
      {required GetTaskInsideAFolderParamsModel taskInsideFolder}) async {
    final result = await folderService.getTasksInsideFolder(
        taskInsideFolder: taskInsideFolder);

    result.fold(
      (failure) {
        isLoading.value = false;
        log(failure.message.toString());
      },
      (success) {
        foldername.value = success.data?.first.folderName ?? 'Folder Name';
        tasksInsideFolder.assignAll(success.data?.first.tasks ?? []);
        innerFolders.assignAll(success.data?.first.innerFolders ?? []);
        isLoading.value = false;
      },
    );
  }

  void deleteInnerFolder(
      {required DeleteInnerFolderModel deleteInnerFolder}) async {
    final result = await folderService.deleteInnerFolder(
      deleteInnerFolder: deleteInnerFolder,
    );

    result.fold(
      (failure) {
        isLoading.value = false;
        log(failure.message.toString());
      },
      (success) {
        log('${success.message}');
        isLoading.value = false;
      },
    );
  }

  void editInnerFolderName(
      {required EditInnerFolderModel editInnerFolderName}) async {
    isLoading.value = true;
    final result = await folderService.editInnerFolder(
        editInnerFolder: editInnerFolderName);
    result.fold(
      (failure) {
        isLoading.value = false;
        log(failure.message.toString());
      },
      (success) {
        log('${success.message}');
        isLoading.value = false;
      },
    );
  }

  void taskAddOrDeleteInnerFolder(
      {required TaskAddOrDeleteInnerFolderModel taskAddOrDelete}) async {
    final result = await folderService.taskAddOrDeleteInnerFolder(
        taskAddOrDelete: taskAddOrDelete);
    result.fold(
      (failure) {
        isLoading.value = false;
        log(failure.message.toString());
      },
      (success) {
        log('${success.message}');
        isLoading.value = false;
      },
    );
  }

  void fetchAllTasksInsideAInnerFolder(
      InnerFolderTasksGetParamsModel innerFolderGetParams) async {
    isLoading.value = true;
    final result = await folderService.getTasksInsideAInnerFolder(
        innerFolderGetParams: innerFolderGetParams);
    result.fold(
      (failure) {
        isLoading.value = false;
        log(failure.message.toString());
      },
      (success) {
        tasksInsideInnerFolder
            .assignAll(success.data?.first.innerFolderTasks ?? []);
        log('tasksInsideInnerFolder :=> $tasksInsideInnerFolder');
        isLoading.value = false;
      },
    );
  }

  void filterInnerFolderByDeadline(
      {required FilterInnerFolderModel filterInnerFolder}) async {
    isLoading.value = true;
    final result = await folderService.filterInnerFolderByDealine(
        filterInnerFolder: filterInnerFolder);
    result.fold(
      (failure) {
        isLoading.value = false;
        log(failure.message.toString());
      },
      (success) {
        filteredInnerFolders.assignAll(success.filteredFolders ?? []);
        isLoading.value = false;
      },
    );
  }

  void filterFoldersByDeadline(
      {required FilterFolderByDeadlineModel filterFolder}) async {
    isLoading.value = true;
    final result =
        await folderService.filterFolderByDeadline(filterFolder: filterFolder);
    result.fold(
      (failure) {
        isLoading.value = false;
        log(failure.message.toString());
      },
      (success) {
        filteredFoldersByDeadline.assignAll(success.filteredFolders ?? []);
        isLoading.value = false;
      },
    );
  }
}
