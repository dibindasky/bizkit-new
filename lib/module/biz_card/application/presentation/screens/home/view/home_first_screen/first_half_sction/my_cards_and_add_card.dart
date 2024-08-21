import 'dart:async';
import 'dart:convert';

import 'package:bizkit/core/routes/fade_transition/fade_transition.dart';
import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/biz_card/application/controller/card/create_controller.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/create_card/view/screens/create_card.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/home/view/home_first_screen/home_first_screen.dart';
import 'package:bizkit/module/biz_card/application/presentation/widgets/show_case_view.dart';
import 'package:bizkit/module/biz_card/domain/modell/cards/get_all_cards/bizcard.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/utils/shimmier/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class MyCardsAndAddCardSection extends StatefulWidget {
  const MyCardsAndAddCardSection({super.key});

  @override
  State<MyCardsAndAddCardSection> createState() =>
      _MyCardsAndAddCardSectionState();
}

class _MyCardsAndAddCardSectionState extends State<MyCardsAndAddCardSection> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cardController = Get.put(CardController());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      cardController.getAllcards(false);
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
              Obx(
                () {
                  if (cardController.isLoading.value) {
                    return ShimmerLoaderTile(height: 125.w, width: 200.w);
                  } else if (cardController.bizcards.isEmpty) {
                    return const Expanded(
                      flex: 2,
                      child: Center(
                        child: Text('No cards'),
                      ),
                    );
                  } else {
                    return CardPageSlider(bizcards: cardController.bizcards);
                  }
                },
              ),
              adjustWidth(kwidth * .03),
              Expanded(
                child: GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    cardFadePageRoute(
                        const ScreenCardCreationStarting(fromHome: true)),
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const CircleAvatar(
                            radius: 16,
                            backgroundImage:
                                AssetImage('asset/images/home add circl.png')),
                        CustomShowCaseView(
                          image: personImage,
                          description: '',
                          tittle: 'Start Creating Business card from here',
                          globalKey: globalKeyAddCard,
                          child: const Text('Add Card'),
                        ),
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

class CardPageSlider extends StatefulWidget {
  const CardPageSlider({super.key, required this.bizcards});
  // final List<CardResponse> cards;
  final List<Bizcard> bizcards;

  @override
  State<CardPageSlider> createState() => _CardPageSliderState();
}

class _CardPageSliderState extends State<CardPageSlider>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;
  late Timer _timer;
  int _currentPageIndex = 0;
  bool forward = true;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPageIndex);
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPageIndex == widget.bizcards.length - 1 ||
          _currentPageIndex == 0) {
        forward = !forward;
      }
      if (forward && _currentPageIndex < widget.bizcards.length - 1) {
        _currentPageIndex++;
      } else if (!forward && _currentPageIndex > 0) {
        _currentPageIndex--;
      }
      _pageController.animateToPage(
        _currentPageIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Bizcard data = widget.bizcards[0];
    return SizedBox(
      height: kwidth * 0.35,
      width: kwidth * 0.55,
      child: PageView.builder(
        onPageChanged: (value) {
          _currentPageIndex = value;
        },
        controller: _pageController,
        itemCount: widget.bizcards.length,
        itemBuilder: (context, index) {
          data = widget.bizcards[index];
          return InkWell(
            onTap: () {
              // final map = data.id != null
              //     ? {'myCard': 'true', 'cardId': data.id.toString()}
              //     : <String, String>{};
              GoRouter.of(context).pushNamed(Routes.cardDetailView);
            },
            child: FittedBox(
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
                  // image: DecorationImage(
                  //     image: MemoryImage(base64Decode(getBase64(
                  //         data.logo == ''
                  //             ? imageTestingBase64
                  //             : data.logo ?? imageTestingBase64))),
                  //     fit: BoxFit.cover)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              data.name != null
                                  ? data.name!.length > 17
                                      ? '${data.name!.substring(0, 15)}..'
                                      : data.name!
                                  : '',
                              style: textHeadStyle1.copyWith(shadows: [
                                const Shadow(
                                  color: kblack,
                                  offset: Offset(1, 2),
                                  blurRadius: 5,
                                )
                              ]),
                            ),
                            Text(
                              data.designation != null
                                  ? data.designation!.length > 17
                                      ? '${data.designation!.substring(0, 15)}..'
                                      : data.designation!
                                  : '',
                              style: TextStyle(
                                fontSize: kwidth * .037,
                                shadows: const [
                                  Shadow(
                                      color: kblack,
                                      offset: Offset(0, 2),
                                      blurRadius: 5)
                                ],
                              ),
                            ),
                            adjustHieght(10),
                            Row(
                              children: [
                                SizedBox(
                                  height: kwidth * 0.10,
                                  width: kwidth * 0.10,
                                  child: data.logo != null && data.logo != ''
                                      ? Image.memory(
                                          base64Decode(
                                              imageTestingBase64.substring(22)),
                                          fit: BoxFit.cover)
                                      : Image.asset(iconBizkitPng,
                                          fit: BoxFit.cover),
                                ),
                                adjustWidth(10),
                                data.isDefault ?? false
                                    ? const ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(3)),
                                        child: ColoredBox(
                                          color: neonShade,
                                          child: Padding(
                                            padding: EdgeInsets.all(4.0),
                                            child: Text('DEFAULT'),
                                          ),
                                        ),
                                      )
                                    : const SizedBox()
                              ],
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            adjustHieght(kwidth * 0.1),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50),
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
                              '${data.completionLevel ?? 100} %',
                              style: textStyle1.copyWith(shadows: [
                                const Shadow(
                                  color: kblack,
                                  offset: Offset(1, 2),
                                  blurRadius: 5,
                                )
                              ]),
                            )
                          ],
                        )
                      ],
                    ),
                    adjustHieght(5),
                    LinearProgressIndicator(
                      value: data.completionLevel == null
                          ? 1
                          : data.completionLevel! / 100,
                      backgroundColor: kgrey,
                      minHeight: 8,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
