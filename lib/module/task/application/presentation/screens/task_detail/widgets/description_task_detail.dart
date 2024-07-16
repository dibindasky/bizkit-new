import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TaskDetailDescriptionSection extends StatelessWidget {
  const TaskDetailDescriptionSection({super.key});

  @override
  Widget build(BuildContext context) {
    final taskController = Get.find<CreateTaskController>();
    return Container(
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: kGrayLight,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Description', style: textHeadStyle1),
          adjustHieght(5.h),
          Text(
            taskController.singleTask.value.description ?? 'Description',
            style: textStyle1,
          ),
        ],
      ),
    );
  }
}
