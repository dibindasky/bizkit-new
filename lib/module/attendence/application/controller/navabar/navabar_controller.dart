import 'package:get/get.dart';

class AttendenceNavBarConroller extends GetxController {
  RxInt taskBottomIndex = 1.obs;

  changeBottomIndex(int index) {
    taskBottomIndex.value = index;
  }
}
