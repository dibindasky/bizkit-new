import 'package:bizkit/module/biz_card/application/controller/card/create_controller.dart';
import 'package:get/get.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CardController>(CardController(), permanent: true);
  }
}
