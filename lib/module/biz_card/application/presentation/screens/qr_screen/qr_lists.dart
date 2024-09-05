import 'dart:convert';

import 'package:bizkit/core/routes/fade_transition/fade_transition.dart';
import 'package:bizkit/module/biz_card/application/controller/card/create_controller.dart';
import 'package:bizkit/module/biz_card/application/controller/level_sharing/level_sharing_controller.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/qr_screen/level_sharing.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/qr_screen/level_sharing_settings.dart';
import 'package:bizkit/module/biz_card/domain/model/level_sharing/individual_shared_fields_query_params_model/individual_shared_fields_query_params_model.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/utils/refresh_indicator/refresh_custom.dart';
import 'package:bizkit/utils/shimmer/shimmer.dart';
import 'package:bizkit/utils/snackbar/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ScreenCardSharing extends StatelessWidget {
  const ScreenCardSharing({super.key});

  @override
  Widget build(BuildContext context) {
    final levelSharingController = Get.find<LevelSharingController>();
    final cardController = Get.find<CardController>();
    WidgetsBinding.instance.addPostFrameCallback((_) {});
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              levelSharingController.updateSelectedCardQRData('', '');
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 18,
              color: kwhite,
            )),
        backgroundColor: knill,
        title: Text(
          'QR Code',
          style: appBarHeading1,
        ),
        actions: [
          IconButton(
              onPressed: () {
                levelSharingController.fetchAllCommonSharedFields();
                Navigator.of(context)
                    .push(cardFadePageRoute(const CardDefaultLevelSharing()));
              },
              icon: const Icon(
                Icons.read_more,
                size: 30,
              )),
          kWidth5
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(
              () {
                if (cardController.isLoading.value) {
                  return SizedBox(
                    height: 70.dm,
                    child: ShimmerLoader(
                      itemCount: 5,
                      height: 40.h,
                      width: 90.w,
                      seprator: kWidth10,
                      scrollDirection: Axis.horizontal,
                    ),
                  );
                } else if (cardController.bizcards.isEmpty) {
                  return ErrorRefreshIndicator(
                    onRefresh: () {},
                    errorMessage: 'No cards ',
                    image: emptyNodata2,
                    shrinkWrap: true,
                  );
                } else {
                  return SizedBox(
                    height: 70.dm,
                    child: ListView.builder(
                      itemCount: cardController.bizcards.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.only(left: 7.w),
                        child: InkWell(
                          onTap: () {
                            levelSharingController.updateSelectedCardQRData(
                                cardController.bizcards[index].qRLink ?? '',
                                cardController.bizcards[index].bizcardId ?? '');
                            // context
                            //     .read<QrBloc>()
                            //     .add(QrEvent.changeQRSelection(index: index));
                          },
                          child:
                              Column(mainAxisSize: MainAxisSize.min, children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: neonShade, width: 3),
                              ),
                              height: 50.dm,
                              width: 50.dm,
                              child: Image.memory(
                                base64.decode(bizcardIconBase64.substring(22)),
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              // 'CARD ${index + 1}',
                              '${cardController.bizcards[index].name}',
                              style: textThinStyle1,
                            ),
                          ]),
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
            kHeight20,
            Obx(() {
              final qrData = levelSharingController.selectedCardQRData.value;
              if (qrData.isEmpty) {
                return SizedBox(
                  width: 250.dm,
                  height: 250.dm,
                  child: const Center(child: Text('Select a card')),
                );
              } else {
                return SizedBox(
                  width: 250.dm,
                  height: 250.dm,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.memory(
                      base64Decode(qrData),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }
            }),
            kHeight20,
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    if (levelSharingController.selectedCardId.isNotEmpty &&
                        levelSharingController.selectedCardQRData.isNotEmpty) {
                      levelSharingController.fetchIndividualSharedFields(
                          queryParameter:
                              IndividualSharedFieldsQueryParamsModel(
                                  bizcardId: levelSharingController
                                      .selectedCardId.value));
                      Navigator.of(context).push(
                        cardFadePageRoute(const ScreenCardLevelSharing()),
                      );
                    } else {
                      showSnackbar(context, message: 'Select a card');
                    }
                  },
                  child: Container(
                    width: 300.dm,
                    decoration: BoxDecoration(
                      border: Border.all(color: neonShade),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.only(left: 15, right: 10),
                    height: 60.dm,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Level Sharing',
                              style: TextStyle(
                                fontSize: kwidth * 0.037,
                              ),
                            ),
                            Text(
                              'Professional, Emergency, Company',
                              style: TextStyle(
                                fontSize: kwidth * 0.027,
                              ),
                            ),
                          ],
                        ),
                        const Icon(
                          Icons.keyboard_arrow_right_rounded,
                          color: kwhite,
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                ),
                kHeight5,
                Container(
                    width: 300.dm,
                    decoration: BoxDecoration(
                      border: Border.all(color: neonShade),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    child:
                        // (model.phoneNumber == null ||
                        //             model.phoneNumber == false) &&
                        //         (model.address == null || model.address == false) &&
                        //         (model.company == null || model.company == false) &&
                        //         (model.socialMediaHandles == null ||
                        //             model.socialMediaHandles == false) &&
                        //         (model.personalSocialMedia == null ||
                        //             model.personalSocialMedia == false) &&
                        //         (model.email == null || model.email == false) &&
                        //         (model.websiteLink == null ||
                        //             model.websiteLink == false) &&
                        //         (model.businessDetailsMobileNumber == null ||
                        //             model.businessDetailsMobileNumber == false) &&
                        //         (model.businessEmail == null ||
                        //             model.businessEmail == false) &&
                        //         (model.accolades == null ||
                        //             model.accolades == false) &&
                        //         (model.accreditation == null ||
                        //             model.accreditation == false)
                        //     ?
                        const Text(
                      'your personal and company details will not be shared',
                    )
                    // : Column(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //         model.email ?? false
                    //             ? const Text(' Email')
                    //             : const SizedBox(),
                    //         model.phoneNumber ?? false
                    //             ? const Text(' Phone Number')
                    //             : const SizedBox(),
                    //         model.company ?? false
                    //             ? const Text(' Company')
                    //             : const SizedBox(),
                    //         model.personalSocialMedia ?? false
                    //             ? const Text(' Personal Social Medias')
                    //             : const SizedBox(),
                    //         model.accolades ?? false
                    //             ? const Text(' Personal Achievements')
                    //             : const SizedBox(),
                    //         model.businessDetailsMobileNumber ?? false
                    //             ? const Text(' Business Mobile')
                    //             : const SizedBox(),
                    //         model.businessEmail ?? false
                    //             ? const Text(' Business Email')
                    //             : const SizedBox(),
                    //         model.websiteLink ?? false
                    //             ? const Text(' Website')
                    //             : const SizedBox(),
                    //         model.accreditation ?? false
                    //             ? const Text(' Company Achievements')
                    //             : const SizedBox(),
                    //         model.address ?? false
                    //             ? const Text(' Address')
                    //             : const SizedBox(),
                    //         model.socialMediaHandles ?? false
                    //             ? const Text(' Company Social Medias')
                    //             : const SizedBox(),
                    //       ]),
                    ),
                adjustHieght(10),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
