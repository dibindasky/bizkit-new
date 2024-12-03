import 'dart:convert';
import 'package:bizkit/module/biz_card/application/controller/text_extraction/text_extraction_controller.dart';
import 'package:bizkit/module/biz_card/domain/model/text_extraction/text_extraction_model/text_extraction_model.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/utils/snackbar/snackbar.dart';
import 'package:bizkit/utils/widgets/event_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class SelectedCards extends StatefulWidget {
  const SelectedCards({super.key});

  @override
  State<SelectedCards> createState() => _SelectedCardsState();
}

class _SelectedCardsState extends State<SelectedCards> {
  final textExtractionController = Get.find<CardTextExtractionController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ColoredBox(
              color: Theme.of(context).colorScheme.onPrimary,
              child: Column(
                children: [
                  kHeight10,
                  Row(
                    children: [
                      kWidth20,
                      GestureDetector(
                        onTap: () {
                          GoRouter.of(context).pop();
                        },
                        child: CircleAvatar(
                          backgroundColor:
                              Theme.of(context).scaffoldBackgroundColor,
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            size: 15.sp,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                      ),
                      kWidth10,
                      Text('Create Card',
                          style: Theme.of(context).textTheme.bodyMedium)
                    ],
                  ),
                  kHeight5,
                ],
              ),
            ),
            SizedBox(
                height: 300.h,
                width: double.infinity,
                child: Obx(
                  () => Stack(
                    fit: StackFit.expand,
                    children: [
                      Obx(() => Container(
                            height: 300.h,
                            width: double.infinity,
                            color: Theme.of(context).colorScheme.onPrimary,
                            child: textExtractionController
                                    .pickedImageUrl.isEmpty
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        bizcardCreateDummy,
                                        height: 150.h,
                                      ),
                                      kHeight20,
                                      Text(
                                        'Upload a copy of your visiting card to get the \ndetails prefilled without registering.',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                        textAlign: TextAlign.center,
                                      )
                                    ],
                                  )
                                : kempty,
                          )),
                      if (textExtractionController.pickedImageUrl.isNotEmpty)
                        Align(
                            child: Transform.rotate(
                          angle: -0.2,
                          child: InkWell(
                            onTap: () {
                              textExtractionController.swapImages();
                            },
                            child: Container(
                              width: 250.h,
                              height: 180.h,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary),
                                borderRadius: kBorderRadius15,
                                image: DecorationImage(
                                    image: MemoryImage(
                                      base64Decode(textExtractionController
                                              .pickedImageUrl.first.base64 ??
                                          ''),
                                    ),
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                        )),
                      if (textExtractionController.pickedImageUrl.length == 2)
                        Align(
                          child: Transform.rotate(
                            angle: 0.2,
                            child: Obx(() => Container(
                                  width: 250.h,
                                  height: 180.h,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary),
                                    borderRadius: kBorderRadius15,
                                    image: DecorationImage(
                                        image: MemoryImage(
                                          base64Decode(textExtractionController
                                                  .pickedImageUrl[1].base64 ??
                                              ''),
                                        ),
                                        fit: BoxFit.cover),
                                  ),
                                )),
                          ),
                        ),
                      if (textExtractionController.pickedImageUrl.length == 2)
                        Positioned(
                          right: 10.h,
                          bottom: 10.h,
                          child: IconButton(
                            onPressed: () {
                              textExtractionController.swapImages();
                            },
                            icon: Icon(Icons.crop_rotate_rounded,
                                color: Theme.of(context).colorScheme.primary),
                          ),
                        ),
                      if (textExtractionController.pickedImageUrl.isNotEmpty)
                        Positioned(
                          right: 10.h,
                          top: 0.h,
                          child: IconButton(
                            onPressed: () {
                              textExtractionController.deleteImage();
                            },
                            icon: Icon(Icons.delete_outlined,
                                color: Theme.of(context).colorScheme.primary),
                          ),
                        )
                    ],
                  ),
                )),
            SizedBox(
              height: 50.h,
              child: Stack(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ColoredBox(
                        color: Theme.of(context).colorScheme.onPrimary,
                        child: SizedBox(
                          height: 20.h,
                          width: double.infinity,
                        ),
                      ),
                      ColoredBox(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        child: SizedBox(
                          height: 20.h,
                          width: double.infinity,
                        ),
                      ),
                    ],
                  ),
                  Align(
                    child: Obx(() =>
                        textExtractionController.pickedImageUrl.length == 2
                            ? kempty
                            : GestureDetector(
                                onTap: () {
                                  textExtractionController.pickImageScanning(
                                      camera: true);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: kBorderRadius10,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .surface),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 40, vertical: 10),
                                  height: 50.h,
                                  // width: double.infinity,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(Icons.camera_alt_rounded),
                                      kWidth5,
                                      const Text('Use Camera')
                                    ],
                                  ),
                                ),
                              )),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                kempty,
                Obx(() => textExtractionController.pickedImageUrl.length == 2
                    ? kempty
                    : GestureDetector(
                        onTap: () {
                          textExtractionController.pickImageScanning(
                              camera: false);
                        },
                        child: Container(
                          margin: const EdgeInsets.all(40),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                              color: kGrayLight, borderRadius: kBorderRadius10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.image, size: 35.h),
                              kWidth5,
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Select the card from gallery',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall),
                                    Text(
                                      'Upload a copy of your visiting card to get the details prefilled without registering.',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.copyWith(fontSize: 8.h),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )),
                Obx(() {
                  if (textExtractionController.isLoading.value) {
                    return const LoadingAnimation();
                  }
                  return
                   textExtractionController.continueLoading.value?
                           const Center(child: LoadingAnimation())
                          :
                   Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: EventButton(
                        text: 'continue',
                        showGradiant: false,
                        width: double.infinity,
                        onTap: () {
                          if (textExtractionController.pickedImageUrl.isEmpty) {
                            showSnackbar(
                              context,
                              message: 'Select atleast one Image',
                              backgroundColor: kred,
                            );
                          }
                         
                          textExtractionController.textExtraction(
                              context: context,
                              fromVisitingCard: true,
                              textExtractionModel: TextExtractionModel(
                                  images: textExtractionController
                                      .pickedImageUrl
                                      .map((e) => e.base64!)
                                      .toList()));
                          textExtractionController.isLoading.value = false;
                        }),
                  );
                }),
                Obx(() => textExtractionController.pickedImageUrl.length == 2
                    ? Container(
                        margin: const EdgeInsets.all(40),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                            color: kGrayLight, borderRadius: kBorderRadius10),
                        child: Row(
                          children: [
                            Icon(Icons.card_membership_rounded, size: 35.h),
                            kWidth10,
                            Expanded(
                              child: Text(
                                '''We will extract the details and fill them into the appropriate fields. Please check this information before creating the card, as the data may vary depending on the image clarity.''',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(fontSize: 8.h),
                              ),
                            ),
                          ],
                        ),
                      )
                    : kempty),
              ],
            )
          ],
        ),
      ),
    );
  }
}
