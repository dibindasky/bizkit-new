import 'package:get/get.dart';

class NavbarController extends GetxController {
  RxInt slectedtabIndex = 0.obs;
  void changeBottomBar(int index) {
    slectedtabIndex.value = index;
  }
}
