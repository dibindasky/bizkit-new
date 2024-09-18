import 'package:bizkit/module/task/application/controller/folder/folder_controller.dart';
import 'package:bizkit/module/task/data/service/folder/folder_service.dart';
import 'package:bizkit/module/task/domain/repository/service/folder_repo.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:get/get.dart';

class TaskCalenderViewController extends GetxController {
  RxInt taskTabChangeIndex = 1.obs;
  RxBool selectedFolderContainer = false.obs;
  RxString deadLine = ''.obs;
  RxString priority = ''.obs;
  RxString taskType = ''.obs;

  RxList selectedTasks = [].obs;

  final taskFolderController = Get.find<TaskFolderController>();

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

  void longPress(int index) {
    if (selectedIndices.contains(index)) {
      selectedIndices.remove(index);
    } else {
      selectedIndices.add(index);
    }
    selectedFolderContainer.value = selectedIndices.isNotEmpty;
  }
}
