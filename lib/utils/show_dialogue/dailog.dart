import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

showConfirmationDialog(
  BuildContext context, {
  bool noButton = false,
  String? heading,
  Widget? content,
  String? actionButton,
  void Function()? onPressed,
}) async {
  return showDialog(
    context: context,
    builder: (context) => Dialog(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 35),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(heading ?? '',style: Theme.of(context).textTheme.titleMedium,),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(width: 20),
                Expanded(
                  child: InkWell(
                    onTap: () => GoRouter.of(context).pop(false),
                    child: Container(

                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        
                        borderRadius:
                            const BorderRadius.all(Radius.circular(35)),
                        border: Border.all(color: neonShade),
                      ),
                      child:  Center(child: Text('Cancel',style: Theme.of(context).textTheme.titleMedium,)),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      onPressed?.call(); // Invoke onPressed function
                      GoRouter.of(context).pop(false);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: neonShade,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(35)),
                        border: Border.all(color: neonShade),
                      ),
                      child: Center(child: Text(actionButton ?? 'Delete',style: Theme.of(context).textTheme.bodyMedium)),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
