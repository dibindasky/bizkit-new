import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';

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
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          border: Border.all(color: neonShade),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(heading ?? ''),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(width: 20),
                Expanded(
                  child: InkWell(
                    onTap: () => Navigator.pop(context, false),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        border: Border.all(color: neonShade),
                      ),
                      child: const Center(child: Text('Cancel')),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      onPressed?.call(); // Invoke onPressed function
                      Navigator.pop(context, false);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: neonShade,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        border: Border.all(color: neonShade),
                      ),
                      child: Center(child: Text(actionButton ?? 'Delete')),
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
