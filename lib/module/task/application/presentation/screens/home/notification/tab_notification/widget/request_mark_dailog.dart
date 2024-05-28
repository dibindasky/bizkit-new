import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<dynamic> requestMarkingDailog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      backgroundColor: kNotificationColor,
      content: SizedBox(
        height: 155.h,
        child: Column(
          children: [
            Text(
              'Mark This Task As',
              style: TextStyle(fontSize: 16.sp),
            ),
            adjustHieght(20.h),
            ClipRRect(
              borderRadius: kBorderRadius15,
              child: const ColoredBox(
                color: neonShade,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Text('Official'),
                  ),
                ),
              ),
            ),
            adjustHieght(5.h),
            ClipRRect(
              borderRadius: kBorderRadius15,
              child: const ColoredBox(
                color: neonShade,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Text('Personl'),
                  ),
                ),
              ),
            ),
            adjustHieght(5.h),
            ClipRRect(
              borderRadius: kBorderRadius15,
              child: const ColoredBox(
                color: neonShade,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Text('Others'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
