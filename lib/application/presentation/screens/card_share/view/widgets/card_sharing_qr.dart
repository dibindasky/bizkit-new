import 'dart:convert';

import 'package:bizkit/application/business_logic/qr/qr_bloc.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/fade_transition/fade_transition.dart';
import 'package:bizkit/application/presentation/screens/card_share/view/widgets/level_sharing.dart';
import 'package:bizkit/application/presentation/utils/constants/contants.dart';
import 'package:bizkit/application/presentation/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/application/presentation/utils/snackbar/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardSharingScreen extends StatelessWidget {
  const CardSharingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<QrBloc>().add(const QrEvent.getQrCodes());
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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 70.dm,
              child: BlocConsumer<QrBloc, QrState>(
                listener: (context, state) {
                  if (state.message != null && state.hasError) {
                    showSnackbar(context,
                        message: state.message!, backgroundColor: kred);
                  }
                },
                builder: (context, state) {
                  if (state.qrList.isEmpty) {
                    return const SizedBox();
                  }
                  return ListView.separated(
                    itemCount: state.qrList.length,
                    separatorBuilder: (context, index) => adjustWidth(20),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.only(
                        left: index == 0 ? 20 : 0,
                        right: index == state.qrList.length - 1 ? 20 : 0,
                      ),
                      child: InkWell(
                        onTap: () {
                          context
                              .read<QrBloc>()
                              .add(QrEvent.changeQRSelection(index: index));
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              decoration: index == state.selectedQrIndex
                                  ? BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: neonShade, width: 5),
                                    )
                                  : null,
                              height: 50.dm,
                              width: 50.dm,
                              child: state.qrList[index].logo == null
                                  ? Image.network(
                                      image,
                                      fit: BoxFit.cover,
                                    )
                                  : Image.memory(
                                      base64.decode(state.qrList[index].logo!
                                              .startsWith('data')
                                          ? state.qrList[index].logo!
                                              .substring(22)
                                          : state.qrList[index].logo!),
                                      fit: BoxFit.cover,
                                    ),
                            ),
                            Text(
                              'CARD ${index + 1}',
                              style: TextStyle(
                                  color: index == state.selectedQrIndex
                                      ? neonShade
                                      : null),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            adjustHieght(khieght * .06),
            BlocBuilder<QrBloc, QrState>(builder: (context, state) {
              if (state.isLoading) {
                return const Center(child: LoadingAnimation());
              } else if (state.qrList.isEmpty) {
                return SizedBox(
                    height: khieght * .5,
                    child: const Center(child: Text('No Qr code available')));
              } else if (state.qrList.isNotEmpty) {
                //print(state.qrList[state.selectedQrIndex].qrCode!);
                return SizedBox(
                  width: 250.dm,
                  height: 250.dm,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.memory(
                      base64Decode(state.qrList[state.selectedQrIndex].qrCode!
                          .substring(22)), // Remove prefix
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              } else {
                return const SizedBox();
              }
            }),
            adjustHieght(khieght * .04),
            BlocBuilder<QrBloc, QrState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return const SizedBox();
                } else if (state.qrList.isNotEmpty) {
                  final model = context.read<QrBloc>().createQrModel;
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.of(context).push(
                          fadePageRoute(const LevelSharing()),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                      adjustHieght(10),
                      Container(
                        width: 300.dm,
                        decoration: BoxDecoration(
                          border: Border.all(color: neonShade),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.all(10),
                        child: (model.phoneNumber == null ||
                                    model.phoneNumber == false) &&
                                (model.address == null ||
                                    model.address == false) &&
                                (model.company == null ||
                                    model.company == false) &&
                                (model.socialMediaHandles == null ||
                                    model.socialMediaHandles == false) &&
                                (model.personalSocialMedia == null ||
                                    model.personalSocialMedia == false) &&
                                (model.email == null || model.email == false) &&
                                (model.websiteLink == null ||
                                    model.websiteLink == false) &&
                                (model.businessDetailsMobileNumber == null ||
                                    model.businessDetailsMobileNumber ==
                                        false) &&
                                (model.businessEmail == null ||
                                    model.businessEmail == false) &&
                                (model.accolades == null ||
                                    model.accolades == false) &&
                                (model.accreditation == null ||
                                    model.accreditation == false)
                            ? const Text(
                                'your personal and company contacts will not be shared',
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    model.email ?? false
                                        ? const Text(' Email')
                                        : const SizedBox(),
                                    model.phoneNumber ?? false
                                        ? const Text(' Phone Number')
                                        : const SizedBox(),
                                    model.company ?? false
                                        ? const Text(' Company')
                                        : const SizedBox(),
                                    model.personalSocialMedia ?? false
                                        ? const Text(' Personal Social Medias')
                                        : const SizedBox(),
                                    model.accolades ?? false
                                        ? const Text(' Personal Achievements')
                                        : const SizedBox(),
                                    model.businessDetailsMobileNumber ?? false
                                        ? const Text(' Business Mobile')
                                        : const SizedBox(),
                                    model.businessEmail ?? false
                                        ? const Text(' Business Email')
                                        : const SizedBox(),
                                    model.websiteLink ?? false
                                        ? const Text(' Website')
                                        : const SizedBox(),
                                    model.accreditation ?? false
                                        ? const Text(' Company Achievements')
                                        : const SizedBox(),
                                    model.address ?? false
                                        ? const Text(' Address')
                                        : const SizedBox(),
                                    model.socialMediaHandles ?? false
                                        ? const Text(' Company Social Medias')
                                        : const SizedBox(),
                                  ]),
                      ),
                      adjustHieght(10),
                    ],
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
