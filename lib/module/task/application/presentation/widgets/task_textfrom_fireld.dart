import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaskTextField extends StatelessWidget {
  const TaskTextField({
    Key? key,
    this.fillColor,
    this.hintText,
    this.icon,
    this.suffixIcon,
    this.maxLines,
    this.showBorder = false,
    this.textColor = klightgrey,
    this.labelText,
    this.controller,
    this.textCapitalization,
    this.onChanged,
    this.onTapOutside,
    this.validator,
    this.enabled = true,
    this.onTap,
  }) : super(key: key);

  final Color? fillColor;
  final Color? textColor;
  final String? hintText;
  final String? labelText;
  final VoidCallback? onTapOutside;
  final IconData? icon;
  final TextCapitalization? textCapitalization;
  final Widget? suffixIcon;
  final int? maxLines;
  final bool showBorder;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final void Function()? onTap;
  final String? Function(String?)? validator;
  final bool? enabled;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      showCursor: true,
      enabled: enabled,
      textCapitalization: textCapitalization ?? TextCapitalization.words,
      style: Theme.of(context).textTheme.displaySmall,
      maxLines: maxLines,
      onChanged: onChanged,
      onTap: onTap,
      onTapOutside: (event) {
        if (onTapOutside != null) {
          onTapOutside!();
        }
      },
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.displaySmall,
        labelText: labelText,
        labelStyle: TextStyle(color: textColor),
        filled: true,
        // fillColor: fillColor ?? klightDarkGrey,
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
