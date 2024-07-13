import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaskTextField extends StatelessWidget {
  const TaskTextField(
      {super.key,
      this.fillColor,
      this.hintText,
      this.icon,
      this.suffixIcon,
      this.maxLines,
      this.showBorder = false,
      this.textColor = klightgrey,
      this.labelText,
      this.controller,
      this.onChanged});
  final Color? fillColor;
  final Color? textColor;
  final String? hintText;
  final String? labelText;

  final IconData? icon;
  final Widget? suffixIcon;
  final int? maxLines;
  final bool showBorder;
  final controller;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: textStyle1.copyWith(color: textColor),
      maxLines: maxLines,
      onChanged: onChanged,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
        hintText: hintText,
        hintStyle: TextStyle(color: textColor),
        labelText: labelText,
        labelStyle: TextStyle(color: textColor),
        filled: true,
        fillColor: fillColor ?? lightGrey,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:
              showBorder ? const BorderSide(color: neonShade) : BorderSide.none,
        ),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
