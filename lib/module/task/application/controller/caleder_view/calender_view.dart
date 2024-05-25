import 'package:get/get.dart';

class TaskCalenderViewController extends GetxController {
  RxInt taskBottomTabIndex = 0.obs;

  changeBottomTab(int index) {
    taskBottomTabIndex.value = index;
  }
}
