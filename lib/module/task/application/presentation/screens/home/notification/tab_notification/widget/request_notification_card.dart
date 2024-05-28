import 'package:bizkit/module/task/application/presentation/screens/home/notification/tab_notification/widget/request_mark_dailog.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class NotificationRequestCard extends StatelessWidget {
  const NotificationRequestCard({super.key});

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
                  'Landing Page Agency Creative',
                  style: TextStyle(
                    color: kwhite,
                    fontSize: 14.0.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                adjustHieght(4.h),
                Text(
                  'Inline Preview',
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
                      '12 May',
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
                requestMarkingDailog(context);
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
                requestDiclineShowDailog(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> requestDiclineShowDailog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        backgroundColor: kNotificationColor,
        title: const Text(
          'Are you sure do you want to Dicline this task',
          style: TextStyle(),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text(
              'No',
              style: TextStyle(),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Yes',
              style: TextStyle(),
            ),
          ),
        ],
      ),
    );
  }
}
