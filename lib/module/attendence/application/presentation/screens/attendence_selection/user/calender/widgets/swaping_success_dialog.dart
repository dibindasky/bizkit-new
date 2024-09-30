import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../../../../utils/constants/colors.dart';
import '../../../../../../../../../utils/constants/constant.dart';
import '../../../../../../../../../utils/widgets/event_button.dart';

showSwapLeaveDialog({required BuildContext context}) {
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
            height: 250.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: const Icon(
                          Icons.close,
                          color: neonShade,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
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
                          'Swap Leaves?',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                        adjustHieght(14.h),
                        Text(
                          "Do you want to swap with adam for the leaves? note that swap will only approves if other employee accepts",
                          textAlign: TextAlign.center,
                          style: textThinStyle1.copyWith(fontSize: 12),
                        ),
                        adjustHieght(10.h),
                        EventButton(
                          color: neonShadeLinearGradient,
                          text: 'Swap Leave',
                          onTap: () {
                            Navigator.of(context).pop();
                            Get.back(id: 22);
                            showSwapLeaveSuccessDialog(context: context);
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
        ),
      );
    },
  );
}

showSwapLeaveSuccessDialog({required BuildContext context}) {
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
            height: 280.h,
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
                          'Swap Schedule Applied Successfully',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                        adjustHieght(14.h),
                        const Text(
                          "Your leave request is in progress with HR and awaits your friend's approval. Please be patient. Thanks!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 12,
                          ),
                        ),
                        adjustHieght(10.h),
                        EventButton(
                          color: neonShadeLinearGradient,
                          text: 'Done',
                          onTap: () {
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
        ),
      );
    },
  );
}
