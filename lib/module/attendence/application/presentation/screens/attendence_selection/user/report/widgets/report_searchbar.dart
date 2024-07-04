import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AttendenceReportSearchbar extends StatelessWidget {
  const AttendenceReportSearchbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 310.w,
        height: 42.h,
        decoration: BoxDecoration(
          borderRadius: kBorderRadius10,
          color: kwhite,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            adjustWidth(10.w),
            const Icon(
              Icons.search,
              color: kblack,
              size: 30,
            ),
            adjustWidth(10.h),
            const Text(
              'Search your reports',
              style: TextStyle(color: kgrey),
            )
          ],
        ),
      ),
    );
  }
}
