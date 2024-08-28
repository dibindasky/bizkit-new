import 'dart:convert';

import 'package:bizkit/core/routes/fade_transition/fade_transition.dart';
import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/biz_card/application/controller/text_extraction/text_extraction_controller.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/visiting_cards/visiting_screen.dart';
import 'package:bizkit/utils/image_preview/image_preview.dart';
import 'package:bizkit/module/biz_card/domain/model/text_extraction/text_extraction_model/text_extraction_model.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/event_button.dart';
import 'package:bizkit/utils/snackbar/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class SelectedCard extends StatelessWidget {
  const SelectedCard({super.key});

  @override
  Widget build(BuildContext context) {
    final textExtractionController = Get.find<CardTextExtractionController>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: knill,
        title: Text(
          'Selected Cards',
          style: textHeadStyle1,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Column(
              children: [
                adjustHieght(khieght * .05),
                Obx(
                  () => ListView.separated(
                    separatorBuilder: (context, index) {
                      return adjustHieght(khieght * .02);
                    },
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: textExtractionController.pickedImageUrl.length,
                    itemBuilder: (context, index) {
                      // if (state.pickImageLoading) {
                      //   length += 1;
                      //   if (index + 1 == length) {
                      //     return SizedBox(
                      //       height: 150.dm,
                      //       child: const Center(
                      //         child: CircularProgressIndicator(
                      //           color: neonShade,
                      //         ),
                      //       ),
                      //     );
                      //   }
                      // }
                      return Stack(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                cardFadePageRoute(ScreenImagePreview(
                                    isFileIamge: false,
                                    image: textExtractionController
                                            .pickedImageUrl[index].base64 ??
                                        '')),
                              );
                            },
                            child: Container(
                              width: 310.dm,
                              height: 150.dm,
                              decoration: BoxDecoration(
                                border: Border.all(color: neonShade, width: 2),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.memory(
                                  base64Decode(textExtractionController
                                          .pickedImageUrl[index].base64
                                          ?.substring(22) ??
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
                ),
                adjustHieght(khieght * .02),
                Obx(
                  () => textExtractionController.pickedImageUrl.length >= 2
                      ? kempty
                      : ContainerPickImage(
                          onPressedCam: () {
                            textExtractionController.pickImageScanning(
                                camera: true);
                          },
                          onPressedGallery: () {
                            textExtractionController.pickImageScanning(
                                camera: false);
                          },
                          fromMain: false,
                          heading: 'Add more image',
                        ),
                ),
                adjustHieght(khieght * .02),
                Obx(
                  () => EventButton(
                    text: textExtractionController.isLoading.value == true
                        ? 'Loading....'
                        : 'Continue',
                    onTap: () {
                      if (textExtractionController.pickedImageUrl.isEmpty) {
                        showSnackbar(
                          context,
                          message: 'Select atleast one Image',
                          backgroundColor: kred,
                        );
                      }

                      textExtractionController.textExtraction(
                          fromVisitingCard: true,
                          textExtractionModel: TextExtractionModel(
                              image: textExtractionController
                                      .pickedImageUrl.first.base64
                                      ?.substring(22) ??
                                  ''));

                      GoRouter.of(context)
                          .pushReplacementNamed(Routes.scanedDataFeilds);
                    },
                  ),
                ),
                adjustHieght(khieght * .02),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
