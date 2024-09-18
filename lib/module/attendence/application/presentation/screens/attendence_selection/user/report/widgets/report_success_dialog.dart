import 'package:bizkit/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../../../../utils/constants/colors.dart';
import '../../../../../../../../../utils/constants/constant.dart';
import '../../../../../../../../../utils/event_button.dart';

showReportSuccessDialog({required BuildContext context}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: kblack,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        content: SizedBox(
          width: 300.w,
          height: 250.h,
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
                        'Reported Successfully',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      adjustHieght(14.h),
                      const Text(
                        "Your report  is in process with the HR Department. Please be patient as it may take some time. Thank you for your understanding.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 12,
                        ),
                      ),
                      adjustHieght(10.h),
                      EventButton(
                        color: const LinearGradient(
                          colors: [
                            Color.fromRGBO(6, 199, 172, 1),
                            Color.fromRGBO(6, 199, 172, 1),
                          ],
                        ),
                        text: 'Done',
                        onTap: () {
                          Get.offNamed(Routes.attendenceReport, id: 2);
                          Navigator.of(context).pop();
                        },
                        wdth: 300.w,
                      ),
                      adjustHieght(12.h),
                    ],
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
