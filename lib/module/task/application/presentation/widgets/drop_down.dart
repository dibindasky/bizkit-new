import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown(
      {super.key,
      required this.label,
      required this.value,
      required this.items,
      required this.onChanged});
  final String label;
  final String value;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16.sp,
            color: neonShade,
          ),
        ),
        adjustHieght(3.h),
        DropdownButtonFormField<String>(
          value: value,
          items: items.map((String element) {
            return DropdownMenuItem<String>(
              value: element,
              child: Text(element),
            );
          }).toList(),
          onChanged: onChanged,
          decoration: InputDecoration(
            filled: true,
            fillColor: klightDarkGrey,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
          ),
          dropdownColor: klightDarkGrey,
        ),
      ],
    );
  }
}
