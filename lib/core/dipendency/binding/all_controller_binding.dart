import 'package:bizkit/module/attendence/application/controller/home/home_controller.dart';
import 'package:bizkit/module/attendence/application/controller/navabar/navabar_controller.dart';
import 'package:bizkit/module/module_manager/application/controller/auth_controller.dart';
import 'package:bizkit/module/task/application/controller/caleder_view/calender_view.dart';
import 'package:bizkit/module/task/application/controller/chat/chat_controller.dart';
import 'package:bizkit/module/task/application/controller/chat/message_count_controller.dart';
import 'package:bizkit/module/task/application/controller/folder/folder_controller.dart';
import 'package:bizkit/module/task/application/controller/generate_report/generate_report.dart';
import 'package:bizkit/module/task/application/controller/home_controller/home_controller.dart';
import 'package:bizkit/module/task/application/controller/navbar/navbar_controller.dart';
import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:get/get.dart';

class AllControllerBinding implements Bindings {
  @override
  void dependencies() {
    // Module manager
    Get.lazyPut(() => AuthenticationController());

    // Task Module
    Get.lazyPut(() => TaskNavbarController());
    Get.lazyPut(() => TaskCalenderViewController());
    Get.lazyPut(() => CreateTaskController());
    Get.lazyPut(() => TaskGenerateReportController());
    Get.lazyPut(() => TaskHomeScreenController());
    Get.lazyPut(() => TaskFolderController());
    Get.lazyPut(() => ChatController());
    Get.lazyPut(() => MessageCountController());

    // Attendence module
    Get.lazyPut(() => AttendenceNavBarConroller());
    Get.lazyPut(() => AttendenceHomeConroller());
  }
}
