import 'dart:convert';
import 'package:bizkit/core/routes/fade_transition/fade_transition.dart';
import 'package:bizkit/module/biz_card/application/controller/text_extraction/text_extraction_controller.dart';
import 'package:bizkit/module/biz_card/domain/model/text_extraction/text_extraction_model/text_extraction_model.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/images/image_preview.dart';
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
                  kHeight5,
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
                      Text('Selected Cards',
                          style: Theme.of(context).textTheme.bodyMedium)
                    ],
                  ),
                  kHeight5,
                ],
              ),
            ),
            Obx(()=>
             Stack(
                    children: [
                      
                      SizedBox(
                        height: 300.h,
                        width: double.infinity,
                        child: ColoredBox(
                          color: Theme.of(context).colorScheme.onPrimary,
                          child:
                          textExtractionController.pickedImageUrl.isEmpty?
                           Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                bizcardCreateDummy,
                                height: 150.h,
                              ),
                              kHeight20,
                              Text(
                                'Upload a copy of your visiting card to get the \ndetails prefilled without registering.',
                                style: Theme.of(context).textTheme.bodySmall,
                                textAlign: TextAlign.center,
                              )
                            ],
                          )
                          :Obx(
                          () => ListView.separated(
                            separatorBuilder: (context, index) {
                              return adjustHieght(khieght * .00);
                            },
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount:
                                textExtractionController.pickedImageUrl.length,
                            itemBuilder: (context, index) {
                              return Stack(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        cardFadePageRoute(ScreenImagePreview(
                                            isFileIamge: false,
                                            image: textExtractionController
                                                    .pickedImageUrl[index]
                                                    .base64 ??
                                                '')),
                                      );
                                    },
                                    child: Container(
                                      width: 310.dm,
                                      height: 150.dm,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: neonShade, width: 2),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.memory(
                                          base64Decode(textExtractionController
                                                  .pickedImageUrl[index]
                                                  .base64 ??
                                              ''),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: IconButton(
                                      color: neonShade,
                                      onPressed: () {
                                        textExtractionController.pickedImageUrl
                                            .removeAt(index);
                                      },
                                      icon: const Icon(Icons.delete),
                                    ),
                                  )
                                ],
                              );
                            },
                          ),
                        )
                          ,
                        ),
                      )
                    ],
                  ),  
            ),            
            Obx(() => textExtractionController.pickedImageUrl.length >= 2
                ? SizedBox(
                              height: 100.h,
                              width: double.infinity,
                            )
                : Stack(
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
                        child: GestureDetector(
                          onTap: () => textExtractionController
                              .pickImageScanning(camera: true),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: kBorderRadius10,
                                color: Theme.of(context).colorScheme.surface),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 10),
                            height: 50,
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
                        ),
                      ),
                    ],
                  )),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                kempty,
                Obx(() => textExtractionController.pickedImageUrl.length >= 2
                    ? kempty
                    : GestureDetector(
                        onTap: () => textExtractionController.pickImageScanning(
                            camera: false),
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
                Obx(() => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: textExtractionController.isLoading.value
                          ? const Center(
                              child:
                                  CircularProgressIndicator(color: neonShade))
                          : EventButton(
                              text: 'Continue',
                              showGradiant: false,
                              width: double.infinity,
                              onTap: () {
                                if (textExtractionController
                                    .pickedImageUrl.isEmpty) {
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
                              }),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
