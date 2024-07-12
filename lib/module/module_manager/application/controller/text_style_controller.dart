import 'package:get/get.dart';

enum TextStyleEnum { euclid, poppins }

class TextStyleController extends GetxController {
  Rx<String> textStyle = 'Euclid'.obs;

  void changeStyle(TextStyleEnum style) {
    switch (style) {
      case TextStyleEnum.euclid:
        textStyle.value = 'Euclid';
        break;
      case TextStyleEnum.poppins:
        textStyle.value = 'Poppins';
        break;
      default:
        textStyle.value = 'Eculid';
    }
  }

  getTextStyle() {}
}
