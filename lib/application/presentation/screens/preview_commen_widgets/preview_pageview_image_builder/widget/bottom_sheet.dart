import 'dart:io';

import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PreviewPageViewBottomSheet extends StatelessWidget {
  const PreviewPageViewBottomSheet({
    super.key,
    required this.image,
  });

  final File image;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColour,
      width: double.infinity,
      height: khieght * 3.3 / 4,
      child: Column(
        children: [
          adjustHieght(khieght * .005),
          Center(
            child: Container(
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
            child: Image.file(
              image,
              fit: BoxFit.cover,
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
                const Text(
                  "The green square represents Xbox (fun). The blue square represents Microsoft Windows (calmness). The yellow square represents Bing (optimism and creativity). If you look closely at the logo, you will notice that the Microsoft logo is inspired by the Windows logo, which is one of the company's most prominent products.",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                adjustHieght(khieght * .01),
                Text(
                  'When',
                  style: TextStyle(
                    fontFamily: 'Euclid',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                adjustHieght(khieght * .01),
                const Text(
                  "t was designed in 1975 when William Gates and Paul Allen thought of foraying into the technology world. They launched Microsoft on April 4, 1975. Simon Daniels designed the first-ever logo for the Company. The logo design comprised letters in the shape of Disco music discs.",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
