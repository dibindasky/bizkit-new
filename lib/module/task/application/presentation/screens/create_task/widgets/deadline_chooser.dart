import 'dart:developer';

import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/application/presentation/screens/create_task/widgets/container_textfield_dummy.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/bottom_sheets/date_bottom_sheet.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DeadlineChooserCreateTask extends StatelessWidget {
  const DeadlineChooserCreateTask(
      {super.key,
      required this.onPressed,
      this.showTitle = true,
      this.deadlineFromEdit = false});

  final Function(String) onPressed;
  final bool showTitle;
  final bool? deadlineFromEdit;
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CreateTaskController>();
    final dateController = TextEditingController();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        showTitle ? adjustHieght(10.h) : kempty,
        showTitle
            ? Text('Deadline',
                style: TextStyle(
                  fontSize: 15.sp,
                  color: neonShade,
                ))
            : kempty,
        showTitle ? adjustHieght(3.h) : kempty,
        InkWell(
          onTap: () => showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (BuildContext context) {
              log('date : ${controller.singleTask.value.deadLine}');
              final date = controller.singleTask.value.deadLine == ''
                  ? []
                  : controller.singleTask.value.deadLine?.split('-') ?? [];
              return DatePickingBottomSheet(
                year: 1,
                last: 500,
                initialDate: date.isNotEmpty
                    ? DateTime(
                        int.parse(date.first),
                        int.parse(date[1]),
                        int.parse(date.last),
                      )
                    : null,
                onPressed: onPressed,
                datePicker: dateController,
              );
            },
          ),
          child: Obx(
            () => ContainerTextFieldDummy(
              text: deadlineFromEdit == false
                  ? controller.deadlineDateForTaskCreation.value.isEmpty
                      ? 'Choose Deadline'
                      : controller.deadlineDateForTaskCreation.value
                  : controller.singleTask.value.deadLine == ''
                      ? 'Choose Deadline'
                      : controller.singleTask.value.deadLine ?? '',
              suffixIcon: Icons.calendar_month,
            ),
          ),
        ),
      ],
    );
  }
}
