import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContainerTextFieldDummy extends StatelessWidget {
  const ContainerTextFieldDummy(
      {super.key,
      required this.text,
      this.suffixIcon,
      this.onTap,
      this.borderColor});

  final String text;
  final IconData? suffixIcon;
  final VoidCallback? onTap;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 0,
        child: Container(
          padding: EdgeInsets.only(left: 10.w, right: 12.w),
          height: 40.h,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border:
                  borderColor == null ? null : Border.all(color: borderColor!)),
          child: Row(
            children: [
              Expanded(
                child: Text(text,
                    // style: TextStyle(
                    //     fontSize: 14.sp,
                    //     color: text == 'Choose Deadline' ? klightgrey : kwhite),

                    style:
                        Theme.of(context).textTheme.displaySmall?.copyWith()),
              ),
              suffixIcon != null
                  ? Icon(
                      suffixIcon!,
                      color: kneon,
                    )
                  : kempty,
            ],
          ),
        ),
      ),
    );
  }
}
