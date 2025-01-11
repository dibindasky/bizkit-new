// import 'package:bizkit/utils/constants/colors.dart';
// import 'package:flutter/material.dart';

// Future<dynamic> cameraAndGalleryPickImage({
//   required BuildContext context,
//   required Function onPressCam,
//   String? tittle,
//   required Function onPressGallery,
// }) {
//   return showDialog(
//     context: context,
//     builder: (context) => AlertDialog(
//       actions: [
//         ElevatedButton(
//           onPressed: () {
//             Navigator.pop(context);
//             onPressGallery();
//           },
//           style: ElevatedButton.styleFrom(
//               backgroundColor: neonShade, foregroundColor: kwhite),
//           child: Text(
//             'Gallery',
//             style: Theme.of(context)
//                 .textTheme
//                 .displaySmall
//                 ?.copyWith(color: kwhite),
//           ),
//         ),
//         adjustHieght(khieght * .02),
//         ElevatedButton(
//           onPressed: () {
//             Navigator.pop(context);
//             onPressCam();
//           },
//           style: ElevatedButton.styleFrom(
//               backgroundColor: neonShade, foregroundColor: kwhite),
//           child: Text(
//             'Camera',
//             style: Theme.of(context)
//                 .textTheme
//                 .displaySmall
//                 ?.copyWith(color: kwhite),
//           ),
//         )
//       ],
//       title: Text(
//         tittle ?? 'Select Selfie Image',
//         style: Theme.of(context)
//             .textTheme
//             .titleMedium
//             ?.copyWith(fontWeight: FontWeight.w500),
//       ),
//     ),
//   );
// }

import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Future<dynamic> cameraAndGalleryPickImage({
  required BuildContext context,
  required Function onPressCam,
  String? tittle,
  String? contentText,
  required Function onPressGallery,
}) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 150,
            child: Image.asset('asset/images/image_picker.png'),
          ),
          Text(
            textAlign: TextAlign.center,
            contentText ??
                "Please select an image source to proceed. You can capture a new image using your camera or pick from your gallery.",
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  color: kGreyNormal,
                  fontSize: 10,
                ),
          )
        ],
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                GoRouter.of(context).pop();
                onPressGallery();
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onSecondary,
                  borderRadius: kBorderRadius10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.photo_library_rounded,
                      color: Theme.of(context).colorScheme.onTertiary,
                      size: 15,
                    ),
                    adjustWidth(5),
                    Text(
                      'Gallery',
                      style: Theme.of(context).textTheme.bodySmall,
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                GoRouter.of(context).pop();
                onPressCam();
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onSecondary,
                    borderRadius: kBorderRadius10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.camera_alt_rounded,
                      color: Theme.of(context).colorScheme.onTertiary,
                      size: 15,
                    ),
                    adjustWidth(2),
                    Text(
                      'Camera',
                      style: Theme.of(context).textTheme.bodySmall,
                    )
                  ],
                ),
              ),
            ),
          ],
        )
      ],
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            tittle ?? 'Select Image',
            style: Theme.of(context)
                .textTheme
                .displayMedium
                ?.copyWith(fontWeight: FontWeight.w500),
          ),
          GestureDetector(
            onTap: () {
              GoRouter.of(context).pop();
            },
            child: CircleAvatar(
              radius: 20,
              backgroundColor: kGreyNormal.withOpacity(0.2),
              child: const Icon(
                Icons.close,
                size: 18,
              ),
            ),
          )
        ],
      ),
    ),
  );
}
