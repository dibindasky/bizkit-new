// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:bizkit/application/business_logic/card/card/card_bloc.dart';
import 'package:bizkit/application/business_logic/card_second/card_second_bloc.dart';
import 'package:bizkit/application/presentation/routes/routes.dart';
import 'package:bizkit/application/presentation/screens/card_share/view/widgets/custom_bottom_sheet.dart';
import 'package:bizkit/application/presentation/utils/constants/contants.dart';
import 'package:bizkit/application/presentation/utils/dailog.dart';
import 'package:bizkit/application/presentation/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/application/presentation/utils/shimmier/shimmer.dart';
import 'package:bizkit/application/presentation/utils/snackbar/snackbar.dart';
import 'package:bizkit/data/secure_storage/flutter_secure_storage.dart';
import 'package:bizkit/domain/model/card/cards_in_profile/card_action_rewuest_model/card_action_rewuest_model.dart';
import 'package:bizkit/domain/model/card/get_card_response/card_response.dart'
    as card;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:showcaseview/showcaseview.dart';

class CardShareMainScreen extends StatefulWidget {
  const CardShareMainScreen({super.key});

  @override
  State<CardShareMainScreen> createState() => _CardShareMainScreenState();
}

class _CardShareMainScreenState extends State<CardShareMainScreen>
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
        final showed = await SecureStorage.getHasCard();
        setState(() {
          isShowcaseSeen = showed;
        });
        if (!isShowcaseSeen) {
          ShowCaseWidget.of(context).startShowCase([
            globalKeyBusinessCard,
            globalKeyVisitingCard,
          ]);
          await SecureStorage.setHasCard(hasCard: true);
        }
      });
    });
    super.initState();
    secondCardScrollController.addListener(() {
      if (secondCardScrollController.position.pixels ==
          secondCardScrollController.position.maxScrollExtent) {
        context
            .read<CardSecondBloc>()
            .add(const CardSecondEvent.getCardSecondEvent());
      }
    });
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    animation = Tween<double>(begin: 0, end: 1).animate(animationController);
    animationController.forward();
    context.read<CardBloc>().add(const CardEvent.getCards(call: false));
    context
        .read<CardSecondBloc>()
        .add(const CardSecondEvent.getAllCardsSecond(isLoad: false));
  }

  Future<void> onRefresh() async {
    context.read<CardBloc>().add(const CardEvent.getCards(call: false));
    context
        .read<CardSecondBloc>()
        .add(const CardSecondEvent.getAllCardsSecond(isLoad: false));
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: FadeTransition(
            opacity: animation,
            child: RefreshIndicator(
              onRefresh: onRefresh,
              child: ListView(
                children: [
                  adjustHieght(khieght * .05),
                  BlocBuilder<CardBloc, CardState>(
                    builder: (context, state) {
                      if (state.deleteCardLoading) {
                        return SizedBox(
                          height: khieght * .4,
                          child: const LoadingAnimation(),
                        );
                      } else if (state.cards.isEmpty) {
                        return SizedBox(
                          height: khieght * .4,
                          child: const Center(
                            child: Text(
                              'You have not created any card yet\nCreate your first card now.',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      }
                      return SizedBox(
                        height: 340,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.cards.length,
                          separatorBuilder: (context, index) =>
                              adjustWidth(kwidth * .05),
                          itemBuilder: (context, index) {
                            final card = state.cards[index];
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
                                            final Map<String, String> map =
                                                state.cards[index].id != null
                                                    ? {
                                                        'myCard': 'true',
                                                        'cardId': state
                                                            .cards[index].id!
                                                            .toString()
                                                      }
                                                    : <String, String>{};
                                            GoRouter.of(context).pushNamed(
                                              Routes.cardDetailView,
                                              pathParameters: map,
                                            );
                                          },
                                          child: ClipRRect(
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(25),
                                              topRight: Radius.circular(20),
                                            ),
                                            child: card.logo == null
                                                ? Image.asset(
                                                    imageBackgroundCard,
                                                    fit: BoxFit.cover,
                                                  )
                                                : Image.memory(
                                                    base64.decode(card.logo!),
                                                    fit: BoxFit.cover,
                                                  ),
                                          ),
                                        ),
                                      ),
                                      if (state.cards[index].isDefault!)
                                        const Positioned(
                                          right: 10,
                                          bottom: 0,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(6)),
                                            child: ColoredBox(
                                                color: neonShade,
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 8,
                                                      vertical: 2),
                                                  child: Text('Default'),
                                                )),
                                          ),
                                        ),
                                      if (!state.cards[index].isDefault!)
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
                                              List<PopupMenuEntry<String>>
                                                  items = [];

                                              items.add(
                                                PopupMenuItem(
                                                  onTap: () => context
                                                      .read<CardBloc>()
                                                      .add(CardEvent.setDefault(
                                                          id: card.id!)),
                                                  value: 'Default',
                                                  child: const Text(
                                                      'Set as default'),
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
                                                                isArchived:
                                                                    true);
                                                        context
                                                            .read<CardBloc>()
                                                            .add(CardEvent
                                                                .cardArchive(
                                                              cardActionRequestModel:
                                                                  cardActionRewuestModel,
                                                              id: card.id!,
                                                            ));
                                                      },
                                                    );
                                                  },
                                                  value: 'Archive',
                                                  child: const Text('Archive'),
                                                ),
                                                PopupMenuItem(
                                                  onTap: () =>
                                                      showConfirmationDialog(
                                                    heading:
                                                        'Are you sure you want to delete your card',
                                                    context,
                                                    onPressed: () {
                                                      CardActionRequestModel
                                                          cardActionRewuestModel =
                                                          CardActionRequestModel(
                                                        isActive: false,
                                                      );
                                                      context.read<CardBloc>().add(
                                                          CardEvent.cardDelete(
                                                              cardActionRequestModel:
                                                                  cardActionRewuestModel,
                                                              id: card.id!));
                                                    },
                                                  ),
                                                  value: 'Delete Card',
                                                  child:
                                                      const Text('Delete Card'),
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
                                          '${state.cards[index].name ?? ''}\n${state.cards[index].designation}',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () => bottomSheet(context, card),
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
                                            context.read<CardBloc>().add(
                                                CardEvent.getCardViews(
                                                    id: card.id!));
                                                    
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
                                                Text(
                                                  state.cards[index].views
                                                      .toString(),
                                                ),
                                                adjustWidth(kwidth * .01),
                                                const Expanded(
                                                  child: Text('views',
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
                                              Text(
                                                state.cards[index].share
                                                    .toString(),
                                              ),
                                              adjustWidth(kwidth * .01),
                                              const Expanded(
                                                child: Text('share',
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
                      );
                    },
                  ),
                  adjustHieght(khieght * .03),
                  const Text('Visited cards'),
                  adjustHieght(khieght * .02),
                  BlocConsumer<CardSecondBloc, CardSecondState>(
                    listener: (context, state) {
                      if (state.message != null && state.secondCardDeleted) {
                        return showSnackbar(
                          context,
                          message: state.message!,
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state.secondCardLoading) {
                        return SizedBox(
                          height: khieght * .35,
                          child: ShimmerLoader(
                            itemCount: 10,
                            height: 240,
                            scrollDirection: Axis.horizontal,
                            width: kwidth * 0.9,
                            seprator: const SizedBox(width: 10),
                          ),
                        );
                      } else if (state.secondCards.isEmpty) {
                        return SizedBox(
                          height: khieght * .35,
                          child: const Center(
                            child: Text(
                              'Visiting cards is empty',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      }
                      return SizedBox(
                        height: 290,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: (state.secondCards.length) +
                              (state.secondCardEventLoading ? 1 : 0),
                          separatorBuilder: (context, index) =>
                              adjustWidth(kwidth * .05),
                          itemBuilder: (context, index) {
                            if (state.secondCardEventLoading &&
                                index == state.secondCards.length) {
                              return const LoadingAnimation();
                            }
                            final seconsdCard = state.secondCards[index];
                            String selfirBase64 = '';
                            String scanImageBase64 = '';
                            if (seconsdCard.image != null &&
                                seconsdCard.image!.isNotEmpty) {
                              scanImageBase64 = seconsdCard.image!;
                              scanImageBase64 =
                                  scanImageBase64.startsWith('data')
                                      ? scanImageBase64.substring(22)
                                      : scanImageBase64;
                            }
                            if (seconsdCard.selfie != null &&
                                seconsdCard.image!.isNotEmpty) {
                              selfirBase64 = seconsdCard.selfie!
                                  .map((e) => e.selfie)
                                  .toString();
                              selfirBase64 = selfirBase64.startsWith('data')
                                  ? selfirBase64.substring(22)
                                  : selfirBase64;
                            }
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
                                            Map<String, String> map =
                                                state.secondCards[index].id !=
                                                        null
                                                    ? {
                                                        'cardId': state
                                                            .secondCards[index]
                                                            .id!
                                                            .toString()
                                                      }
                                                    : <String, String>{};
                                            GoRouter.of(context).pushNamed(
                                              Routes.secondcardDetail,
                                              pathParameters: map,
                                            );
                                          },
                                          child: ClipRRect(
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(25),
                                              topRight: Radius.circular(20),
                                            ),
                                            child: seconsdCard.selfie == null ||
                                                    seconsdCard
                                                        .selfie!.isEmpty ||
                                                    seconsdCard.image == null ||
                                                    seconsdCard.image!.isEmpty
                                                ? Image.network(
                                                    imageDummyNetwork,
                                                    fit: BoxFit.cover,
                                                    errorBuilder: (context,
                                                        error, stackTrace) {
                                                      return const Icon(
                                                        Icons
                                                            .image_not_supported_outlined,
                                                      );
                                                    },
                                                  )
                                                : Image.memory(
                                                    base64Decode(
                                                        scanImageBase64),
                                                    fit: BoxFit.cover,
                                                    errorBuilder: (context,
                                                        error, stackTrace) {
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
                                            List<PopupMenuEntry<String>> items =
                                                [
                                              PopupMenuItem(
                                                onTap: () {
                                                  context
                                                      .read<CardSecondBloc>()
                                                      .add(const CardSecondEvent
                                                          .imageClear());
                                                  GoRouter.of(context)
                                                      .pushNamed(
                                                    Routes.cardUpdating,
                                                    extra: state
                                                        .secondCards[index],
                                                  );
                                                },
                                                value: 'Edit Card',
                                                child: const Text('Edit Card'),
                                              ),
                                            ];
                                            items.addAll([
                                              PopupMenuItem(
                                                onTap: () =>
                                                    showConfirmationDialog(
                                                  heading:
                                                      'Are you sure you want to delete your card',
                                                  context,
                                                  onPressed: () {
                                                    CardActionRequestModel
                                                        cardActionRewuestModel =
                                                        CardActionRequestModel(
                                                      isActive: false,
                                                    );
                                                    context
                                                        .read<CardSecondBloc>()
                                                        .add(
                                                          CardSecondEvent
                                                              .deleteCardSecond(
                                                            cardActionRewuestModel:
                                                                cardActionRewuestModel,
                                                            id: seconsdCard.id!,
                                                          ),
                                                        );
                                                  },
                                                ),
                                                value: 'Delete Card',
                                                child:
                                                    const Text('Delete Card'),
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
                                          '${state.secondCards[index].name ?? ''}\n${state.secondCards[index].company}',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          await Share.share(
                                              'https://www.google.com/url?sa=i&url=https%3A%2F%2Fbuffer.com%2Flibrary%2Ffree-images%2F&psig=AOvVaw1vM5f4FvKc0zx1lTJijpeV&ust=1714418095232000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCLCXy57P5YUDFQAAAAAdAAAAABAE');
                                        },
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
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    },
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
      builder: (context) => CustomBottomSheet(
        card: card,
      ),
    );
  }
}

class CardViewsListPopUp extends StatelessWidget {
  const CardViewsListPopUp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: BlocBuilder<CardBloc, CardState>(
        builder: (context, state) {
          if (state.viewsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.cardViewList != null &&
              state.cardViewList!.isNotEmpty) {
            return ListView.builder(
              itemCount: state.cardViewList!.length,
              itemBuilder: (context, index) {
                final data = state.cardViewList![index].profile;
                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: const BoxDecoration(
                    color: smallBigGrey,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: kgrey,
                      child: Icon(Icons.person),
                    ),
                    title: Text(data?.name ?? ''),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: Text('No views'),
            );
          }
        },
      ),
    );
  }
}
