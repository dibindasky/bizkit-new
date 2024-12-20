import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

showCustomConfirmationDialogue(
    {required BuildContext context,
    required String title,
    Color? buttonColor,
    String? description,
    required String buttonText,
    required VoidCallback onTap}) {
  showDialog(
    context: context,
    builder: (context) => Dialog(
      // backgroundColor: kblack,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: kBorderRadius10,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .displayMedium
                  ?.copyWith(fontWeight: FontWeight.w600, fontSize: 13),
            ),
            adjustHieght(10),
            Text(
              description ?? '',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displaySmall,
            ),
            FittedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        side: BorderSide(
                            color: Theme.of(context).colorScheme.primary)),
                    onPressed: () {
                      GoRouter.of(context).pop();
                    },
                    child: Text(
                      'Cancel',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ),
                  adjustWidth(10),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        side: BorderSide(
                            color: buttonColor ??
                                Theme.of(context).colorScheme.primary)),
                    onPressed: () {
                      GoRouter.of(context).pop();
                      onTap();
                    },
                    child: Text(
                      buttonText,
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}
