import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskGenerateReportController extends GetxController {
  RxList<String> taskFromOptions =
      <String>['Option 1', 'Option 2', 'Option 3'].obs;
  RxString genareteDropDownData = 'Option 1'.obs;
  final TextEditingController genaretesDate = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    if (taskFromOptions.isNotEmpty) {
      genareteDropDownData.value = taskFromOptions[0];
    }
  }

  void changeGenareteDropDownData(String selectedDropDownData) {
    genareteDropDownData.value = selectedDropDownData;
  }

  void changeGenareteDate(String selecteDate) {
    genaretesDate.text = selecteDate;
    update();
  }
}
