import 'package:bizkit/module/task/application/controller/navbar/navbar_controller.dart';
import 'package:get/get.dart';

class AllControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TaskNavbarController());
  }
}
