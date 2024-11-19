import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';

void copyToClipboard({required String text, required BuildContext context}) {
  Clipboard.setData(ClipboardData(text: text));
  Fluttertoast.showToast(
    msg: "$text copied to clipboard",
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 3,
    backgroundColor: Theme.of(context).colorScheme.surface,
    textColor: Theme.of(context).colorScheme.onTertiary,
  );
}
