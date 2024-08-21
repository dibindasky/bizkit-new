import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecentTaskContainer extends StatelessWidget {
  const RecentTaskContainer({
    super.key,
    required this.taskTitle,
    required this.taskDeadline,
  });

  final String taskTitle;
  final String taskDeadline;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: Container(
        width: 130.w,
        height: 40.h,
        decoration: BoxDecoration(
          borderRadius: kBorderRadius10,
          color: lightGrey,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              taskTitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: textThinStyle1.copyWith(
                color: neonShade,
                fontSize: 14,
              ),
            ),
            Text(
              taskDeadline,
              style: textThinStyle1.copyWith(fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }
}
