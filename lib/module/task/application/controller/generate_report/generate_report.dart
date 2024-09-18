import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class TaskGenerateReportController extends GetxController {
  RxList<String> taskFromOptions =
      <String>['Option 1', 'Option 2', 'Option 3'].obs;
  RxString genareteDropDownData = 'Option 1'.obs;
  PickerDateRange? selectedRange;
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
    // log('FromDate => ${fromDate.text}');
    update();
  }

  void changeToDate(String selecteDate) {
    toDate.text = selecteDate;
    // log('ToDate => ${toDate.text}');
    update();
  }
}
