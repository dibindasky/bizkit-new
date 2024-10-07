import 'dart:convert';
import 'dart:typed_data';

import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/show_dialogue/show_dailogue.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileImagePreview extends StatefulWidget {
  const ProfileImagePreview({
    super.key,
    required this.image, required this.onCamPressed, required this.onGalleryPressed,
  });

  final String image;
  final VoidCallback onCamPressed;
  final VoidCallback onGalleryPressed;
  

  @override
  State<ProfileImagePreview> createState() => _ProfileImagePreviewState();
}

class _ProfileImagePreviewState extends State<ProfileImagePreview> {
  
  late Uint8List imagePath;
  @override
  void initState() {
    imagePath=base64Decode(widget.image);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 135.h,
      height: 135.h,
      child: Stack(
        children: [
          SizedBox(
              width: 135.h,
              height: 135.h,
              child: CircleAvatar(
                backgroundColor: Colors.grey,
                backgroundImage: MemoryImage(
                        imagePath,),
              )),
          Align(
              alignment: Alignment.bottomRight,
              child: IconButton(
                  onPressed: () {
                    cameraAndGalleryPickImage(
                        context: context,
                        onPressCam: () {
                          widget.onCamPressed(
                            );
                        },
                        onPressGallery: () {
                          widget.onGalleryPressed(
                               );
                        },
                        tittle: 'Pick Image');
                  },
                  icon: const Icon(
                    Icons.camera_alt_rounded,
                    color: neonShade,
                  )))
        ],
      ),
    );
  }
}
