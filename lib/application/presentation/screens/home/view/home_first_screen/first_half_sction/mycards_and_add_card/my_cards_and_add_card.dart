import 'package:bizkit/application/business_logic/card/card/card_bloc.dart';
import 'package:bizkit/application/presentation/fade_transition/fade_transition.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/screens/create_business_card.dart';
import 'package:bizkit/application/presentation/screens/home/view/home_first_screen/first_half_sction/my_connections/my_connection_detail_first_half/my_connection_detail_first_half.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/constants/contants.dart';
import 'package:bizkit/application/presentation/utils/loading_indicator/loading_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCardsAndAddCardSection extends StatelessWidget {
  const MyCardsAndAddCardSection({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CardBloc>().add(const CardEvent.getCards());
    });
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('My Cards', style: textHeadStyle1),
          adjustHieght(khieght * .02),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BlocBuilder<CardBloc, CardState>(
                builder: (context, state) {
                  if (state.isLoading) {
                    return SizedBox(
                        height: kwidth * 0.35,
                        width: kwidth * 0.55,
                        child: const LoadingAnimation());
                  } else if (state.defaultCard == null) {
                    return SizedBox(
                        height: kwidth * 0.35,
                        width: kwidth * 0.55,
                        child: const Center(
                            child: Text('Create Your BizKit Card')));
                  } else {
                    final data = state.defaultCard!;
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            fadePageRoute(HomeFirstViewAllContactTileDetailView(
                                cardId: data.id)));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        height: kwidth * 0.35,
                        width: kwidth * 0.55,
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: neonShade,
                            ),
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                                image: NetworkImage(
                                    data.photo ?? imageDummyNetwork),
                                fit: BoxFit.cover)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Name',
                                    style: textHeadStyle1.copyWith(shadows: [
                                      const Shadow(
                                          color: kblack,
                                          offset: Offset(1, 2),
                                          blurRadius: 5)
                                    ])),
                                Text(
                                  "Designation",
                                  style: TextStyle(
                                      fontSize: kwidth * .037,
                                      shadows: const [
                                        Shadow(
                                            color: kblack,
                                            offset: Offset(0, 2),
                                            blurRadius: 5)
                                      ]),
                                ),
                                SizedBox(
                                  height: 40.dm,
                                  child: Image.network(
                                      data.logo ?? imageDummyNetwork),
                                ),
                              ],
                            ),
                            const Icon(
                              Icons.arrow_right,
                              color: kwhite,
                            )
                          ],
                        ),
                      ),
                    );
                  }
                },
              ),
              adjustWidth(kwidth * .03),
              Expanded(
                child: GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    fadePageRoute(const StartingBusinessCardCreation()),
                  ),
                  child: Container(
                    height: kwidth * 0.35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: backgroundColour,
                      boxShadow: const [
                        BoxShadow(
                          color: kblack,
                          blurRadius: 2,
                          blurStyle: BlurStyle.outer,
                        )
                      ],
                    ),
                    width: 140,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                          radius: 16,
                          backgroundImage: AssetImage(
                            'asset/images/home add circl.png',
                          ),
                        ),
                        Text('Add Card'),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
