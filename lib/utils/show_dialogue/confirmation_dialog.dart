import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';

showCustomConfirmationDialogue(
    {required BuildContext context,
    required String title,
    Color buttonColor = kneonShade,
    String? description,
    required String buttonText,
    required VoidCallback onTap}) {
  showDialog(
    context: context,
    builder: (context) => Dialog(
      backgroundColor: kblack,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        decoration: BoxDecoration(
            border: Border.all(color: kneon),
            borderRadius: kBorderRadius10,
            color: backgroundColour),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
            ),
            adjustHieght(10),
            Text(description ?? ''),
            FittedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: kneon)),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Cancel',
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall
                            ?.copyWith(color: kwhite),
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
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall
                            ?.copyWith(color: kwhite),
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
