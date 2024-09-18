import 'dart:developer';

import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/application/presentation/widgets/radio_button.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskTypeRadioButtons extends StatelessWidget {
  const TaskTypeRadioButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CreateTaskController>();
    return Obx(() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomRadioButton(
              selected: controller.createTaskTupe.value == TaskType.official,
              text: 'Official',
              onChanged: () {
                controller.changeTaskType(TaskType.official);
              }),
          kWidth10,
          CustomRadioButton(
              selected: controller.createTaskTupe.value == TaskType.personal,
              text: 'Personal',
              onChanged: () {
                controller.changeTaskType(TaskType.personal);
              }),
          kWidth10,
          CustomRadioButton(
              selected: controller.createTaskTupe.value == TaskType.others,
              text: 'Others',
              onChanged: () {
                controller.changeTaskType(TaskType.others);
              }),
        ],
      );
    });
  }
}
