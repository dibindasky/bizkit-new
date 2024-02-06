import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:flutter/material.dart';

void showSnackbar(BuildContext context,
    {required String message,
    Color backgroundColor = neonShade,
    int duration = 2,
    Color textColor = kblack}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    elevation: 5,
    content: Text(
      message,
      style: textStyle1.copyWith(color: textColor),
    ),
    backgroundColor: backgroundColor,
    duration: Duration(seconds: duration),
  ));
}
