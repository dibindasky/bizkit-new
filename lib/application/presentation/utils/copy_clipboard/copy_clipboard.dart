import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void copyToClipboard({required String text, required BuildContext context}) {
  Clipboard.setData(ClipboardData(text: text));
  const snackBar = SnackBar(
    duration: Duration(milliseconds: 2000),
    content: Text(
      'Link copied to clipboard',
      style: TextStyle(color: kwhite),
    ),
    backgroundColor: neonShade,
    behavior: SnackBarBehavior.floating,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
