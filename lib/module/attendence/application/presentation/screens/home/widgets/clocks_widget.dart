import 'package:animate_do/animate_do.dart';
import 'package:bizkit/module/attendence/application/controller/home/home_controller.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClocksContainerWidget extends StatelessWidget {
  final String imageUrl;
  final String text1;
  final String text2;
  final bool decoration;
  final AttendenceHomeConroller attendenceHomeConroller;
  const ClocksContainerWidget(
      {super.key,
      required this.imageUrl,
      required this.text1,
      required this.text2,
      this.decoration = false,
      required this.attendenceHomeConroller});

  @override
  Widget build(BuildContext context) {
    if (attendenceHomeConroller.clockIn.value) {
      return decoration
          ? Container(
              width: 100.w,
              height: 90.h,
              decoration: decoration
                  ? BoxDecoration(
                      color: lightGrey,
                      borderRadius: kBorderRadius5,
                      border: Border.all(
                        color: neonShade,
                      ),
                    )
                  : const BoxDecoration(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    imageUrl,
                    width: 40,
                    height: 40,
                  ),
                  adjustHieght(8.h),
                  Text(
                    text1,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    text2,
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w200),
                  ),
                  adjustHieght(4.h),
                ],
              ),
            )
          : FadeIn(
              child: Container(
                width: 100.w,
                height: 90.h,
                decoration: decoration
                    ? BoxDecoration(
                        color: lightGrey,
                        borderRadius: kBorderRadius5,
                        border: Border.all(
                          color: neonShade,
                        ),
                      )
                    : const BoxDecoration(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      imageUrl,
                      width: 40,
                      height: 40,
                    ),
                    adjustHieght(8.h),
                    Text(
                      text1,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      text2,
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w200),
                    ),
                    adjustHieght(4.h),
                  ],
                ),
              ),
            );
    } else {
      return FadeIn(
        child: Container(
          width: 100.w,
          height: 90.h,
          decoration: decoration
              ? BoxDecoration(
                  color: lightGrey,
                  borderRadius: kBorderRadius5,
                  border: Border.all(
                    color: neonShade,
                  ),
                )
              : const BoxDecoration(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imageUrl,
                width: 40,
                height: 40,
              ),
              adjustHieght(8.h),
              Text(
                text1,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Text(
                text2,
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.w200),
              ),
              adjustHieght(4.h),
            ],
          ),
        ),
      );
    }
  }
}
