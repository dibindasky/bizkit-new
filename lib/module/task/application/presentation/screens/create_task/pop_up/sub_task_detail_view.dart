import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubTaskDetailView extends StatelessWidget {
  const SubTaskDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(20.w),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Text(
            'Client Meeting',
            style: TextStyle(fontSize: 17.sp, color: neonShade),
          ),
          const Divider(color: kblack, indent: 0),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'Deadline : 22:10:24',
              style: TextStyle(fontSize: 10.sp, color: kwhite),
            ),
          ),
          adjustHieght(10.h),
          Text(
            'Sub task detail description, describe about the sub task to understand what exatly the task is Sub task detail description, describe about the sub task to understand what exatly the task is.Sub task detail description, describe about the sub task to understand what exatly the task is',
            style: TextStyle(fontSize: 14.sp, color: klightgrey),
          ),
          adjustHieght(10.h),
        ]),
      ),
    );
  }
}
