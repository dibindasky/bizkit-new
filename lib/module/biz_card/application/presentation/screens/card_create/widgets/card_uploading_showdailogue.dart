import 'package:bizkit/module/biz_card/application/controller/text_extraction/text_extraction_controller.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<dynamic> cardscanimagesSelectingDailogue(
    BuildContext context, Widget widget, bool fromAddMoreCards) {
  final textExtractionController = Get.find<CardTextExtractionController>();
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      actions: [
        ElevatedButton(
          onPressed: () async {
            Navigator.pop(context);
            // textExtractionController.pickedImageUrl.clear();
            textExtractionController.pickImageScanning(camera: false);
            if (!fromAddMoreCards) {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => widget,
              ));
            }
          },
          style: ElevatedButton.styleFrom(
              foregroundColor: kwhite, side: const BorderSide(color: kwhite)),
          child: const Text('Gallery'),
        ),
        adjustHieght(khieght * .02),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            // textExtractionController.pickedImageUrl.clear();
            textExtractionController.pickImageScanning(
              camera: true,
            );

            if (!fromAddMoreCards) {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => widget,
              ));
            }
          },
          style: ElevatedButton.styleFrom(
              foregroundColor: kwhite, side: const BorderSide(color: kwhite)),
          child: const Text('Camera'),
        )
      ],
      title: const Text('Take a picture or upload an image'),
    ),
  );
}
