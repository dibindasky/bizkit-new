import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskGenerateReportController extends GetxController {
  RxList<String> taskFromOptions =
      <String>['Option 1', 'Option 2', 'Option 3'].obs;
  RxString genareteDropDownData = 'Option 1'.obs;

  final TextEditingController fromDate = TextEditingController();
  final TextEditingController toDate = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    if (taskFromOptions.isNotEmpty) {
      genareteDropDownData.value = taskFromOptions[0];
    }
    if (names.isNotEmpty) {}
  }

  void changeGenareteDropDownData(String selectedDropDownData) {
    genareteDropDownData.value = selectedDropDownData;
  }

  void changeFromDate(String selecteDate) {
    fromDate.text = selecteDate;
    update();
  }

  void changeToDate(String selecteDate) {
    toDate.text = selecteDate;
    update();
  }
}
