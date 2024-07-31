import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubTaskDetailView extends StatelessWidget {
  const SubTaskDetailView({
    super.key,
    this.index,
    this.subTaskDes,
    this.subTaskTitle,
  });

  final String? subTaskTitle;

  final String? subTaskDes;
  final int? index;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(20.w),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Text(
            subTaskTitle ?? 'SubTask Title',
            style: TextStyle(fontSize: 17.sp, color: neonShade),
          ),
          const Divider(color: kblack, indent: 0),
          // Align(
          //   alignment: Alignment.centerRight,
          //   child: Text(
          //     subTaskDeadline ?? 'subTask Deadline',
          //     style: TextStyle(fontSize: 10.sp, color: kwhite),
          //   ),
          // ),
          adjustHieght(10.h),
          Text(
            subTaskDes ?? 'Subtask des',
            style: TextStyle(fontSize: 14.sp, color: klightgrey),
          ),
          adjustHieght(10.h),
        ]),
      ),
    );
  }
}
