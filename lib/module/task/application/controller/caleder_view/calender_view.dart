import 'package:bizkit/utils/constants/contants.dart';
import 'package:get/get.dart';

class TaskCalenderViewController extends GetxController {
  RxInt taskTabChangeIndex = 1.obs;
  RxBool selectedFolderContainer = false.obs;
  RxString deadLine = ''.obs;
  RxString priority = ''.obs;
  RxString taskType = ''.obs;

  @override
  void onInit() {
    super.onInit();
    if (names.isNotEmpty) {
      deadLine.value = names[0];
      priority.value = names[1];
      taskType.value = names[2];
    }
  }

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
}
