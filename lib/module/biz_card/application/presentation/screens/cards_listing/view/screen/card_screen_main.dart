// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';

import 'package:bizkit/core/routes/fade_transition/fade_transition.dart';
import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/biz_card/application/controller/card/create_controller.dart';
import 'package:bizkit/module/biz_card/application/controller/visiting_card/visiting_card_controller.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_detail_view/second_card_detail_view.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/cards_listing/view/widgets/custom_bottom_sheet.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/cards_listing/view/screen/archieved_cards.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/cards_listing/view/screen/deleted_cards.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/card_archive_model/card_archive_model.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/card_delete_model/card_delete_model.dart';
import 'package:bizkit/module/biz_card/domain/model/visiting_cards/visiting_card_delete_model/visiting_card_delete_model.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/utils/dailog.dart';
import 'package:bizkit/utils/shimmier/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

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
    final visitingCardController = Get.find<VisitingCardController>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      cardController.getAllcards(true);
      visitingCardController.fetchAllVisitingCards();
    });
    return Scaffold(
      appBar: AppBar(
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
                  adjustHieght(khieght * .05),
                  SizedBox(
                    height: 310.h,
                    child: GetBuilder<CardController>(
                      builder: (controller) {
                        if (controller.isLoading.value) {
                          return SizedBox(
                            height: 310.h,
                            child: ShimmerLoader(
                              height: 310.h,
                              seprator: kWidth10,
                              scrollDirection: Axis.horizontal,
                              itemCount: cardController.bizcards.length,
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
                                  color: textFieldFillColr,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                width: 300,
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        SizedBox(
                                          width: 300,
                                          height: 200,
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
                                                  topLeft: Radius.circular(25),
                                                  topRight: Radius.circular(20),
                                                ),
                                                child: Image.asset(
                                                  imageBackgroundCard,
                                                  fit: BoxFit.cover,
                                                )),
                                          ),
                                        ),
                                        controller.bizcards[index].isDefault ==
                                                true
                                            ? Positioned(
                                                right: 10,
                                                bottom: 0,
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
                                    adjustHieght(khieght * .02),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            // 'Name\n Designation',
                                            '${controller.bizcards[index].companyName} \n ${controller.bizcards[index].designation}',
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            // if (state.cards[index].cardLink != null) {
                                            //   print(
                                            //       'Checkout my Bizkit card ${state.cards[index].cardLink ?? ''}');
                                            //   Share.share(
                                            //       'Checkout my Bizkit card ${state.cards[index].cardLink ?? ''}');
                                            // } else {
                                            //   Fluttertoast.showToast(
                                            //       msg: "can't share card");
                                            // }
                                          },
                                          //  bottomSheet(context, card),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
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
                                    adjustHieght(khieght * .02),
                                    Row(
                                      children: [
                                        adjustWidth(kwidth * .02),
                                        Expanded(
                                          child: InkWell(
                                            onTap: () {
                                              // if (state.cards[index].views != null &&
                                              //     state.cards[index].views! > 0) {
                                              //   // context.read<CardBloc>().add(
                                              //   //     CardEvent.getCardViews(
                                              //   //         id: card.id!));

                                              // }
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
                                            },
                                            child: Container(
                                              height: 50,
                                              decoration: BoxDecoration(
                                                border:
                                                    Border.all(color: kwhite),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  adjustWidth(kwidth * .01),
                                                  const Icon(
                                                    Icons.remove_red_eye,
                                                    size: 19,
                                                    color: kwhite,
                                                  ),
                                                  adjustWidth(kwidth * .01),
                                                  const Text('3'),
                                                  adjustWidth(kwidth * .01),
                                                  const Expanded(
                                                    child: Text('Views',
                                                        overflow: TextOverflow
                                                            .ellipsis),
                                                  ),
                                                  adjustWidth(kwidth * .01),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        adjustWidth(kwidth * .04),
                                        Expanded(
                                          child: Container(
                                            height: 50,
                                            decoration: BoxDecoration(
                                              border: Border.all(color: kwhite),
                                            ),
                                            child: Row(
                                              children: [
                                                adjustWidth(kwidth * .01),
                                                const Icon(
                                                  Icons.share,
                                                  color: kwhite,
                                                  size: 19,
                                                ),
                                                adjustWidth(kwidth * .01),
                                                const Text('3'),
                                                adjustWidth(kwidth * .01),
                                                const Expanded(
                                                  child: Text('Share',
                                                      overflow: TextOverflow
                                                          .ellipsis),
                                                ),
                                                adjustWidth(kwidth * .01),
                                              ],
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
                            itemCount:
                                visitingCardController.visitingCards.length,
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
                            // (state.secondCards.length) +
                            //     (state.secondCardEventLoading ? 1 : 0),
                            separatorBuilder: (context, index) =>
                                adjustWidth(kwidth * .05),
                            itemBuilder: (context, index) {
                              // if (state.secondCardEventLoading &&
                              //     index == state.secondCards.length) {
                              //   return const LoadingAnimation();
                              // }
                              //final secondCard = state.secondCards[index];
                              // String imageBase64 = '';
                              // if (secondCard.image != null &&
                              //     secondCard.image!.isNotEmpty) {
                              //   imageBase64 = secondCard.image!;
                              //   imageBase64 = imageBase64.startsWith('data')
                              //       ? imageBase64.substring(22)
                              //       : imageBase64;
                              // } else if (secondCard.selfie != null &&
                              //     secondCard.selfie!.isNotEmpty) {
                              //   final imageList =
                              //       secondCard.selfie!.map((e) => e.selfie).toList();
                              //   imageBase64 = imageList.first ?? '';
                              //   imageBase64 = imageBase64.startsWith('data')
                              //       ? imageBase64.substring(22)
                              //       : imageBase64;
                              // } else {
                              //   imageBase64 = '';
                              // }
                              // String secondName = secondCard.company != null &&
                              //         secondCard.company != ''
                              //     ? secondCard.company!
                              //     : secondCard.designation != null &&
                              //             secondCard.designation != ''
                              //         ? secondCard.designation!
                              //         : '';
                              // print(secondName);
                              return Container(
                                decoration: BoxDecoration(
                                  color: textFieldFillColr,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                width: 300,
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        SizedBox(
                                          width: 300,
                                          height: 170,
                                          child: InkWell(
                                            onTap: () {
                                              // log('Visitnig Card Id ==== >${visitingCardController.visitingCards[index].id} ');
                                              visitingCardController
                                                  .fetchVisitingCardDetails(
                                                      visitingCardId:
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
                                                topLeft: Radius.circular(25),
                                                topRight: Radius.circular(20),
                                              ),
                                              child: Image.memory(
                                                base64Decode(
                                                    visitingCardController
                                                            .visitingCards[
                                                                index]
                                                            .selfie ??
                                                        ''),
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
                                        Positioned(
                                          right: 4,
                                          top: 10,
                                          child: GestureDetector(
                                            onTap: () {
                                              showConfirmationDialog(
                                                  heading:
                                                      'Are you sure you want to delete your card',
                                                  context, onPressed: () {
                                                visitingCardController
                                                    .deleteVisitingCard(
                                                        context: context,
                                                        visitingCardDeleteModel:
                                                            VisitingCardDeleteModel(
                                                          cardId: visitingCardController
                                                                  .visitingCards[
                                                                      index]
                                                                  .id ??
                                                              '',
                                                          isDisabled: true,
                                                        ));
                                              });
                                            },
                                            child: const CircleAvatar(
                                              backgroundColor: neonShade,
                                              child: Padding(
                                                padding: EdgeInsets.all(2.0),
                                                child: CircleAvatar(
                                                  backgroundColor:
                                                      klightDarkGrey,
                                                  child: Icon(
                                                    Icons.delete,
                                                    color: neonShade,
                                                  ),
                                                ),
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
                                            visitingCardController
                                                    .visitingCards[index]
                                                    .name ??
                                                '',
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                        // InkWell(
                                        //   onTap: () async {
                                        //     print(
                                        //         'card share=> ${state.secondCards[index].pdf == null ? 'no data' : 'data'}');
                                        //     await SharePlus.sharePdfFromBase64(
                                        //         state.secondCards[index].pdf ??
                                        //             '',
                                        //         state.secondCards[index].name ??
                                        //             '');
                                        //   },
                                        //   child: Container(
                                        //     decoration: BoxDecoration(
                                        //       borderRadius:
                                        //           BorderRadius.circular(20),
                                        //       color: kblue,
                                        //     ),
                                        //     width: 100,
                                        //     height: 30,
                                        //     child: Center(
                                        //       child: Text('Share',
                                        //           style: textStyle1),
                                        //     ),
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                    adjustHieght(khieght * .02),
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          //final data = state.cardViewList![index].profile;
          return Container(
            margin: const EdgeInsets.only(bottom: 10),
            decoration: const BoxDecoration(
              color: smallBigGrey,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: const ListTile(
              leading: CircleAvatar(
                backgroundColor: kgrey,
                child: Icon(Icons.person),
              ),
              title: Text(
                'Date',
              ),
            ),
          );
        },
      ),
    );
  }
}
