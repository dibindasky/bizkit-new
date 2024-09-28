import 'dart:convert';
import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/biz_card/application/controller/text_extraction/text_extraction_controller.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_create/widgets/card_uploading_showdailogue.dart';
import 'package:bizkit/module/biz_card/domain/model/text_extraction/text_extraction_model/text_extraction_model.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/event_button.dart';
import 'package:bizkit/utils/snackbar/snackbar.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class PickedScanningCards extends StatelessWidget {
  const PickedScanningCards({super.key});

  @override
  Widget build(BuildContext context) {
    final textExtractionController = Get.find<CardTextExtractionController>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // automaticallyImplyLeading: false,
        backgroundColor: knill,
        title: Text(
          'Selecetd Images',
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
                      return Stack(
                        children: [
                          InkWell(
                            onTap: () {
                              GoRouter.of(context).pushNamed(
                                  Routes.slidablePhotoGallery,
                                  extra: {
                                    'initial': index,
                                    'images': [
                                      textExtractionController
                                              .pickedImageUrl[index].base64 ??
                                          ''
                                    ],
                                    'memory': true
                                  });
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
                                          .pickedImageUrl[index].base64 ??
                                      ''),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Align(
                              alignment: Alignment.topRight,
                              child: IconButton(
                                  onPressed: () {
                                    textExtractionController.pickedImageUrl
                                        .removeAt(index);
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    color: kred,
                                  )))
                        ],
                      );
                    },
                  ),
                ),
                adjustHieght(khieght * .02),
                Obx(
                  () => textExtractionController.pickedImageUrl.length >= 2
                      ? kempty
                      : DottedBorder(
                          dashPattern: const [8, 8],
                          color: neonShade,
                          strokeWidth: 2.5,
                          child: SizedBox(
                            width: double.infinity,
                            height: 110.dm,
                            child: GestureDetector(
                              onTap: () {
                                cardscanimagesSelectingDailogue(
                                    context, const PickedScanningCards(), true);
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 32.dm,
                                    height: 32.dm,
                                    child: const CircleAvatar(
                                      child: Center(child: Icon(Icons.add)),
                                    ),
                                  ),
                                  Text(
                                    'Add more images',
                                    style: TextStyle(fontSize: 10.sp),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                ),
                adjustHieght(khieght * .02),
                Obx(
                  () => textExtractionController.isLoading.value
                      ? const Center(
                          child: CircularProgressIndicator(color: neonShade))
                      : EventButton(
                          text: 'Continue',
                          onTap: () {
                            if (textExtractionController
                                .pickedImageUrl.isEmpty) {
                              showSnackbar(
                                context,
                                message: 'Select atleast one Image',
                                backgroundColor: kred,
                              );
                            } else {
                              textExtractionController.textExtraction(
                                  context: context,
                                  fromVisitingCard: false,
                                  textExtractionModel: TextExtractionModel(
                                      images: textExtractionController
                                          .pickedImageUrl
                                          .map((e) => e.base64!)
                                          .toList()));
                            }
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
