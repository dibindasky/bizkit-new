import 'package:bizkit/module/attendence/application/controller/navabar/navabar_controller.dart';
import 'package:get/get.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AttendenceNavBarConroller>(() => AttendenceNavBarConroller());
  }
}
