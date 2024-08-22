import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/biz_card/application/controller/text_extraction/text_extraction_controller.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

Future<dynamic> cardscanimagesSelectingDailogue(
    BuildContext context, Widget widget) {
  final textExtractionController = Get.find<CardTextExtractionController>();
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      actions: [
        ElevatedButton(
          onPressed: () async {
            Navigator.pop(context);

            textExtractionController.pickImageScanning(camera: false);
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => widget,
            ));
          },
          style: ElevatedButton.styleFrom(
              foregroundColor: kwhite, side: const BorderSide(color: kwhite)),
          child: const Text('Gallery'),
        ),
        adjustHieght(khieght * .02),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            textExtractionController.pickImageScanning(
              camera: true,
            );

            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => widget,
            ));
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
