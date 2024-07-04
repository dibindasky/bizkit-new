import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../../utils/constants/colors.dart';

class ReportCard extends StatelessWidget {
  final Color color;
  final Color textColor;
  final String title1;
  final String? title2;
  final IconData? icon;
  final Color? iconColor;

  const ReportCard({
    super.key,
    required this.color,
    required this.title1,
    this.title2,
    this.icon,
    this.iconColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 144,
      height: 116,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (icon != null)
            Padding(
              padding: const EdgeInsets.only(left: 14.0, bottom: 10),
              child: Icon(
                icon,
                color: iconColor,
              ),
            ),
          adjustWidth(10.h),
          Center(
            child: Text(
              title1,
              style: TextStyle(color: textColor),
            ),
          ),
          Center(
            child: Text(
              title2 ?? '',
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
