import 'dart:convert';
import 'dart:io';

import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PreviewPageViewBottomSheet extends StatelessWidget {
  const PreviewPageViewBottomSheet(
      {super.key, this.image, this.imageNetwork, this.logoStory});

  final File? image;
  final String? imageNetwork;
  final String? logoStory;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: khieght * 3.3 / 4,
      decoration: const BoxDecoration(
        color: backgroundColour,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          adjustHieght(khieght * .005),
          Center(
            child: Container(
              margin: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                color: kwhite,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              height: 5.dm,
              width: 85,
            ),
          ),
          adjustHieght(khieght * .01),
          SizedBox(
            height: 250,
            width: double.infinity,
            child: imageNetwork != null
                ? Image.memory(base64.decode(imageNetwork!))
                : Image.file(image!, fit: BoxFit.cover),
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
    );
  }
}
