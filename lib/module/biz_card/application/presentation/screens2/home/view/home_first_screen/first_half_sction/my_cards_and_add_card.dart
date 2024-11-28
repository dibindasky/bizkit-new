import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/biz_card/application/controller/card/create_controller.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/get_all_cards/bizcard.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/shimmer/shimmer.dart';
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
              GetBuilder<CardController>(
                builder: (cardController) {
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
                  onTap: () =>
                      GoRouter.of(context).pushNamed(Routes.cardCreation),
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
                            backgroundImage:
                                AssetImage('asset/images/home add circl.png')),
                        // CustomShowCaseView(
                        //   image: personImage,
                        //   description: '',
                        //   tittle: 'Start Creating Business card from here',
                        //   globalKey: globalKeyAddCard,
                        //   child: const Text('Add Card'),
                        // ),
                        Text('Add Card')
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
    log('Cards length ${widget.bizcards.length}');
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
        duration: const Duration(milliseconds: 1000),
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
    return Expanded(
      flex: 2,
      child: SizedBox(
        height: kwidth * 0.35,
        // width: kwidth * 0.55,
        child: PageView.builder(
          onPageChanged: (value) {
            _currentPageIndex = value;
          },
          controller: _pageController,
          itemCount: widget.bizcards.length,
          itemBuilder: (context, index) {
            Bizcard data = widget.bizcards[index];
            return InkWell(
              onTap: () {
                // log('${data.bizcardId}');
                final map = data.bizcardId != null
                    ? {'myCard': 'true', 'cardId': data.bizcardId.toString()}
                    : <String, String>{};
                GoRouter.of(context)
                    .pushNamed(Routes.cardDetailView, pathParameters: map);
              },
              child: FittedBox(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  // height: kwidth * 0.35,
                  width: kwidth * 0.65,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: neonShade,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        data.name != null ? data.name! : '',
                        style: textHeadStyle1.copyWith(shadows: [
                          const Shadow(
                            color: kblack,
                            offset: Offset(1, 2),
                            blurRadius: 5,
                          )
                        ]),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
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
                                overflow: TextOverflow.ellipsis,
                              ),
                              kHeight10,
                              Row(
                                children: [
                                  SizedBox(
                                    height: kwidth * 0.10,
                                    width: kwidth * 0.10,
                                    child: data.logo != null && data.logo != ''
                                        ? Image.memory(base64Decode(data.logo!),
                                            fit: BoxFit.fill)
                                        : Image.asset(iconBizkitPng,
                                            fit: BoxFit.cover),
                                  ),
                                  kWidth10,
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
                                      : kempty
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
      ),
    );
  }
}
