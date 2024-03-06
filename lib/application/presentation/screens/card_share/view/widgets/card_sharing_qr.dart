import 'dart:convert';

import 'package:bizkit/application/business_logic/qr/qr_bloc.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/fade_transition/fade_transition.dart';
import 'package:bizkit/application/presentation/screens/authentication/view/widgets/auth_button.dart';
import 'package:bizkit/application/presentation/screens/card_share/view/widgets/level_sharing.dart';
import 'package:bizkit/application/presentation/utils/constants/contants.dart';
import 'package:bizkit/application/presentation/utils/loading_indicator/loading_animation.dart';
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
      body: Column(
        children: [
          SizedBox(
            height: 70.dm,
            child: BlocBuilder<QrBloc, QrState>(
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
                                      border: Border.all(
                                          color: neonShade, width: 5))
                                  : null,
                              height: 50.dm,
                              width: 50.dm,
                              child: Image.network(
                                state.qrList[state.selectedQrIndex].logo == null
                                    ? image
                                    : state.qrList[index].logo!,
                                fit: BoxFit.cover,
                              )),
                          Text(
                            'CARD ${index + 1}',
                            style: TextStyle(
                                color: index == state.selectedQrIndex
                                    ? neonShade
                                    : null),
                          )
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
              return const LoadingAnimation();
            } else if (state.qrList.isEmpty) {
              return const Text('No Qr code available');
            } else if (state.qrList.isNotEmpty) {
              print(state.qrList[state.selectedQrIndex].qrCode!);
              return SizedBox(
                width: 250.dm,
                height: 250.dm,
                child: Image.memory(
                  base64Decode(state.qrList[state.selectedQrIndex].qrCode!
                      .substring(
                          'data:image/png;base64,'.length)), // Remove prefix
                  fit: BoxFit.cover,
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
                        padding: const EdgeInsets.only(left: 15, right: 10),
                        height: 60.dm,
                        width: 300.dm,
                        decoration:
                            BoxDecoration(border: Border.all(color: kwhite)),
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
                    adjustHieght(10),
                    Container(
                      width: 300.dm,
                      decoration:
                          BoxDecoration(border: Border.all(color: neonShade)),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            model.phoneNumber ?? true
                                ? const Text(' Phone Number')
                                : const SizedBox(),
                            Text(model.email ?? true ? ' Email' : ''),
                            model.company ?? true
                                ? const Text(' Company')
                                : const SizedBox(),
                            model.personalSocialMedia ?? true
                                ? const Text(' Personal Socialmedia')
                                : const SizedBox(),
                            model.address ?? true
                                ? const Text(' Address')
                                : const SizedBox(),
                            model.businessEmail ?? true
                                ? const Text(' Business Email')
                                : const SizedBox(),
                            model.businessDetailsMobileNumber!
                                ? const Text(' Business Mobile')
                                : const SizedBox(),
                            model.socialMediaHandles ?? true
                                ? const Text(' Business Socialmedia')
                                : const SizedBox(),
                            model.websiteLink ?? true
                                ? const Text(' Website')
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
          BlocBuilder<QrBloc, QrState>(
            builder: (context, state) {
              if (state.isLoading || state.qrList.isEmpty) {
                return const SizedBox();
              }
              return AuthButton(
                text: 'Share',
                onTap: () {},
                wdth: 110,
              );
            },
          ),
          // adjustHieght(khieght * .04),
        ],
      ),
    );
  }
}
