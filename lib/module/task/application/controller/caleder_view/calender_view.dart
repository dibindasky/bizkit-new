import 'dart:developer';

import 'package:bizkit/module/task/data/service/folder/folder_service.dart';
import 'package:bizkit/module/task/domain/model/folders/all_folders_responce/datum.dart';
import 'package:bizkit/module/task/domain/model/folders/edit_folder_model/edit_folder_model.dart';
import 'package:bizkit/module/task/domain/model/folders/folder_add_model/folder_add_model.dart';
import 'package:bizkit/module/task/domain/model/folders/folder_model/folder_model.dart';
import 'package:bizkit/module/task/domain/model/folders/taks_in_side_a_folder_success_responce/taks_in_side_a_folder_success_responce.dart';
import 'package:bizkit/module/task/domain/repository/service/folder_repo.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:get/get.dart';

class TaskCalenderViewController extends GetxController {
  RxInt taskTabChangeIndex = 1.obs;
  RxBool selectedFolderContainer = false.obs;
  RxString deadLine = ''.obs;
  RxString priority = ''.obs;
  RxString taskType = ''.obs;
  RxBool isLoading = false.obs;

  RxList<Datum> allFolders = <Datum>[].obs;
  RxList<FolderModels> taskInSideAFolder = <FolderModels>[].obs;

  RxList selectedTasks = [].obs;
// Folder Id
  String folderId = '';

  @override
  void onInit() {
    super.onInit();
    if (names.isNotEmpty) {
      deadLine.value = names[0];
      priority.value = names[1];
      taskType.value = names[2];
    }
  }

  final FolderRepo folderService = FolderService();

  taskTabchangeIndex(int index) {
    taskTabChangeIndex.value = index;
  }

  changeDeadLineData(String newDeadLine) {
    deadLine.value = newDeadLine;
    update();
  }

  changePriorityData(String newPriority) {
    deadLine.value = newPriority;
    update();
  }

  changeTaskTypeData(String newTaskType) {
    deadLine.value = newTaskType;
    update();
  }

  var selectedIndices = <int>[].obs;

  void longPress(bool isSelected, int index) {
    if (isSelected) {
      if (!selectedIndices.contains(index)) {
        selectedIndices.add(index);
      }
    } else {
      if (selectedIndices.contains(index)) {
        selectedIndices.remove(index);
      }
    }
    selectedFolderContainer.value = selectedIndices.isNotEmpty;
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

  void addNewTaskInFolder({required FolderAddModel addNewTaskInFolder}) async {
    isLoading.value = true;
    final result = await folderService.addNewTaskInFolder(
        addTaskInFolder: addNewTaskInFolder);
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
        taskInSideAFolder.assignAll(success.data);
      },
    );
  }

  void editFolderName({required EditFolderModel editFolderName}) async {
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
}
