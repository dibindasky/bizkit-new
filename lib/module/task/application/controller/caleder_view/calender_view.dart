import 'package:get/get.dart';

class TaskCalenderViewController extends GetxController {
  RxInt taskBottomTabIndex = 1.obs;
  RxBool selectedFolderContainer = false.obs;

  changeBottomTab(int index) {
    taskBottomTabIndex.value = index;
  }

  folderLongPress(bool selected) {
    selectedFolderContainer.value = selected;
  }
}
