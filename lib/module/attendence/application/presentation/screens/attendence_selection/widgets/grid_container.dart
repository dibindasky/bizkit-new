import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../utils/constants/colors.dart';
import '../../../../../../../utils/constants/contants.dart';

class AttendenceGridContainer extends StatelessWidget {
  final imageUrl;
  final String title;
  final void Function() onTap;
  const AttendenceGridContainer(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100.w,
        height: 95.h,
        decoration: BoxDecoration(
          color: klightGreyClr,
          border: Border.all(color: neonShade),
          borderRadius: kBorderRadius15,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imageUrl,
              width: 47.w,
              height: 50.h,
            ),
            adjustHieght(1.h),
            Text(
              title,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: textThinStyle1.copyWith(color: kwhite),
            )
          ],
        ),
      ),
    );
  }
}
