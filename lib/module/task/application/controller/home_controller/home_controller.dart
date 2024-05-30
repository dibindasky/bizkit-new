import 'dart:developer';

import 'package:get/get.dart';

class TaskHomeScreenController extends GetxController {
  RxString taskCategory = ''.obs;
  changeSelectedTaskCategory(String selectedTaskCategory) {
    taskCategory.value = selectedTaskCategory;
    log('cont');
    update();
  }
}
