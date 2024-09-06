import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bizkit/module/biz_card/application/controller/card/business_details.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/event_button.dart';
import 'package:crop_your_image/crop_your_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Croper extends StatefulWidget {
  const Croper({super.key, this.imageToCrop});

  final Uint8List? imageToCrop;

  @override
  State<Croper> createState() => _CroperState();
}

class _CroperState extends State<Croper> {
  final _controller = CropController();
  String? croppedImage;
  bool showLoader = false;

// convert file to unit8List
  Future<Uint8List> fileImageToUint8List(File file) async {
    List<int> bytes = await file.readAsBytes();
    return Uint8List.fromList(bytes);
  }

// convert unit8List to file
  Future<void> writeUint8ListToFile(
      Uint8List uint8List, String filePath) async {
    File file = File(filePath);
    await file.writeAsBytes(uint8List);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('crop')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('crop your logo from image'),
          adjustHieght(10),
          SizedBox(
            height: khieght * 0.6,
            child: Crop(
              image: widget.imageToCrop!,
              controller: _controller,
              onCropped: (image) {
                croppedImage = base64Encode(image);
                Get.find<BusinesDetailsController>()
                    .addCropedLogoImage(base64: croppedImage!);

                Navigator.pop(context);
              },
              aspectRatio: 3 / 4,
              initialRectBuilder: (rect, imageRect) => Rect.fromLTRB(
                rect.left + 24,
                rect.top + 32,
                rect.right - 24,
                rect.bottom - 32,
              ),
              baseColor: textFieldFillColr,
              maskColor: Colors.grey.withOpacity(.8),
              radius: 20,
              onMoved: (newRect) {},
              onStatusChanged: (status) {},
              cornerDotBuilder: (size, edgeAlignment) =>
                  const DotControl(color: Color.fromARGB(255, 9, 207, 214)),
              interactive: true,
            ),
          ),
          adjustHieght(20),
          showLoader
              ? const Center(child: CircularProgressIndicator(color: neonShade))
              : EventButton(
                  text: 'Crop',
                  onTap: () {
                    setState(() {
                      showLoader = true;
                    });
                    _controller.crop();
                  })
        ],
      ),
    );
  }
}
