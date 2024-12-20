import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';

Future<dynamic> cameraAndGalleryPickImage({
  required BuildContext context,
  required Function onPressCam,
  String? tittle,
  required Function onPressGallery,
}) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            onPressGallery();
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: neonShade, foregroundColor: kwhite),
          child: const Text('Gallery'),
        ),
        adjustHieght(khieght * .02),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            onPressCam();
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: neonShade, foregroundColor: kwhite),
          child: const Text('Camera'),
        )
      ],
      title: Text(
        tittle ?? 'Select Selfie Image',
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(fontWeight: FontWeight.w500),
      ),
    ),
  );
}
