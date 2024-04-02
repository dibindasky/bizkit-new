import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void copyToClipboard({required String text, required BuildContext context}) {
  Clipboard.setData(ClipboardData(text: text));
  final snackBar = SnackBar(
    duration: const Duration(milliseconds: 2000),
    content: Text(
      '$text copied to clipboard',
      style: const TextStyle(color: kwhite),
    ),
    backgroundColor: neonShade,
    behavior: SnackBarBehavior.floating,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
