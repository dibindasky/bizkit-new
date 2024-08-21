// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:bizkit/core/routes/fade_transition/fade_transition.dart';
import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/biz_card/application/business_logic/card/card/card_bloc.dart';
import 'package:bizkit/module/biz_card/application/business_logic/card_second/card_second_bloc.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/cards_listing/view/widgets/custom_bottom_sheet.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/profile_screen/view/screen/data_management/inner_screens/archieved_cards.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/profile_screen/view/screen/data_management/inner_screens/deleted_cards.dart';
import 'package:bizkit/service/secure_storage/flutter_secure_storage.dart';
import 'package:bizkit/module/biz_card/domain/model/card/cards_in_profile/card_action_rewuest_model/card_action_rewuest_model.dart';
import 'package:bizkit/module/biz_card/domain/model/card/get_card_response/card_response.dart'
    as card;
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/utils/dailog.dart';
import 'package:bizkit/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/utils/shimmier/shimmer.dart';
import 'package:bizkit/utils/snackbar/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:showcaseview/showcaseview.dart';

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
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      SharedPreferences.getInstance().then((prefs) async {
        final showed = false;
        setState(() {
          isShowcaseSeen = showed;
        });
        if (!isShowcaseSeen) {
          ShowCaseWidget.of(context).startShowCase([
            globalKeyBusinessCard,
            globalKeyVisitingCard,
          ]);
          // await SecureStorage.setHasCard(hasCard: true);
        }
      });
    });
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: knill,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(cardFadePageRoute(
                  const DeletedCards(),
                ));
              },
              icon: const Icon(Icons.delete)),
          kWidth10,
          IconButton(
              onPressed: () {
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
                children: [
                  adjustHieght(khieght * .05),
                  SizedBox(
                    height: 340.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 2,
                      separatorBuilder: (context, index) =>
                          adjustWidth(kwidth * .05),
                      itemBuilder: (context, index) {
                        // final card = state.cards[index];
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
                                        // final Map<String, String> map =
                                        //     state.cards[index].id != null
                                        //         ? {
                                        //             'myCard': 'true',
                                        //             'cardId': state
                                        //                 .cards[index].id!
                                        //                 .toString()
                                        //           }
                                        //         : <String, String>{};
                                        GoRouter.of(context).pushNamed(
                                          Routes.cardDetailView,
                                          // pathParameters: map,
                                        );
                                      },
                                      child: ClipRRect(
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(25),
                                            topRight: Radius.circular(20),
                                          ),
                                          child: Image.asset(
                                            imageBackgroundCard,
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                  ),
                                  const Positioned(
                                    right: 10,
                                    bottom: 0,
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(6)),
                                      child: ColoredBox(
                                          color: neonShade,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 8, vertical: 2),
                                            child: Text('Default'),
                                          )),
                                    ),
                                  ),
                                  Positioned(
                                    right: 10,
                                    top: 10,
                                    child: PopupMenuButton<String>(
                                      icon: const Icon(
                                        Icons.more_vert,
                                        size: 32,
                                        color: kblack,
                                      ),
                                      onSelected: (value) {},
                                      itemBuilder: (context) {
                                        List<PopupMenuEntry<String>> items = [];

                                        items.add(
                                          PopupMenuItem(
                                            onTap: () {
                                              // context
                                              //   .read<CardBloc>()
                                              //   .add(CardEvent.setDefault(
                                              //       id: card.id!));
                                            },
                                            value: 'Default',
                                            child: const Text('Set as default'),
                                          ),
                                        );
                                        items.addAll([
                                          PopupMenuItem(
                                            onTap: () {
                                              showConfirmationDialog(
                                                actionButton: 'Archive',
                                                heading:
                                                    'Are you sure you want to archive your card',
                                                context,
                                                onPressed: () {
                                                  CardActionRequestModel
                                                      cardActionRewuestModel =
                                                      CardActionRequestModel(
                                                          isActive: true,
                                                          isArchived: true);
                                                  // context
                                                  //     .read<CardBloc>()
                                                  //     .add(CardEvent
                                                  //         .cardArchive(
                                                  //       cardActionRequestModel:
                                                  //           cardActionRewuestModel,
                                                  //       id: card.id!,
                                                  //     ));
                                                },
                                              );
                                            },
                                            value: 'Archive',
                                            child: const Text('Archive'),
                                          ),
                                          PopupMenuItem(
                                            onTap: () => showConfirmationDialog(
                                              heading:
                                                  'Are you sure you want to delete your card',
                                              context,
                                              onPressed: () {
                                                CardActionRequestModel
                                                    cardActionRewuestModel =
                                                    CardActionRequestModel(
                                                  isActive: false,
                                                );
                                                // context.read<CardBloc>().add(
                                                //     CardEvent.cardDelete(
                                                //         cardActionRequestModel:
                                                //             cardActionRewuestModel,
                                                //         id: card.id!));
                                              },
                                            ),
                                            value: 'Delete Card',
                                            child: const Text('Delete Card'),
                                          ),
                                        ]);
                                        return items;
                                      },
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
                                      'Name\n Designation',
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
                                        borderRadius: BorderRadius.circular(20),
                                        color: kblue,
                                      ),
                                      width: 100,
                                      height: 30,
                                      child: Center(
                                        child: Text('Share', style: textStyle1),
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
                                          border: Border.all(color: kwhite),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
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
                                                  overflow:
                                                      TextOverflow.ellipsis),
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
                                                overflow:
                                                    TextOverflow.ellipsis),
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
                    ),
                  ),
                  adjustHieght(khieght * .03),
                  adjustHieght(khieght * .02),
                  SizedBox(
                    height: 290,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 2,
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
                                    height: 200,
                                    child: InkWell(
                                      onTap: () {
                                        // Map<String, String> map =
                                        //     state.secondCards[index].id != null
                                        //         ? {
                                        //             'cardId': state
                                        //                 .secondCards[index].id!
                                        //                 .toString()
                                        //           }
                                        //         : <String, String>{};
                                        GoRouter.of(context).pushNamed(
                                          Routes.secondcardDetail,
                                          //pathParameters: map,
                                        );
                                      },
                                      child: ClipRRect(
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(25),
                                            topRight: Radius.circular(20),
                                          ),
                                          child: Image.network(
                                            imageDummyNetwork,
                                            fit: BoxFit.cover,
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return const Icon(
                                                Icons
                                                    .image_not_supported_outlined,
                                              );
                                            },
                                          )
                                          // : Image.memory(
                                          //     base64Decode(imageBase64),
                                          //     fit: BoxFit.cover,
                                          //     errorBuilder: (context, error,
                                          //         stackTrace) {
                                          //       return const Icon(
                                          //         Icons
                                          //             .image_not_supported_outlined,
                                          //       );
                                          //     },
                                          //   ),
                                          ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 0,
                                    top: 10,
                                    child: PopupMenuButton<String>(
                                      padding: const EdgeInsets.all(0),
                                      icon: const Icon(
                                        Icons.more_vert,
                                        size: 32,
                                        color: kblack,
                                      ),
                                      itemBuilder: (context) {
                                        List<PopupMenuEntry<String>> items = [
                                          PopupMenuItem(
                                            onTap: () {
                                              context
                                                  .read<CardSecondBloc>()
                                                  .add(const CardSecondEvent
                                                      .imageClear());
                                              GoRouter.of(context).pushNamed(
                                                Routes.cardUpdating,
                                                //extra: state.secondCards[index],
                                              );
                                            },
                                            value: 'Edit Card',
                                            child: const Text('Edit Card'),
                                          ),
                                        ];
                                        items.addAll([
                                          PopupMenuItem(
                                            onTap: () => showConfirmationDialog(
                                              heading:
                                                  'Are you sure you want to delete your card',
                                              context,
                                              onPressed: () {
                                                // CardActionRequestModel
                                                //     cardActionRewuestModel =
                                                //     CardActionRequestModel(
                                                //   isActive: false,
                                                // );
                                                // context
                                                //     .read<CardSecondBloc>()
                                                //     .add(
                                                //       CardSecondEvent
                                                //           .deleteCardSecond(
                                                //         cardActionRewuestModel:
                                                //             cardActionRewuestModel,
                                                //         id: secondCard.id!,
                                                //       ),
                                                //     );
                                              },
                                            ),
                                            value: 'Delete Card',
                                            child: const Text('Delete Card'),
                                          ),
                                        ]);
                                        return items;
                                      },
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
                                      'Name',
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
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  bottomSheet(BuildContext context, card.CardResponse card) {
    showBottomSheet(
      context: context,
      builder: (context) => CustomBottomSheet(card: card),
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
