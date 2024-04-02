import 'package:bizkit/application/business_logic/card/card/card_bloc.dart';
import 'package:bizkit/application/presentation/fade_transition/fade_transition.dart';
import 'package:bizkit/application/presentation/routes/routes.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/screens/create_business_card.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/constants/contants.dart';
import 'package:bizkit/application/presentation/utils/shimmier/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                      return SizedBox(
                        height: kwidth * 0.35,
                        width: kwidth * 0.55,
                        child: PageView.builder(
                          itemCount: state.cards.length,
                          itemBuilder: (context, index) {
                            final data = state.cards[index];
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
                                    child: Row(
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
                                                state.defaultCard?.name != null
                                                    ? state.defaultCard!.name!
                                                                .length >
                                                            20
                                                        ? '${state.defaultCard!.name!.substring(0, 18)}..'
                                                        : state
                                                            .defaultCard!.name!
                                                    : '',
                                                style: textHeadStyle1.copyWith(
                                                    shadows: [
                                                      const Shadow(
                                                          color: kblack,
                                                          offset: Offset(1, 2),
                                                          blurRadius: 5)
                                                    ])),
                                            Text(
                                              state.defaultCard?.designation !=
                                                      null
                                                  ? state
                                                              .defaultCard!
                                                              .designation!
                                                              .length >
                                                          20
                                                      ? '${state.defaultCard!.designation!.substring(0, 18)}..'
                                                      : state.defaultCard!
                                                          .designation!
                                                  : '',
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
                                              child: Image.network(data.logo ??
                                                  imageDummyNetwork),
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
                                  data.isDefault ?? false
                                      ? const Positioned(bottom: 5, right: 10,
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
