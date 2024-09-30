// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../utils/constants/colors.dart';
import '../../../../../../../utils/constants/constant.dart';

class AttendenceActivityContainerWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final IconData icon;
  final String trailingTime;
  final String trailingStatus;
  final double width;
  final double height;
  var color;

  AttendenceActivityContainerWidget({
    super.key,
    required this.title,
    required this.subTitle,
    required this.icon,
    required this.trailingTime,
    required this.trailingStatus,
    required this.color,
    this.height = 78,
    this.width = 200,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.w,
      height: height.h,
      decoration: BoxDecoration(
        color: color,
        borderRadius: kBorderRadius20,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: const Color(0xFFFEC8C3),
                  child: Icon(
                    icon,
                    color: const Color(0xFFFC4C3C),
                  ),
                ),
                adjustWidth(10.w),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: textThinStyle1.copyWith(
                        fontSize: 15.sp,
                      ),
                    ),
                    Text(
                      subTitle,
                      style: textThinStyle1.copyWith(
                          color: kgrey, fontSize: 12.sp),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  trailingTime,
                  style: textThinStyle1.copyWith(
                    fontSize: 15.sp,
                  ),
                ),
                Text(
                  trailingStatus,
                  style: textThinStyle1.copyWith(color: kgrey, fontSize: 12.sp),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
