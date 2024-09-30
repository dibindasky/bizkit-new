import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../../../utils/constants/colors.dart';
import '../../../../../../../../utils/constants/constant.dart';
import '../../../../../../../../utils/widgets/event_button.dart';
import '../../../../../controller/home/home_controller.dart';

showClockInSuccessDialog({required BuildContext context}) {
  final controller = Get.find<AttendenceHomeConroller>();
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
        child: AlertDialog(
          backgroundColor: kblack,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          content: SizedBox(
            width: 300.w,
            height: 300.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                Stack(
                  children: [
                    Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          clockInSuccessDialogimg,
                          width: 90,
                          height: 90,
                          fit: BoxFit.cover,
                        ),
                        adjustHieght(13.h),
                        const Text(
                          'Attendance Successful!',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        adjustHieght(14.h),
                        const Text(
                          "Great job! Your attendance has been successfully recorded. You're all set for today.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 13,
                          ),
                        ),
                        adjustHieght(10.h),
                        EventButton(
                          text: 'Done',
                          onTap: () {
                            controller.clockinOrClockout();
                            Navigator.of(context).pop();
                          },
                          wdth: 300.w,
                        ),
                        adjustHieght(12.h),
                        EventButton(
                          text: 'Go to Task Module',
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          wdth: 300.w,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
