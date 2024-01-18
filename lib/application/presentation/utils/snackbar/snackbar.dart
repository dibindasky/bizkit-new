import 'package:bizkit/application/commen/const.dart';
import 'package:flutter/material.dart';

void showSnackbar(BuildContext context,
    {required String message,
    Color backgroundColor = neonShade,
    Color textColor = kblack}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      message,
      style: textStyle1.copyWith(color: textColor),
    ),
    backgroundColor: backgroundColor,
    duration:const Duration(seconds: 2),
  ));
}
