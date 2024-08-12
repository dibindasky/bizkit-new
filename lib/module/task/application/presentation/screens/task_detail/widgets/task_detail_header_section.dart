// import 'dart:developer';

import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/application/presentation/screens/task_detail/widgets/task_status_dialoge.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/shimmier/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class TaskDetailHeaderSection extends StatelessWidget {
  const TaskDetailHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    final taskController = Get.find<CreateTaskController>();

    // Calculate the total time taken
    Duration? totalTimeTaken;
    if (taskController.singleTask.value.deadLine != null &&
        taskController.singleTask.value.createdAt != null) {
      DateTime createdAt =
          DateTime.parse(taskController.singleTask.value.createdAt.toString());
      DateTime deadLine =
          DateTime.parse(taskController.singleTask.value.deadLine!);
      totalTimeTaken = deadLine.difference(createdAt);
    }

    String formattedTimeTaken = totalTimeTaken != null
        ? '${totalTimeTaken.inHours}Hr ${(totalTimeTaken.inMinutes % 60)}Min'
        : 'Time Not Available';

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () => taskController.isLoading.value
                  ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: ShimmerLoaderTile(
                        height: 15.h,
                        width: 150.w,
                      ),
                    )
                  : Text(
                      taskController.singleTask.value.title ?? 'Title',
                      style: textHeadStyle1.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                          color: neonShade),
                    ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Total Time Taken: $formattedTimeTaken',
              style: textStyle1,
            ),
          ],
        ),
        Row(
          children: [
            CircleAvatar(
              backgroundColor: kGrayLight,
              child: IconButton(
                icon:
                    const Icon(Icons.mode_edit_outline_outlined, color: kwhite),
                onPressed: () {
                  showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (context) => TaskStatusChangeDialog(
                      taskId: taskController.singleTask.value.id,
                    ),
                  );
                },
              ),
            ),
            adjustWidth(10.w),
            CircleAvatar(
              backgroundColor: kGrayLight,
              child: IconButton(
                icon: const Icon(Icons.message_outlined, color: kwhite),
                onPressed: () {
                  GoRouter.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
