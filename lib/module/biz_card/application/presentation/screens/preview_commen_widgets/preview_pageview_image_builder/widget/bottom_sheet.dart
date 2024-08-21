import 'dart:convert';
import 'dart:io';

import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/module/biz_card/application/presentation/widgets/image_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PreviewPageViewBottomSheet extends StatelessWidget {
  const PreviewPageViewBottomSheet(
      {super.key, this.image, this.memoryImage, this.logoStory});

  final File? image;
  final String? memoryImage;
  final String? logoStory;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      // height: khieght * 0.9,
      child: SingleChildScrollView(
        child: Column(
          children: [
            adjustHieght(khieght * .01),
            InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ScreenImagePreview(image: memoryImage!))),
              child: SizedBox(
                height: 250,
                width: double.infinity,
                child: memoryImage != null
                    ? Image.asset(memoryImage!)
                    : Image.file(image!, fit: BoxFit.cover),
              ),
            ),
            adjustHieght(khieght * .02),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'The Back Story',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  adjustHieght(khieght * .01),
                  Text(
                    logoStory ?? '',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  adjustHieght(khieght * .01),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
