import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/attendence/application/controller/home/home_controller.dart';
import 'package:bizkit/module/attendence/application/controller/navabar/navabar_controller.dart';
import 'package:bizkit/module/biz_card/application/controller/card/business_details.dart';
import 'package:bizkit/module/biz_card/application/controller/card/create_controller.dart';
import 'package:bizkit/module/biz_card/application/controller/card/personal_details.dart';
import 'package:bizkit/module/biz_card/application/controller/connections/connections_controller.dart';
import 'package:bizkit/module/biz_card/application/controller/contacts/contacts_controller.dart';
import 'package:bizkit/module/biz_card/application/controller/level_sharing/level_sharing_controller.dart';
import 'package:bizkit/module/module_manager/application/controller/matcho_meter/matcho_meter_controller.dart';
import 'package:bizkit/module/biz_card/application/controller/navbar/navbar_controller.dart';
import 'package:bizkit/module/biz_card/application/controller/prompt/prompt_controller.dart';
import 'package:bizkit/module/biz_card/application/controller/reminder/reminder_controller.dart';
import 'package:bizkit/module/biz_card/application/controller/text_extraction/text_extraction_controller.dart';
import 'package:bizkit/module/biz_card/application/controller/received_card/received_card_controller.dart';
import 'package:bizkit/module/module_manager/data/local_storage/local_storage_preference.dart';
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
  void chooseModule(BuildContext context, {required Module? module}) {
    switch (module) {
      case Module.card:
        initCardControllers();
        context.go(Routes.bizCardNavbar);
        Get.find<NavbarController>().changeBottomBar(1);
        LocalStoragePreference.setLastUsedModule(getStringFromModule(module)!);
        break;
      case Module.task:
        initTaskControllers();
        context.go(Routes.taskNavbar);
        Get.find<TaskNavbarController>().changeBottomIndex(1);
        LocalStoragePreference.setLastUsedModule(getStringFromModule(module)!);
        break;
      case Module.attendance:
        initAttendanceControllers();
        context.go(Routes.attendenceNavbar);
        Get.find<AttendenceNavBarConroller>().changeBottomIndex(1);
        LocalStoragePreference.setLastUsedModule(getStringFromModule(module)!);
        break;
      default:
        context.go(Routes.moduleSelector);
    }
  }

// [--------------------------------init controlleres------------------------]

  /// initilize all controllers in CARD module [Module.card] and delte other module controllers
  void initCardControllers() {
    deleteAllControlers(Module.card);
    Get.lazyPut(() => ContactsController(),fenix : true);
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

  /// initilize all controllers in TASK module [Module.task] and delte other module controllers
  void initTaskControllers() {
    deleteAllControlers(Module.task);
    Get.lazyPut(() => TaskNavbarController());
    Get.lazyPut(() => TaskCalenderViewController());
    Get.lazyPut(() => CreateTaskController());
    Get.lazyPut(() => TaskGenerateReportController());
    Get.lazyPut(() => TaskHomeScreenController());
    Get.lazyPut(() => TaskFolderController());
    Get.lazyPut(() => ChatController());
    Get.lazyPut(() => MessageCountController());
  }

  /// initilize all controllers in ATTENDANCE module [Module.attendance] and delte other module controllers
  void initAttendanceControllers() {
    deleteAllControlers(Module.attendance);
    Get.lazyPut(() => AttendenceNavBarConroller());
    Get.lazyPut(() => AttendenceHomeConroller());
  }

// [--------------------------------delete controlleres------------------------]

  /// delete all controllers
  /// except module managers and except the [Module] passed as a optional param
  void deleteAllControlers([Module? module]) {
    // if (module == null || module != Module.task) deleteTaskControllers();
    // if (module == null || module != Module.card) deleteCardControllers();
    // if (module == null || module != Module.attendance) {
    //   deleteAttendanceControllers();
    // }
    deleteCardControllers();
    deleteAttendanceControllers();
    deleteTaskControllers();
  }

  /// delete card controllers
  void deleteCardControllers() {
    if (Get.isRegistered<ContactsController>()) {
      Get.delete<ContactsController>();
    }
    if (Get.isRegistered<MatchoMeterController>()) {
      Get.delete<MatchoMeterController>();
    }
    if (Get.isRegistered<CardController>()) Get.delete<CardController>();
    if (Get.isRegistered<NavbarController>()) Get.delete<NavbarController>();
    if (Get.isRegistered<PromtController>()) Get.delete<PromtController>();
    if (Get.isRegistered<PersonalDetailsController>()) {
      Get.delete<PersonalDetailsController>();
    }
    if (Get.isRegistered<BusinesDetailsController>()) {
      Get.delete<BusinesDetailsController>();
    }
    if (Get.isRegistered<CardTextExtractionController>()) {
      Get.delete<CardTextExtractionController>();
    }
    if (Get.isRegistered<ReceivedCardController>()) {
      Get.delete<ReceivedCardController>();
    }
    if (Get.isRegistered<LevelSharingController>()) {
      Get.delete<LevelSharingController>();
    }
    if (Get.isRegistered<ConnectionsController>()) {
      Get.delete<ConnectionsController>();
    }
    if (Get.isRegistered<ReminderController>()) {
      Get.delete<ReminderController>();
    }
  }

  /// delete task controllers
  void deleteTaskControllers() {
    if (Get.isRegistered<TaskNavbarController>()) {
      Get.delete<TaskNavbarController>();
    }
    if (Get.isRegistered<TaskCalenderViewController>()) {
      Get.delete<TaskCalenderViewController>();
    }
    if (Get.isRegistered<CreateTaskController>()) {
      Get.delete<CreateTaskController>();
    }
    if (Get.isRegistered<TaskGenerateReportController>()) {
      Get.delete<TaskGenerateReportController>();
    }
    if (Get.isRegistered<TaskHomeScreenController>()) {
      Get.delete<TaskHomeScreenController>();
    }
    if (Get.isRegistered<TaskFolderController>()) {
      Get.delete<TaskFolderController>();
    }
    if (Get.isRegistered<ChatController>()) Get.delete<ChatController>();
    if (Get.isRegistered<MessageCountController>()) {
      Get.delete<MessageCountController>();
    }
  }

  /// delete attendance controllers
  void deleteAttendanceControllers() {
    if (Get.isRegistered<AttendenceNavBarConroller>()) {
      Get.delete<AttendenceNavBarConroller>();
    }
    if (Get.isRegistered<AttendenceHomeConroller>()) {
      Get.delete<AttendenceHomeConroller>();
    }
  }
}
