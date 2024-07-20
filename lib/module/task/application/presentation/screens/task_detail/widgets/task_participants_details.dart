import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TaskDetailUserInfoSection extends StatelessWidget {
  const TaskDetailUserInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    final taskController = Get.find<CreateTaskController>();

    return Obx(() {
      final task = taskController.singleTask.value;

      String formatDeadline(String? deadline) {
        if (deadline == null) return 'N/A';
        final DateTime? date = DateTime.tryParse(deadline);
        if (date == null) return 'N/A';
        return DateFormat('MMM d').format(date);
      }

      // Join participants names
      String participants =
          task.assignedTo != null && task.assignedTo!.isNotEmpty
              ? task.assignedTo!.map((e) => e.name).join(', ')
              : 'None';

      return Container(
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          color: kGrayLight,
          borderRadius: kBorderRadius10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: neonShade,
                  child: Padding(
                      padding: EdgeInsets.all(1.w),
                      child: CircleAvatar(
                        radius: 20.w,
                        backgroundImage: const AssetImage(imageDummyAsset),
                      )),
                ),
                adjustWidth(7.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Assigned By',
                      style: textThinStyle1,
                    ),
                    Text(
                      'Unknown',
                      style: textHeadStyle1,
                    ),
                  ],
                ),
                const Spacer(),
                CircleAvatar(
                  backgroundColor: neonShade,
                  child: Padding(
                    padding: EdgeInsets.all(1.w),
                    child: const CircleAvatar(
                        backgroundColor: kgrey,
                        child: Icon(Icons.calendar_month, color: kwhite)),
                  ),
                ),
                adjustWidth(10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Deadline',
                      style: textThinStyle1,
                    ),
                    Text(
                      formatDeadline(task.deadLine),
                      style: textHeadStyle1,
                    ),
                  ],
                ),
              ],
            ),
            adjustHieght(10.h),
            Row(
              children: [
                CircleAvatar(
                  child: Padding(
                    padding: EdgeInsets.all(1.w),
                    child: const CircleAvatar(
                        backgroundColor: kgrey,
                        child: Icon(
                          Icons.person,
                          color: neonShade,
                        )),
                  ),
                ),
                adjustWidth(10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Participants',
                      style: textThinStyle1,
                    ),
                    Text(
                      participants,
                      // '',
                      style: textStyle1,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      );
    });
  }
}
