import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';

Future<dynamic> requestDiclineShowDailog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      backgroundColor: kNotificationColor,
      title: const Text(
        'Are you sure do you want to Dicline this task',
        style: TextStyle(),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text(
            'No',
            style: TextStyle(),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'Yes',
            style: TextStyle(),
          ),
        ),
      ],
    ),
  );
}
