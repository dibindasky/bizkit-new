import 'dart:convert';

import 'package:bizkit/core/model/bizcard_id_parameter_model/bizcard_id_parameter_model.dart';
import 'package:bizkit/core/routes/fade_transition/fade_transition.dart';
import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/biz_card/application/controller/card/create_controller.dart';
import 'package:bizkit/module/biz_card/application/controller/received_card/received_card_controller.dart';
import 'package:bizkit/module/biz_card/application/controller/text_extraction/text_extraction_controller.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens2/card_detail_view/second_card_detail_view.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens2/cards_listing/widgets/custom_bottom_sheet.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens2/cards_listing/screen/archieved_cards.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens2/cards_listing/screen/deleted_cards.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens2/received_cards/received_card_screen.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens2/received_cards/widgets/selected_card_builder.dart';
import 'package:bizkit/module/biz_card/application/presentation/widgets/contacts_list_bottom_share_card.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/card_archive_model/card_archive_model.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/card_delete_model/card_delete_model.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/show_dialogue/dailog.dart';
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
  }

  Future<void> onRefresh() async {
    final cardController = Get.find<CardController>();
    final visitingCardController = Get.find<ReceivedCardController>();
    cardController.getAllcards(true);
    visitingCardController.fetchAllreceivedCards();
    await Future.delayed(const Duration(milliseconds: 500));
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textExtractionController = Get.find<CardTextExtractionController>();
    final receivedCardController = Get.find<ReceivedCardController>();
    final cardController = Get.find<CardController>();
    final visitingCardController = Get.find<ReceivedCardController>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      cardController.getAllcards(true);
      visitingCardController.fetchAllreceivedCards();
    });
    return Scaffold(
      appBar: AppBar(
        title: Text('  Cards', style: textHeadStyle1),
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
                  // biz card
                  SizedBox(
                    height: 280.h,
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
                          return Column(
                            children: [
                              Expanded(child: Image.asset(emptyDataGif)),
                              const Text('No Cards Found')
                            ],
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
                                  borderRadius: kBorderRadius25,
                                  color: textFieldFillColr,
                                  // border: Border.all(color: neonShade),
                                ),
                                width: 300,
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        // image card logo
                                        SizedBox(
                                          width: 300.w,
                                          height: 180.h,
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
                                                  topRight: Radius.circular(25),
                                                ),
                                                child: data.logo != null &&
                                                        data.logo!.isNotEmpty
                                                    ? Image.memory(
                                                        base64Decode(
                                                            data.logo!),
                                                        fit: BoxFit.cover)
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
                                            : Positioned(
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
                                      ],
                                    ),
                                    // card name share and view button
                                    Expanded(
                                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        kHeight5,
                                        Column(
                                        crossAxisAlignment: CrossAxisAlignment.start, 
                                          children: [
                                            Text(
                                              ' ${controller.bizcards[index].companyName} ',
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            
                                            Text(
                                              ' ${controller.bizcards[index].designation}',
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ],
                                        ),
                                        kHeight10,
                                        Row(
                                          children: [
                                            adjustWidth(kwidth * .02),
                                            // views list
                                            Expanded(
                                              child: InkWell(
                                                onTap: () {
                                                  if (cardController
                                                          .bizcards[index]
                                                          .views !=
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
                                                      borderRadius:
                                                          kBorderRadius5,
                                                      border: Border.all(
                                                          color: kwhite),
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        kWidth10,
                                                        const Icon(
                                                            Icons
                                                                .remove_red_eye,
                                                            color: kwhite,
                                                            size: 19),
                                                        kWidth10,
                                                        Text(
                                                            '${cardController.bizcards[index].views ?? 0}'),
                                                        kWidth10,
                                                        const Expanded(
                                                          child: Text('Views',
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis),
                                                        ),
                                                        kWidth10
                                                      ],
                                                    )),
                                              ),
                                            ),
                                            adjustWidth(kwidth * .04),
                                            // share card
                                            Expanded(
                                              child: GestureDetector(
                                                onTap: () {
                                                  showDialog(
                                                    context: context,
                                                    builder: (ctx) => Dialog(
                                                      child: Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              kBorderRadius20,
                                                          border: Border.all(
                                                              color:
                                                                  kneonShade),
                                                        ),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            ListTile(
                                                              onTap: () {
                                                                GoRouter.of(
                                                                        context)
                                                                    .pop();
                                                                showBottomSheet(
                                                                  context: Scaffold.of(
                                                                          context)
                                                                      .context,
                                                                  showDragHandle:
                                                                      true,
                                                                  backgroundColor:
                                                                      kblack,
                                                                  builder: (context) =>
                                                                      ShareCardThroughContactBottomSheet(
                                                                          cardId:
                                                                              data.bizcardId ?? ''),
                                                                );
                                                              },
                                                              title: const Text(
                                                                  'share to Bizkit contacts'),
                                                              leading: const Icon(
                                                                  Icons
                                                                      .phone_forwarded_rounded),
                                                            ),
                                                            const Divider(),
                                                            ListTile(
                                                              onTap: () {
                                                                GoRouter.of(
                                                                        context)
                                                                    .pop();
                                                                if (data.qRLink !=
                                                                    null) {
                                                                  GoRouter.of(
                                                                          context)
                                                                      .pushNamed(
                                                                          Routes
                                                                              .slidablePhotoGallery,
                                                                          extra: {
                                                                        'memory':
                                                                            true,
                                                                        'images':
                                                                            [
                                                                          data.qRLink!
                                                                        ],
                                                                        'initial':
                                                                            0
                                                                      });
                                                                }
                                                              },
                                                              title: const Text(
                                                                  'show QR'),
                                                              leading: const Icon(
                                                                  Icons
                                                                      .qr_code_2_rounded),
                                                            ),
                                                            const Divider(),
                                                            ListTile(
                                                              onTap: () {
                                                                GoRouter.of(
                                                                        context)
                                                                    .pop();
                                                                final link =
                                                                    cardController
                                                                        .bizcards[
                                                                            index]
                                                                        .universalLink;
                                                                if (link !=
                                                                        null &&
                                                                    link.isNotEmpty) {
                                                                  Share.share(
                                                                      'Checkout my Bizkit card $link');
                                                                } else {
                                                                  showSnackbar(
                                                                      context,
                                                                      message:
                                                                          "Something went wrong please try again",
                                                                      backgroundColor:
                                                                          kred);
                                                                }
                                                              },
                                                              title: const Text(
                                                                  'share'),
                                                              leading: const Icon(
                                                                  Icons.share),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                                child: Container(
                                                  height: 30.h,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        kBorderRadius5,
                                                    border: Border.all(
                                                        color: kwhite),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      kWidth20,
                                                      const Icon(Icons.share,
                                                          color: kwhite,
                                                          size: 19),
                                                      kWidth10,
                                                      kWidth5,
                                                      const Expanded(
                                                        child: Text('Share',
                                                            overflow:
                                                                TextOverflow
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
                                    ))
                                  ],
                                ),
                              );
                            },
                          );
                        }
                      },
                    ),
                  ),
                  adjustHieght(khieght * .02),
                  // visiting card
                  Text('Received Cards', style: textHeadStyle1),
                  adjustHieght(khieght * .01),
                  SizedBox(
                    height: 200.h,
                    child: Obx(
                      () {
                        if (visitingCardController
                            .loadingForVisitingCard.value) {
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
                        } else if (visitingCardController
                            .visitingCards.isEmpty) {
                          return kempty;
                        } else {
                          return SizedBox(
                            height: 200.h,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  visitingCardController.visitingCards.length +
                                      1,
                              separatorBuilder: (context, index) =>
                                  adjustWidth(kwidth * .05),
                              itemBuilder: (context, index) {
                                if (index ==
                                    visitingCardController
                                        .visitingCards.length) {
                                  return Container(
                                      decoration: BoxDecoration(
                                        borderRadius: kBorderRadius10,
                                        border: Border.all(color: neonShade),
                                      ),
                                      width: 300,
                                      height: 165,
                                      child: Column(
                                        children: [
                                          
                                          ContainerPickImage(
                                            iscardList: false, 
                                            onPressedCam: () {
                                              textExtractionController
                                                  .pickedImageUrl
                                                  .clear();
                                              Navigator.of(context).push(
                                                  cardFadePageRoute(
                                                      const SelectedCard()));
                                              textExtractionController
                                                  .pickImageScanning(
                                                      camera: true);
                                            },
                                            onPressedGallery: () {
                                              textExtractionController
                                                  .pickedImageUrl
                                                  .clear();
                                              Navigator.of(context).push(
                                                  cardFadePageRoute(
                                                      const SelectedCard()));
                                              textExtractionController
                                                  .pickImageScanning(
                                                      camera: false);
                                            },
                                          ),
                                          adjustHieght(20),
                                          TextButton(
                                            onPressed: () {
                                              textExtractionController
                                                  .pickedImageUrl
                                                  .clear();
                                              receivedCardController
                                                  .clearAllTextEditingControllers();
                                              GoRouter.of(context).pushNamed(
                                                  Routes.scanedDataFeilds);
                                            },
                                            child: const Text(
                                              'Create card without image',
                                              style: TextStyle(
                                                decorationColor: neonShade,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ));
                                }
                                return InkWell(
                                  onTap: () {
                                    visitingCardController
                                        .fetchReceivedCardDetails(
                                            receivedCardId:
                                                visitingCardController
                                                        .visitingCards[index]
                                                        .id ??
                                                    '');
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ScreenCardSecondDetailView(
                                          visitingCardId: visitingCardController
                                                  .visitingCards[index].id ??
                                              '',
                                        ),
                                      ),
                                    );
                                  },
                                  child: Container(
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
                                              child: ClipRRect(
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  topRight: Radius.circular(10),
                                                ),
                                                child: Image.memory(
                                                  base64Decode(
                                                    visitingCardController
                                                            .visitingCards[
                                                                index]
                                                            .cardImage ??
                                                        visitingCardController
                                                            .visitingCards[
                                                                index]
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
                                          ],
                                        ),
                                        adjustHieght(khieght * .02),
                                        Text(
                                            ' ${visitingCardController.visitingCards[index].name ?? ''}',
                                            overflow: TextOverflow.ellipsis,
                                            style: textHeadStyle1),
                                        Text(
                                          ' ${visitingCardController.visitingCards[index].company ?? ''}',
                                          overflow: TextOverflow.ellipsis,
                                          style: textStyle1,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        }
                      },
                    ),
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
