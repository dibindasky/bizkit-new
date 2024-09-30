import 'dart:ui';

import 'package:bizkit/module/attendence/application/controller/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../utils/constants/colors.dart';
import '../../../../../../../../utils/constants/constant.dart';
import '../../../../../../../../utils/widgets/event_button.dart';

showClockOutSuccessDialog(
    {required BuildContext context,
    required AttendenceHomeConroller attendenceHomeConroller}) {
  return showDialog(
    context: context,
    builder: (context) {
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
                          'Clock out Successful!',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        adjustHieght(14.h),
                        const Text(
                          "You've successfully clocked out. Have a great day!",
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
                            attendenceHomeConroller.clockinOrClockout();
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
