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
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 70.dm,
              child: ListView.separated(
                itemCount: 5,
                separatorBuilder: (context, index) => adjustWidth(20),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.only(left: index == 0 ? 20 : 0),
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
                            decoration: index == 0
                                ? BoxDecoration(
                                    border:
                                        Border.all(color: neonShade, width: 5))
                                : null,
                            height: 50.dm,
                            child: Image.network(image)),
                        Text(
                          'CARD ${index + 1}',
                          style:
                              TextStyle(color: index == 0 ? neonShade : null),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            adjustHieght(khieght * .06),
            BlocBuilder<QrBloc, QrState>(builder: (context, state) {
              if (state.isLoading) {
                return const LoadingAnimation();
              } else if (state.qrList.isEmpty) {
                return SizedBox(
                  width: 250.dm,
                  height: 250.dm,
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                  ),
                );
              } else {
                return const SizedBox();
              }
            }),
            adjustHieght(khieght * .09),
            BlocBuilder<QrBloc, QrState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return const LoadingAnimation();
                } else if (state.qrList.isEmpty) {
                  return GestureDetector(
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
                            Icons.keyboard_arrow_down_rounded,
                            color: kwhite,
                            size: 30,
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
            const Spacer(),
            AuthButton(
              text: 'Share',
              onTap: () {},
              wdth: 110,
            ),
            adjustHieght(khieght * .04),
          ],
        ),
      ),
    );
  }
}
