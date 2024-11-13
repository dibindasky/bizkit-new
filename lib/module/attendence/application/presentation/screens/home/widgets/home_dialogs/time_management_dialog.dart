import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../utils/constants/colors.dart';
import '../../../../../../../../utils/constants/constant.dart';
import '../../../../../../../../utils/widgets/event_button.dart';
import 'clockin_success_dialog.dart';

showTimeMangementDialog({required BuildContext context}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: kblack,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        content: SingleChildScrollView(
          child: SizedBox(
            width: 300.w,
            height: 370.h,
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
                          clockInTimeManagementDialogimg,
                          width: 200,
                          height: 210,
                          fit: BoxFit.cover,
                        ),
                        adjustHieght(10.h),
                        const Text(
                          'You are late by 20mins. Deductions may be  applicable.',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 13,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        adjustHieght(12.h),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 290.w,
                            height: 40.h,
                            decoration: BoxDecoration(
                              color: lightColr,
                              borderRadius: kBorderRadius5,
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'State your reason here',
                                  hintStyle: TextStyle(fontSize: 15),
                                  border: InputBorder.none,
                                ),
                                autofocus: false,
                              ),
                            ),
                          ),
                        ),
                        adjustHieght(14.h),
                        EventButton(
                          text: 'Check In',
                          onTap: () {
                            Navigator.of(context).pop();
                            showClockInSuccessDialog(context: context);
                          },
                          color: const LinearGradient(
                            colors: [
                              neonShade,
                              neonShade,
                            ],
                          ),
                          width: 300.w,
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                    Positioned(
                      // left: 20,
                      top: -5,
                      right: 4,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: const Icon(Icons.close),
                      ),
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
