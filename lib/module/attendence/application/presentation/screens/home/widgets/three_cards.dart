import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class AttendenceHSThreeCard extends StatelessWidget {
  final double width;
  final double height;
  final String imageUrl;
  void Function()? onTap;
  AttendenceHSThreeCard(
      {super.key,
      required this.width,
      required this.height,
      required this.imageUrl,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width.w,
        height: height.h,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imageUrl),
            fit: BoxFit.cover,
            filterQuality: FilterQuality.high,
          ),
        ),
      ),
    );
  }
}
