import 'package:bizkit/module/module_manager/application/controller/auth_controller.dart';
import 'package:bizkit/module/module_manager/application/controller/module_controller.dart';
import 'package:get/get.dart';

class AllControllerBinding implements Bindings {
  @override
  void dependencies() {
    // Module manager
    Get.lazyPut(() => AuthenticationController());
    Get.lazyPut(() => ModuleController());
  }
}
