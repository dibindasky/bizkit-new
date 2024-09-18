// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:bizkit/core/model/bizcard_id_parameter_model/bizcard_id_parameter_model.dart';
import 'package:bizkit/core/routes/fade_transition/fade_transition.dart';
import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/biz_card/application/controller/card/create_controller.dart';
import 'package:bizkit/module/biz_card/application/controller/received_card/received_card_controller.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_detail_view/second_card_detail_view.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/cards_listing/widgets/custom_bottom_sheet.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/cards_listing/screen/archieved_cards.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/cards_listing/screen/deleted_cards.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/card_archive_model/card_archive_model.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/card_delete_model/card_delete_model.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/dailog.dart';
import 'package:bizkit/utils/shimmer/shimmer.dart';
import 'package:bizkit/utils/snackbar/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';

class ScreenCardsLists extends StatefulWidget {
  const ScreenCardsLists({super.key});

  @override
  State<ScreenCardsLists> createState() => _ScreenCardsListsState();
}

class _ScreenCardsListsState extends State<ScreenCardsLists>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  late ScrollController secondCardScrollController = ScrollController();
  final GlobalKey globalKeyViews = GlobalKey();
  final GlobalKey globalKeyShare = GlobalKey();
  final GlobalKey globalKeydetailView = GlobalKey();
  final GlobalKey globalKeyBusinessCard = GlobalKey();
  final GlobalKey globalKeyVisitingCard = GlobalKey();
  final GlobalKey globalKey = GlobalKey();
  bool isShowcaseSeen = false;
  final homeScreenShowCase = 'isShowseenCArdListing';

  @override
  void initState() {
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   SharedPreferences.getInstance().then((prefs) async {
    //     const showed = false;
    //     setState(() {
    //       isShowcaseSeen = showed;
    //     });
    //     if (!isShowcaseSeen) {
    //       ShowCaseWidget.of(context).startShowCase([
    //         globalKeyBusinessCard,
    //         globalKeyVisitingCard,
    //       ]);
    //       // await SecureStorage.setHasCard(hasCard: true);
    //     }
    //   });
    // });
    super.initState();
    secondCardScrollController.addListener(() {
      if (secondCardScrollController.position.pixels ==
          secondCardScrollController.position.maxScrollExtent) {
        // context
        //     .read<CardSecondBloc>()
        //     .add(const CardSecondEvent.getCardSecondEvent());
      }
    });
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    animation = Tween<double>(begin: 0, end: 1).animate(animationController);
    animationController.forward();
    // context.read<CardBloc>().add(const CardEvent.getCards(call: false));
    // context
    //     .read<CardSecondBloc>()
    //     .add(const CardSecondEvent.getAllCardsSecond(isLoad: false));
  }

  Future<void> onRefresh() async {
    final cardController = Get.find<CardController>();
    final visitingCardController = Get.find<ReceivedCardController>();
    cardController.getAllcards(true);
    visitingCardController.fetchAllreceivedCards();
    // context.read<CardBloc>().add(const CardEvent.getCards(call: true));
    // context
    //     .read<CardSecondBloc>()
    //     .add(const CardSecondEvent.getAllCardsSecond(isLoad: true));
    await Future.delayed(const Duration(milliseconds: 500));
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cardController = Get.find<CardController>();
    final visitingCardController = Get.find<ReceivedCardController>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      cardController.getAllcards(true);
      visitingCardController.fetchAllreceivedCards();
    });
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: knill,
        actions: [
          IconButton(
              onPressed: () {
                cardController.fetchDeletedAndArchivedCards();
                visitingCardController.fetchAllDeletedVisitingCards();
                Navigator.of(context).push(cardFadePageRoute(
                  const DeletedCards(),
                ));
              },
              icon: const Icon(Icons.delete)),
          kWidth10,
          IconButton(
              onPressed: () {
                cardController.fetchDeletedAndArchivedCards();
                Navigator.of(context)
                    .push(cardFadePageRoute(const ArchivedCards()));
              },
              icon: const Icon(Icons.archive)),
          kWidth20
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: FadeTransition(
            opacity: animation,
            child: RefreshIndicator(
              onRefresh: () => onRefresh(),
              child: ListView(
                shrinkWrap: true,
                children: [
                  adjustHieght(khieght * .02),
                  SizedBox(
                    height: 310.h,
                    child: GetBuilder<CardController>(
                      builder: (controller) {
                        if (controller.isLoading.value) {
                          return SizedBox(
                            height: 200.h,
                            child: ShimmerLoader(
                              height: 200.h,
                              seprator: kWidth10,
                              scrollDirection: Axis.horizontal,
                              itemCount: cardController.bizcards.isEmpty
                                  ? 5
                                  : cardController.bizcards.length,
                              width: 300.w,
                            ),
                          );
                        } else if (controller.bizcards.isEmpty) {
                          return const Expanded(
                            flex: 2,
                            child: Center(
                              child: Text('No cards'),
                            ),
                          );
                        } else {
                          return ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.bizcards.length,
                            separatorBuilder: (context, index) =>
                                adjustWidth(kwidth * .05),
                            itemBuilder: (context, index) {
                              final data = controller.bizcards[index];
                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius: kBorderRadius10,
                                  border: Border.all(color: neonShade),
                                ),
                                width: 300,
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        SizedBox(
                                          width: 300.w,
                                          height: 200.h,
                                          child: InkWell(
                                            onTap: () {
                                              final map = data.bizcardId != null
                                                  ? {
                                                      'myCard': 'true',
                                                      'cardId': data.bizcardId
                                                          .toString()
                                                    }
                                                  : <String, String>{};
                                              GoRouter.of(context).pushNamed(
                                                  Routes.cardDetailView,
                                                  pathParameters: map);
                                            },
                                            child: ClipRRect(
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  topRight: Radius.circular(10),
                                                ),
                                                child: data.logo != null &&
                                                        data.logo!.isNotEmpty
                                                    ? Image.memory(
                                                        base64Decode(
                                                            data.logo!),
                                                        fit: BoxFit.fill)
                                                    : Image.asset(iconBizkitPng,
                                                        fit: BoxFit.contain)),
                                          ),
                                        ),
                                        controller.bizcards[index].isDefault ==
                                                true
                                            ? Positioned(
                                                right: 10,
                                                bottom: 5,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(6)),
                                                  child: ColoredBox(
                                                      color: neonShade,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal: 8,
                                                                vertical: 2),
                                                        child: Text(
                                                          'Default',
                                                          style: textThinStyle1,
                                                        ),
                                                      )),
                                                ),
                                              )
                                            : kempty,
                                        controller.bizcards[index].isDefault ==
                                                false
                                            ? Positioned(
                                                right: 10,
                                                top: 10,
                                                child: PopupMenuButton<String>(
                                                  icon: const CircleAvatar(
                                                    backgroundColor: neonShade,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(2.0),
                                                      child: CircleAvatar(
                                                        backgroundColor:
                                                            klightDarkGrey,
                                                        child: Icon(
                                                          Icons.more_vert,
                                                          size: 25,
                                                          color: kwhite,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  onSelected: (value) {},
                                                  itemBuilder: (context) {
                                                    List<PopupMenuEntry<String>>
                                                        items = [];
                                                    items.add(
                                                      PopupMenuItem(
                                                        onTap: () {
                                                          showConfirmationDialog(
                                                            actionButton:
                                                                'Default',
                                                            heading:
                                                                'Are you sure you want to set as defult card',
                                                            context,
                                                            onPressed: () {
                                                              controller.setDefaultCard(
                                                                  context:
                                                                      context,
                                                                  cardId: controller
                                                                          .bizcards[
                                                                              index]
                                                                          .bizcardId ??
                                                                      '');
                                                            },
                                                          );
                                                        },
                                                        value: 'Default',
                                                        child: const Text(
                                                            'Set as default'),
                                                      ),
                                                    );
                                                    items.addAll([
                                                      PopupMenuItem(
                                                          onTap: () {
                                                            showConfirmationDialog(
                                                              actionButton:
                                                                  'Archive',
                                                              heading:
                                                                  'Are you sure you want to archive your card',
                                                              context,
                                                              onPressed: () {
                                                                controller
                                                                    .archiveACard(
                                                                        context:
                                                                            context,
                                                                        cardArchive:
                                                                            CardArchiveModel(
                                                                          bizcardId:
                                                                              controller.bizcards[index].bizcardId ?? '',
                                                                          isArchived:
                                                                              true,
                                                                        ));
                                                              },
                                                            );
                                                          },
                                                          value: 'Archive',
                                                          child: const Text(
                                                              'Archive')),
                                                      PopupMenuItem(
                                                          onTap: () =>
                                                              showConfirmationDialog(
                                                                heading:
                                                                    'Are you sure you want to delete your card',
                                                                context,
                                                                onPressed: () {
                                                                  controller
                                                                      .deleteACard(
                                                                          context:
                                                                              context,
                                                                          cardDelete:
                                                                              CardDeleteModel(
                                                                            bizcardId:
                                                                                controller.bizcards[index].bizcardId ?? '',
                                                                            isDisabled:
                                                                                true,
                                                                          ));
                                                                },
                                                              ),
                                                          value: 'Delete Card',
                                                          child: const Text(
                                                              'Delete Card')),
                                                    ]);
                                                    return items;
                                                  },
                                                ),
                                              )
                                            : kempty,
                                      ],
                                    ),
                                    // const Divider(color: neonShade),
                                    kHeight10,
                                    Row(
                                      children: [
                                        Text(
                                          ' ${controller.bizcards[index].companyName} \n ${controller.bizcards[index].designation}',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                    adjustHieght(khieght * .02),
                                    Row(
                                      children: [
                                        adjustWidth(kwidth * .02),
                                        Expanded(
                                          child: InkWell(
                                            onTap: () {
                                              if (cardController
                                                      .bizcards[index].views !=
                                                  0) {
                                                cardController.fetchCardViews(
                                                    bizcardIdParameterModel:
                                                        BizcardIdParameterModel(
                                                            bizcardId: cardController
                                                                    .bizcards[
                                                                        index]
                                                                    .bizcardId ??
                                                                ''));
                                                showModalBottomSheet(
                                                  context: context,
                                                  enableDrag: true,
                                                  isDismissible: true,
                                                  showDragHandle: true,
                                                  backgroundColor: kblack,
                                                  builder: (context) {
                                                    return const CardViewsListPopUp();
                                                  },
                                                );
                                              }
                                            },
                                            child: Container(
                                                height: 30.h,
                                                decoration: BoxDecoration(
                                                  borderRadius: kBorderRadius10,
                                                  border: Border.all(
                                                      color: neonShade),
                                                ),
                                                child: Row(
                                                  children: [
                                                    kWidth10,
                                                    const Icon(
                                                        Icons.remove_red_eye,
                                                        color: kwhite,
                                                        size: 19),
                                                    kWidth10,
                                                    Text(
                                                        '${cardController.bizcards[index].views ?? 0}'),
                                                    kWidth10,
                                                    const Expanded(
                                                      child: Text('Views',
                                                          overflow: TextOverflow
                                                              .ellipsis),
                                                    ),
                                                    kWidth10
                                                  ],
                                                )),
                                          ),
                                        ),
                                        adjustWidth(kwidth * .04),
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () {
                                              final link = cardController
                                                  .bizcards[index]
                                                  .universalLink;
                                              if (link != null &&
                                                  link.isNotEmpty) {
                                                Share.share(
                                                    'Checkout my Bizkit card $link');
                                              } else {
                                                showSnackbar(context,
                                                    message: "Can't share card",
                                                    backgroundColor: kred);
                                              }
                                            },
                                            child: Container(
                                              height: 30.h,
                                              decoration: BoxDecoration(
                                                borderRadius: kBorderRadius10,
                                                border: Border.all(
                                                    color: neonShade),
                                              ),
                                              child: Row(
                                                children: [
                                                  kWidth20,
                                                  const Icon(Icons.share,
                                                      color: kwhite, size: 19),
                                                  kWidth10,
                                                  kWidth5,
                                                  const Expanded(
                                                    child: Text('Share',
                                                        overflow: TextOverflow
                                                            .ellipsis),
                                                  ),
                                                  kWidth10
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        adjustWidth(kwidth * .02),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        }
                      },
                    ),
                  ),
                  adjustHieght(khieght * .03),
                  Obx(
                    () {
                      if (visitingCardController.loadingForVisitingCard.value) {
                        return SizedBox(
                          height: 200.h,
                          child: ShimmerLoader(
                            height: 200.h,
                            seprator: kWidth10,
                            scrollDirection: Axis.horizontal,
                            itemCount: visitingCardController
                                    .visitingCards.isEmpty
                                ? 5
                                : visitingCardController.visitingCards.length,
                            width: 300.w,
                          ),
                        );
                      } else if (visitingCardController.visitingCards.isEmpty) {
                        return const Expanded(
                          flex: 2,
                          child: Center(
                            child: Text('No visiting cards'),
                          ),
                        );
                      } else {
                        return SizedBox(
                          height: 200.h,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                visitingCardController.visitingCards.length,
                            separatorBuilder: (context, index) =>
                                adjustWidth(kwidth * .05),
                            itemBuilder: (context, index) {
                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius: kBorderRadius10,
                                  border: Border.all(color: neonShade),
                                ),
                                width: 300,
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        SizedBox(
                                          width: 300,
                                          height: 165,
                                          child: InkWell(
                                            onTap: () {
                                              visitingCardController
                                                  .fetchReceivedCardDetails(
                                                      receivedCardId:
                                                          visitingCardController
                                                                  .visitingCards[
                                                                      index]
                                                                  .id ??
                                                              '');
                                              Navigator.of(context).push(
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      ScreenCardSecondDetailView(
                                                    visitingCardId:
                                                        visitingCardController
                                                                .visitingCards[
                                                                    index]
                                                                .id ??
                                                            '',
                                                  ),
                                                ),
                                              );
                                            },
                                            child: ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                                topRight: Radius.circular(10),
                                              ),
                                              child: Image.memory(
                                                base64Decode(
                                                  visitingCardController
                                                          .visitingCards[index]
                                                          .cardImage ??
                                                      visitingCardController
                                                          .visitingCards[index]
                                                          .selfie ??
                                                      '',
                                                ),
                                                fit: BoxFit.cover,
                                                errorBuilder: (context, error,
                                                    stackTrace) {
                                                  return const Icon(
                                                    Icons
                                                        .image_not_supported_outlined,
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    adjustHieght(khieght * .02),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            ' ${visitingCardController.visitingCards[index].name ?? ''}',
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () async {
                                            // print(
                                            //     'card share=> ${state.secondCards[index].pdf == null ? 'no data' : 'data'}');
                                            // await SharePlus.sharePdfFromBase64(
                                            //     state.secondCards[index].pdf ??
                                            //         '',
                                            //     state.secondCards[index].name ??
                                            //         '');
                                          },
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                                right: 10),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: kblue,
                                            ),
                                            width: 100,
                                            height: 30,
                                            child: Center(
                                              child: Text('Share',
                                                  style: textStyle1),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    kHeight10
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      }
                    },
                  ),
                  adjustHieght(khieght * .02),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  bottomSheet(BuildContext context) {
    showBottomSheet(
      context: context,
      builder: (context) => const CustomBottomSheet(),
    );
  }
}

class CardViewsListPopUp extends StatelessWidget {
  const CardViewsListPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    final cardController = Get.find<CardController>();
    return Obx(
      () {
        if (cardController.loadingForCardViews.value) {
          return SizedBox(
            height: 350.h,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ShimmerLoader(
                height: 50.h,
                seprator: kHeight10,
                itemCount: cardController.cardViews.isEmpty
                    ? 5
                    : cardController.cardViews.length,
                width: 300.w,
              ),
            ),
          );
        } else if (cardController.cardViews.isEmpty) {
          return const Center(
            child: Text('No views'),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView.builder(
              itemCount: cardController.cardViews.length,
              itemBuilder: (context, index) {
                final data = cardController.cardViews[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: const BoxDecoration(
                    color: smallBigGrey,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: kgrey,
                      child: Image.asset(personDemoImg),
                    ),
                    title: Text(
                      data.name ?? 'name',
                    ),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
