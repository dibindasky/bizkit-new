import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/attendence/application/controller/home/home_controller.dart';
import 'package:bizkit/module/attendence/application/controller/navabar/navabar_controller.dart';
import 'package:bizkit/module/biz_card/application/controller/text_extraction/text_extraction_controller.dart';
import 'package:bizkit/module/task/application/controller/caleder_view/calender_view.dart';
import 'package:bizkit/module/task/application/controller/chat/chat_controller.dart';
import 'package:bizkit/module/task/application/controller/chat/message_count_controller.dart';
import 'package:bizkit/module/task/application/controller/folder/folder_controller.dart';
import 'package:bizkit/module/task/application/controller/generate_report/generate_report.dart';
import 'package:bizkit/module/task/application/controller/home_controller/home_controller.dart';
import 'package:bizkit/module/task/application/controller/navbar/navbar_controller.dart';
import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class ModuleController extends GetxController {
  void chooseModule(BuildContext context, {required Module module}) {
    switch (module) {
      case Module.card:
        initCardControllers();
        context.go(Routes.bizCardNavbar);
        break;
      case Module.task:
        initTaskControllers();
        context.go(Routes.taskNavbar);
        Get.find<TaskNavbarController>().changeBottomIndex(1);
        break;
      case Module.attendance:
        initAttendanceControllers();
        context.go(Routes.attendenceNavbar);
        Get.find<AttendenceNavBarConroller>().changeBottomIndex(1);
        break;
      default:
    }
  }

  /// initilize all controllers in CARD module [Module.card]
  void initCardControllers() {
    Get.lazyPut(() => CardTextExtractionController());
  }

  /// initilize all controllers in TASK module [Module.task]
  void initTaskControllers() {
    Get.lazyPut(() => TaskNavbarController());
    Get.lazyPut(() => TaskCalenderViewController());
    Get.lazyPut(() => CreateTaskController());
    Get.lazyPut(() => TaskGenerateReportController());
    Get.lazyPut(() => TaskHomeScreenController());
    Get.lazyPut(() => TaskFolderController());
    Get.lazyPut(() => ChatController());
    Get.lazyPut(() => MessageCountController());
  }

  /// initilize all controllers in ATTENDANCE module [Module.attendance]
  void initAttendanceControllers() {
    Get.lazyPut(() => AttendenceNavBarConroller());
    Get.lazyPut(() => AttendenceHomeConroller());
  }
}
