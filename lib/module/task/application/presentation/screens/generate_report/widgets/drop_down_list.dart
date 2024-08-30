import 'package:bizkit/module/task/application/controller/generate_report/generate_report.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class GenerateReportDropDownButton extends StatelessWidget {
  GenerateReportDropDownButton({super.key});

  final controller = Get.find<TaskGenerateReportController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select the Tasks From',
          style: TextStyle(fontSize: 16.sp),
        ),
        const Text(
          'Select the Assignee/ creator which tasks you want to get report of',
          style: TextStyle(color: klightgrey),
        ),
        Obx(
          () => DropdownButtonFormField<String>(
            hint: const Text('Select', style: TextStyle(color: klightgrey)),
            value: controller.genareteDropDownData.value,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: kBorderRadius10,
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: lightGrey,
            ),
            items: controller.taskFromOptions.toSet().map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value, style: textThinStyle1),
              );
            }).toList(),
            onChanged: (newValue) {
              controller.changeGenareteDropDownData(newValue ?? '');
            },
            dropdownColor: backgroundColour,
            iconEnabledColor: neonShade,
          ),
        ),
      ],
    );
  }
}
