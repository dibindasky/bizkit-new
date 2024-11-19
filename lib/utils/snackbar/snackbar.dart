import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';

void showSnackbar(
  BuildContext context, {
  required String message,
  Color backgroundColor = neonShade,
  int duration = 2,
  Color textColor = kblack,
}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    behavior: SnackBarBehavior.floating,
    elevation: 5,
    content: Text(
      getFirstCapital(message),
      style: Theme.of(context).textTheme.bodySmall?.copyWith(color: textColor),
    ),
    backgroundColor: backgroundColor,
    duration: Duration(seconds: duration),
  ));
}

String getFirstCapital(String message) {
  if (message.isEmpty) return '';
  return message.replaceRange(0, 1, message[0].toUpperCase());
}
