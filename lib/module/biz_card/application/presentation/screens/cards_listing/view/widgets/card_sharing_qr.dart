import 'dart:convert';

import 'package:bizkit/core/routes/fade_transition/fade_transition.dart';
import 'package:bizkit/module/biz_card/application/business_logic/qr/qr_bloc.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/profile_screen/view/screen/privacy_security/inner_screens/level_sharing_settings.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/utils/snackbar/snackbar.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/cards_listing/view/widgets/level_sharing.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ScreenCardSharing extends StatelessWidget {
  const ScreenCardSharing({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //context.read<QrBloc>().add(const QrEvent.getQrCodes());
    });
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 18,
            color: kwhite,
          ),
        ),
        backgroundColor: knill,
        title: Text(
          'QR Code',
          style: appBarHeading1,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(cardFadePageRoute(const CardDefaultLevelSharing()));
            },
            icon: const Icon(Icons.ios_share_rounded),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 70.dm,
              child: ListView.separated(
                itemCount: 3,
                separatorBuilder: (context, index) => adjustWidth(20),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(),
                  child: InkWell(
                    onTap: () {
                      // context
                      //     .read<QrBloc>()
                      //     .add(QrEvent.changeQRSelection(index: index));
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: neonShade, width: 5),
                          ),
                          height: 50.dm,
                          width: 50.dm,
                          child: Image.memory(
                            base64.decode(imageTestingBase64.startsWith('data')
                                ? imageTestingBase64.substring(22)
                                : imageTestingBase64),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(
                          'CARD ${index + 1}',
                          style: const TextStyle(color: kwhite),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            kHeight20,
            SizedBox(
              width: 250.dm,
              height: 250.dm,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'asset/dev/QR_code_for_mobile_English_Wikipedia.svg.png', // Remove prefix
                  fit: BoxFit.cover,
                ),
              ),
            ),
            kHeight20,
            Column(
              children: [
                GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    cardFadePageRoute(const ScreenCardLevelSharing()),
                  ),
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
                kHeight10,
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