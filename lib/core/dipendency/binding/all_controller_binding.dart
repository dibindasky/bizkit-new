import 'package:bizkit/module/task/application/controller/caleder_view/calender_view.dart';
import 'package:bizkit/module/task/application/controller/navbar/navbar_controller.dart';
import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:get/get.dart';

class AllControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TaskNavbarController());
    Get.lazyPut(() => CreateTaskController());
    Get.lazyPut(() => TaskCalenderViewController());
  }
}
