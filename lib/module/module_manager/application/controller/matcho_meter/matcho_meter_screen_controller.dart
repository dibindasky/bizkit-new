import 'package:get/get.dart';

class MatchoMeterScreenController extends GetxController {
  RxInt currentIndex = 0.obs;

  RxList<String> items = [
    'Select your dream Job',
    'Select your dream Destination',
    'Your favourite song',
  ].obs;

  RxString selectedOne = ''.obs;
  RxString selectedTwo = ''.obs;
  RxString selectedThree = ''.obs;

  @override
  void onInit() {
    super.onInit();

    selectedOne.value = items[0];
    selectedTwo.value = items[1];
    selectedThree.value = items[2];
  }
}
