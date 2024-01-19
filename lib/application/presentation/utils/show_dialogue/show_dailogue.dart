import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:flutter/material.dart';

Future<dynamic> customDailogue(
    {required BuildContext context, required Function onPress}) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            onPress();
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: neonShade, foregroundColor: kwhite),
          child: const Text('Gallery'),
        ),
        adjustHieght(khieght * .02),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            onPress();
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: kred, foregroundColor: kwhite),
          child: const Text('Camera'),
        )
      ],
      title: const Text('are you sure?'),
    ),
  );
}
