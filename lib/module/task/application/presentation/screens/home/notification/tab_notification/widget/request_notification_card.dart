import 'package:bizkit/module/task/application/presentation/screens/home/notification/tab_notification/widget/request_dicline_dailog.dart';
import 'package:bizkit/module/task/application/presentation/screens/home/notification/tab_notification/widget/request_mark_dailog.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class NotificationRequestCard extends StatelessWidget {
  const NotificationRequestCard(
      {super.key,
      this.title,
      this.priorityLevel,
      this.deadline,
      this.taskId,
      this.acceptanceStatus,
      this.taskType,
      this.isAccepted});
  final String? title;
  final String? priorityLevel;
  final String? deadline;
  final String? isAccepted;
  final String? taskId;
  final String? acceptanceStatus;
  final String? taskType;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(13.0.w),
      decoration: BoxDecoration(
        color: kNotificationColor,
        borderRadius: BorderRadius.circular(10.0.h),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title ?? 'title',
                  style: TextStyle(
                    color: kwhite,
                    fontSize: 14.0.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                adjustHieght(4.h),
                Text(
                  priorityLevel ?? 'priorityLevel',
                  style: TextStyle(
                    color: klightgrey,
                    fontSize: 12.0.sp,
                  ),
                ),
                adjustHieght(8.h),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: const AssetImage(
                        dummyPersonImage,
                      ),
                      radius: 10.0.w,
                    ),
                    adjustWidth(8.w),
                    Text(
                      'Will Jacks',
                      style: TextStyle(
                        color: neonShade,
                        fontSize: 12.0.sp,
                      ),
                    ),
                    adjustWidth(16.w),
                    Icon(
                      Icons.calendar_today,
                      color: neonShade,
                      size: 12.0.w,
                    ),
                    adjustWidth(4.w),
                    Text(
                      deadline ?? '12 My',
                      style: TextStyle(
                        color: neonShade,
                        fontSize: 12.0.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          CircleAvatar(
            radius: 17.w,
            backgroundColor: neonShade,
            child: IconButton(
              icon: const Icon(
                Icons.check,
                color: kblack,
              ),
              color: neonShade,
              onPressed: () {
                requestMarkingDailog(
                  isAccepted: isAccepted,
                  context,
                  taskId: taskId,
                );
              },
            ),
          ),
          adjustWidth(10.w),
          CircleAvatar(
            radius: 17.w,
            backgroundColor: kred,
            child: IconButton(
              icon: const Icon(Icons.cancel),
              color: Colors.redAccent,
              onPressed: () {
                requestDiclineShowDailog(
                  context,
                  taskId: taskId,
                  isAccepted: isAccepted,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
