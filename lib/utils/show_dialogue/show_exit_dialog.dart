import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Shows an exit confirmation dialog when attempting to exit the app.
Future<bool?> showExitDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      elevation: 5,
      surfaceTintColor: kblack,
      titleTextStyle:
          textHeadStyle1.copyWith(fontWeight: FontWeight.w300, fontSize: 18.sp),
      contentTextStyle: textThinStyle1,
      shadowColor: neonShade,
      title: Text(
        'Exit From Bizkit',
        style: Theme.of(context).textTheme.displaySmall?.copyWith(fontSize: 16),
      ),
      content: Text(
        'Are you sure you want to exit the app ?',
        style: Theme.of(context).textTheme.displaySmall?.copyWith(),
      ),
      actions: [
        OutlinedButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            'Cancel',
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
        OutlinedButton(
          onPressed: () {
            Navigator.of(context).pop();
            SystemNavigator.pop(); // Exit app
          },
          child: Text(
            'Exit',
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
      ],
    ),
  );
}
