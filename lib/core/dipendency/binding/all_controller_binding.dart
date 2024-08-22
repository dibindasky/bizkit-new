import 'package:bizkit/module/module_manager/application/controller/auth_controller.dart';
import 'package:bizkit/module/module_manager/application/controller/module_controller.dart';
import 'package:get/get.dart';

class AllControllerBinding implements Bindings {
  @override
  void dependencies() {
    // Module manager
    Get.lazyPut(() => AuthenticationController());
    Get.lazyPut(() => ModuleController());

    // // Task Module
    // Get.lazyPut(() => TaskNavbarController());
    // Get.lazyPut(() => TaskCalenderViewController());
    // Get.lazyPut(() => CreateTaskController());
    // Get.lazyPut(() => TaskGenerateReportController());
    // Get.lazyPut(() => TaskHomeScreenController());
    // Get.lazyPut(() => TaskFolderController());
    // Get.lazyPut(() => ChatController());
    // Get.lazyPut(() => MessageCountController());

    // // Attendence module
    // Get.lazyPut(() => AttendenceNavBarConroller());
    // Get.lazyPut(() => AttendenceHomeConroller());
  }
}
