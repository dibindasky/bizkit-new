import 'dart:io';

import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/images/image_preview.dart';
import 'package:bizkit/utils/images/network_image_with_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BizcardLogoStoryViewBottomSheet extends StatelessWidget {
  const BizcardLogoStoryViewBottomSheet(
      {super.key, this.image, this.networkImage, this.logoStory});

  final File? image;
  final String? networkImage;
  final String? logoStory;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      // height: khieght * 0.9,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              adjustHieght(khieght * .01),
              InkWell(
                // onTap: () => Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) =>
                //             ScreenImagePreview(image: networkImage!))),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: SizedBox(
                    height: 150.h,
                    width: double.infinity,
                    child: NetworkImageWithLoader(networkImage ?? ''),
                  ),
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
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    adjustHieght(khieght * .01),
                    Text(
                      logoStory ?? '',
                      style:  Theme.of(context).textTheme.displaySmall,
                    ),
                   kHeight40
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
