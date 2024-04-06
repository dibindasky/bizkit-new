import 'dart:convert';

import 'package:bizkit/application/business_logic/card/card/card_bloc.dart';
import 'package:bizkit/application/presentation/fade_transition/fade_transition.dart';
import 'package:bizkit/application/presentation/routes/routes.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/screens/create_business_card.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/constants/contants.dart';
import 'package:bizkit/application/presentation/utils/shimmier/shimmer.dart';
import 'package:bizkit/domain/model/card/get_card_response/card_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MyCardsAndAddCardSection extends StatelessWidget {
  const MyCardsAndAddCardSection({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CardBloc>().add(const CardEvent.getCards(call: false));
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
              Expanded(
                flex: 2,
                child: BlocBuilder<CardBloc, CardState>(
                  builder: (context, state) {
                    if (state.isLoading) {
                      return ShimmerLoader(
                          itemCount: 1,
                          height: kwidth * 0.35,
                          width: kwidth * 0.55);
                    } else if (state.cards.isEmpty) {
                      return SizedBox(
                          height: kwidth * 0.35,
                          width: kwidth * 0.55,
                          child: const Center(
                              child: Text('Create Your BizKit Card')));
                    } else {
                      CardResponse data = state.cards[0];
                      return SizedBox(
                        height: kwidth * 0.35,
                        width: kwidth * 0.55,
                        child: PageView.builder(
                          itemCount: state.cards.length,
                          // onPageChanged: (index) {
                          //   setState(() {
                          //     data = state.cards[index];
                          //   });
                          // },
                          itemBuilder: (context, index) {
                            data = state.cards[index];
                            return InkWell(
                              onTap: () {
                                final map = data.id != null
                                    ? {
                                        'myCard': 'true',
                                        'cardId': data.id!.toString()
                                      }
                                    : <String, String>{};
                                GoRouter.of(context).pushNamed(
                                    Routes.cardDetailView,
                                    pathParameters: map);
                              },
                              child: Stack(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    height: kwidth * 0.35,
                                    width: kwidth * 0.55,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 1,
                                        color: neonShade,
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                      // image: DecorationImage(
                                      //     image: NetworkImage(
                                      //         data.logo ?? imageDummyNetwork),
                                      //     fit: BoxFit.cover)
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text(
                                                    data.name != null
                                                        ? data.name!.length > 20
                                                            ? '${data.name!.substring(0, 18)}..'
                                                            : state.defaultCard!
                                                                .name!
                                                        : '',
                                                    style: textHeadStyle1
                                                        .copyWith(shadows: [
                                                      const Shadow(
                                                          color: kblack,
                                                          offset: Offset(1, 2),
                                                          blurRadius: 5)
                                                    ])),
                                                Text(
                                                  data.designation != null
                                                      ? data.designation!
                                                                  .length >
                                                              20
                                                          ? '${data.designation!.substring(0, 18)}..'
                                                          : data.designation!
                                                      : '',
                                                  style: TextStyle(
                                                      fontSize: kwidth * .037,
                                                      shadows: const [
                                                        Shadow(
                                                            color: kblack,
                                                            offset:
                                                                Offset(0, 2),
                                                            blurRadius: 5)
                                                      ]),
                                                ),
                                                adjustHieght(10),
                                                SizedBox(
                                                  height: kwidth * 0.10,
                                                  width: kwidth * 0.10,
                                                  child: data.logo != null
                                                      ? Image.memory(
                                                          base64.decode(
                                                              data.logo!),
                                                          fit: BoxFit.cover)
                                                      : Image.asset(
                                                          iconBizkitPng,
                                                          fit: BoxFit.cover),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                adjustHieght(kwidth * 0.1),
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                  child: const ColoredBox(
                                                    color: neonShade,
                                                    child: Icon(
                                                      Icons.arrow_right,
                                                      color: kwhite,
                                                    ),
                                                  ),
                                                ),
                                                adjustHieght(kwidth * 0.03),
                                                Text(
                                                  '${data.percentage ?? 100} %',
                                                  style: textStyle1
                                                      .copyWith(shadows: [
                                                    const Shadow(
                                                        color: kblack,
                                                        offset: Offset(1, 2),
                                                        blurRadius: 5)
                                                  ]),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                        adjustHieght(10),
                                        LinearProgressIndicator(
                                          value: data.percentage == null
                                              ? 1
                                              : data.percentage! / 100,
                                          backgroundColor: kgrey,
                                          minHeight: 8,
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                      ],
                                    ),
                                  ),
                                  data.isDefault ?? false
                                      ? const Positioned(
                                          top: 5,
                                          right: 10,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)),
                                            child: ColoredBox(
                                              color: neonShade,
                                              child: Padding(
                                                padding: EdgeInsets.all(4.0),
                                                child: Text('DEFAULT'),
                                              ),
                                            ),
                                          ),
                                        )
                                      : const SizedBox()
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    }
                  },
                ),
              ),
              adjustWidth(kwidth * .03),
              Expanded(
                child: BlocBuilder<CardBloc, CardState>(
                  builder: (context, state) {
                    if (state.businessUser && state.cards.length == 1) {
                      return const SizedBox();
                    }
                    return GestureDetector(
                      onTap: () => Navigator.of(context).push(
                        fadePageRoute(
                            const StartingBusinessCardCreation(fromHome: true)),
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
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
