import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:flutter/material.dart';

showCustomConfirmationDialogue(
    {required BuildContext context,
    required String title,
    Color buttonColor = kneonShade,
    required String buttonText,
    required VoidCallback onTap}) {
  showDialog(
    context: context,
    builder: (context) => Dialog(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        decoration: BoxDecoration(
            border: Border.all(color: neonShade),
            borderRadius: BorderRadius.circular(10),
            color: backgroundColour),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
            ),
            adjustHieght(10),
            FittedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: neonShade)),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Cancel',
                        style: TextStyle(color: neonShade),
                      )),
                  adjustWidth(10),
                  OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          side: BorderSide(color: buttonColor)),
                      onPressed: () {
                        Navigator.pop(context);
                        onTap();
                      },
                      child: Text(
                        buttonText,
                        style: TextStyle(color: buttonColor),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}
