import 'package:bizkit/module/attendence/application/presentation/screens/home/widgets/home_dialogs/outside_or_office_dialog.dart';
import 'package:bizkit/utils/widgets/event_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../utils/constants/colors.dart';
import '../../../../../../../../utils/constants/constant.dart';

showTrunOnLocationDialog({required BuildContext context}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: kblack,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        content: SizedBox(
          width: 300.w,
          height: 250.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        clockInLocationDialogimg, // Update with your image path
                        width: 180,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                      adjustHieght(10.h),
                      const Text(
                        'Enable Location for Seamless Attendance',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      adjustHieght(10.h),
                      EventButton(
                        text: 'Trun on location',
                        onTap: () {
                          Navigator.of(context).pop();
                          showOutSideOrOfficeDialog(context: context);
                        },
                        color: const LinearGradient(
                          colors: [
                            neonShade,
                            neonShade,
                          ],
                        ),
                        wdth: 300.w,
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                  Positioned(
                    top: 10,
                    right: 5,
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
      );
    },
  );
}
