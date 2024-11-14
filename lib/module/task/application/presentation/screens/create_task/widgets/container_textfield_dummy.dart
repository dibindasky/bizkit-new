import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContainerTextFieldDummy extends StatelessWidget {
  const ContainerTextFieldDummy(
      {super.key, required this.text, this.suffixIcon, this.onTap});

  final String text;
  final IconData? suffixIcon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(left: 10.w, right: 12.w),
        height: 40.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: klightDarkGrey,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                    fontSize: 14.sp,
                    color: text == 'Choose Deadline' ? klightgrey : kwhite),
              ),
            ),
            suffixIcon != null
                ? Icon(
                    suffixIcon!,
                    color: neonShade,
                  )
                : kempty,
          ],
        ),
      ),
    );
  }
}
