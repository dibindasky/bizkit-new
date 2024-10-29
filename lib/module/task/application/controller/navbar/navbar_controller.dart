import 'package:get/get.dart';

class TaskNavbarController extends GetxController {
  RxInt taskBottomIndex = 1.obs;

  changeBottomIndex(int index) {
    taskBottomIndex.value = index;
    update();
  }
}
