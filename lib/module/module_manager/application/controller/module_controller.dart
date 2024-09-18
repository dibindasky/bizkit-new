import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/attendence/application/controller/home/home_controller.dart';
import 'package:bizkit/module/attendence/application/controller/navabar/navabar_controller.dart';
import 'package:bizkit/module/biz_card/application/controller/card/business_details.dart';
import 'package:bizkit/module/biz_card/application/controller/card/create_controller.dart';
import 'package:bizkit/module/biz_card/application/controller/card/personal_details.dart';
import 'package:bizkit/module/biz_card/application/controller/connections/connections_controller.dart';
import 'package:bizkit/module/biz_card/application/controller/contacts/contacts_controller.dart';
import 'package:bizkit/module/biz_card/application/controller/level_sharing/level_sharing_controller.dart';
import 'package:bizkit/module/biz_card/application/controller/matcho_meter/matcho_meter_controller.dart';
import 'package:bizkit/module/biz_card/application/controller/navbar/navbar_controller.dart';
import 'package:bizkit/module/biz_card/application/controller/prompt/prompt_controller.dart';
import 'package:bizkit/module/biz_card/application/controller/reminder/reminder_controller.dart';
import 'package:bizkit/module/biz_card/application/controller/text_extraction/text_extraction_controller.dart';
import 'package:bizkit/module/biz_card/application/controller/received_card/received_card_controller.dart';
import 'package:bizkit/module/task/application/controller/caleder_view/calender_view.dart';
import 'package:bizkit/module/task/application/controller/chat/chat_controller.dart';
import 'package:bizkit/module/task/application/controller/chat/message_count_controller.dart';
import 'package:bizkit/module/task/application/controller/folder/folder_controller.dart';
import 'package:bizkit/module/task/application/controller/generate_report/generate_report.dart';
import 'package:bizkit/module/task/application/controller/home_controller/home_controller.dart';
import 'package:bizkit/module/task/application/controller/navbar/navbar_controller.dart';
import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class ModuleController extends GetxController {
  void chooseModule(BuildContext context, {required Module module}) {
    switch (module) {
      case Module.card:
        initCardControllers();
        context.go(Routes.bizCardNavbar);
        Get.find<NavbarController>().changeBottomBar(1);
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
    Get.lazyPut(() => ContactsController());
    Get.lazyPut(() => MatchoMeterController());
    Get.lazyPut(() => CardController(), fenix: true);
    Get.lazyPut(() => NavbarController());
    Get.lazyPut(() => PromtController());
    Get.lazyPut(() => PersonalDetailsController());
    Get.lazyPut(() => BusinesDetailsController());
    Get.lazyPut(() => CardTextExtractionController());
    Get.lazyPut(() => ReceivedCardController());
    Get.lazyPut(() => LevelSharingController());
    Get.lazyPut(() => ConnectionsController());
    Get.lazyPut(() => ReminderController());
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
