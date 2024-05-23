import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class TaskTextField extends StatelessWidget {
  const TaskTextField({
    super.key,
    this.fillColor,
    this.hintText,
    this.icon,
    this.suffixIcon,
    this.maxLines,
  });
  final Color? fillColor;
  final String? hintText;
  final IconData? icon;
  final Widget? suffixIcon;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: klightgrey),
        filled: true,
        fillColor: fillColor ?? lightGrey,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
