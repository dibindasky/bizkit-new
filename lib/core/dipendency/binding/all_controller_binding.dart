import 'package:bizkit/module/attendence/application/controller/home/home_controller.dart';
import 'package:bizkit/module/attendence/application/controller/navabar/navabar_controller.dart';
import 'package:bizkit/module/task/application/controller/caleder_view/calender_view.dart';
import 'package:bizkit/module/task/application/controller/generate_report/generate_report.dart';
import 'package:bizkit/module/task/application/controller/home_controller/home_controller.dart';
import 'package:bizkit/module/task/application/controller/navbar/navbar_controller.dart';
import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:get/get.dart';

class AllControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TaskNavbarController());
    Get.lazyPut(() => CreateTaskController());
    Get.lazyPut(() => TaskCalenderViewController());
    Get.lazyPut(() => TaskGenerateReportController());
    Get.lazyPut(() => TaskHomeScreenController());

    // Attendence module
    Get.lazyPut(() => AttendenceNavBarConroller());
    Get.lazyPut(() => AttendenceHomeConroller());
  }
}
