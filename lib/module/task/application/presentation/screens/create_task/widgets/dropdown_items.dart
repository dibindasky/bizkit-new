import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/application/presentation/widgets/drop_down.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DropDownItems extends StatelessWidget {
  const DropDownItems({super.key});

  @override
  Widget build(BuildContext context) {
    String priority = 'Medium';
    String recurring = 'No';
    final controller = Get.find<CreateTaskController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomDropDown(
            label: 'Priority level',
            value: priority,
            items: const <String>['Low', 'Medium', 'High'],
            onChanged: (newValue) {}),
        adjustHieght(20.h),
        CustomDropDown(
            label: 'Recurring',
            value: recurring,
            items: const <String>['No', 'Yes'],
            onChanged: (newValue) {}),
      ],
    );
  }
}
