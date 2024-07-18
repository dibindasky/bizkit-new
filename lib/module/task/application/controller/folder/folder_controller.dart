import 'dart:developer';

import 'package:bizkit/module/task/data/service/folder/folder_service.dart';
import 'package:bizkit/module/task/domain/model/folders/all_folders_responce/datum.dart';
import 'package:bizkit/module/task/domain/model/folders/all_tasks_inside_a_folder_responce/tasks_inside_folder/tasks_inside_folder.dart';

import 'package:bizkit/module/task/domain/model/folders/delete_folder_model/delete_folder_model.dart';
import 'package:bizkit/module/task/domain/model/folders/edit_folder_model/edit_folder_model.dart';

import 'package:bizkit/module/task/domain/model/folders/folder_model/folder_model.dart';
import 'package:bizkit/module/task/domain/model/folders/merge_folder_model/merge_folder_model.dart';
import 'package:bizkit/module/task/domain/model/folders/task_add_to_folder_model/task_add_to_folder_model.dart';
import 'package:bizkit/module/task/domain/repository/service/folder_repo.dart';
import 'package:get/get.dart';

class TaskFolderController extends GetxController {
  RxList<Datum> allFolders = <Datum>[].obs;
  RxList<TasksInsideFolder> taskInSideAFolder = <TasksInsideFolder>[].obs;

  RxList<String> selectedFolderIds = <String>[].obs;

  RxBool isLoading = false.obs;

  // Folder Id
  String folderId = '';

  String afterMergeNewFolderId = '';

  final FolderRepo folderService = FolderService();

  void toggleFolderSelection(String folderId) {
    log('selectedFolderIds : = > $selectedFolderIds');
    if (selectedFolderIds.contains(folderId)) {
      selectedFolderIds.remove(folderId);
    }
    selectedFolderIds.add(folderId);
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
        fetchAllFolders();
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

  void fetchAllTasksInsideAFolder({required String folderId}) async {
    isLoading.value = true;
    final result =
        await folderService.getTasksInsideAFolder(folderId: folderId);
    result.fold(
      (failure) {
        isLoading.value = false;
        log(failure.message.toString());
      },
      (success) {
        isLoading.value = false;
        taskInSideAFolder.assignAll(success.data ?? []);
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
      },
    );
  }
}
