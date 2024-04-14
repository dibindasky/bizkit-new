import 'dart:convert';

import 'package:bizkit/application/business_logic/card/card/card_bloc.dart';
import 'package:bizkit/application/business_logic/card_second/card_second_bloc.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/constants/contants.dart';
import 'package:bizkit/application/presentation/utils/dailog.dart';
import 'package:bizkit/application/presentation/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/application/presentation/utils/shimmier/shimmer.dart';
import 'package:bizkit/application/presentation/utils/snackbar/snackbar.dart';
import 'package:bizkit/application/presentation/widgets/refresh_indicator.dart';
import 'package:bizkit/domain/model/card/cards_in_profile/card_action_rewuest_model/card_action_rewuest_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeletedCards extends StatefulWidget {
  const DeletedCards({super.key});

  @override
  State<DeletedCards> createState() => _DeletedCardsState();
}

class _DeletedCardsState extends State<DeletedCards> {
  late ScrollController firstCardscrollController = ScrollController();
  late ScrollController secondcardscrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    firstCardscrollController.addListener(() {
      if (firstCardscrollController.position.pixels ==
          firstCardscrollController.position.maxScrollExtent) {
        context.read<CardBloc>().add(const CardEvent.getdeleteCardsEvent());
      }
    });
    secondcardscrollController.addListener(() {
      if (secondcardscrollController.position.pixels ==
          secondcardscrollController.position.maxScrollExtent) {
        context
            .read<CardSecondBloc>()
            .add(const CardSecondEvent.getDeleteCardSecondEvent());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: kwhite,
          ),
        ),
        backgroundColor: knill,
        title: Text(
          'Deleted cards',
          style: textHeadStyle1,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              BlocConsumer<CardBloc, CardState>(
                listener: (context, state) {
                  if (state.deleteCardRestored) {
                    showSnackbar(
                      context,
                      message: 'Card restored',
                    );
                  }
                },
                builder: (context, state) {
                  if (state.deleteCardLoading) {
                    return SizedBox(
                      height: khieght * .4,
                      child: ShimmerLoader(
                        itemCount: 10,
                        height: 240,
                        scrollDirection: Axis.horizontal,
                        width: kwidth * 0.9,
                        seprator: const SizedBox(width: 10),
                      ),
                    );
                  } else if (state.deletedCards == null) {
                    return RefreshIndicatorCustom(
                      message: errorMessage,
                      onRefresh: () => context
                          .read<CardBloc>()
                          .add(const CardEvent.getdeleteCards(isLoad: true)),
                    );
                  } else if (state.deletedCards!.isEmpty) {
                    return SizedBox(
                      height: khieght * .4,
                      child: const Center(
                        child: Text("You doesn't have Deleted cards"),
                      ),
                    );
                  }
                  return SizedBox(
                    height: khieght * .4,
                    child: ListView.separated(
                      controller: firstCardscrollController,
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: (state.deletedCards?.length ?? 0) +
                          (state.deleteCardEventLoading ? 1 : 0),
                      separatorBuilder: (context, index) =>
                          adjustWidth(kwidth * .05),
                      itemBuilder: (context, index) {
                        if (state.deleteCardEventLoading &&
                            index == state.deletedCards!.length) {
                          return const LoadingAnimation();
                        }
                        final card = state.deletedCards![index];
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
                                    height: 240,
                                    child: InkWell(
                                      onTap: () {},
                                      child: ClipRRect(
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(25),
                                            topRight: Radius.circular(20),
                                          ),
                                          child: state.deletedCards != null &&
                                                  state.deletedCards![index]
                                                          .logo !=
                                                      null
                                              ? Image.network(
                                                  card.logo!,
                                                  fit: BoxFit.cover,
                                                )
                                              : Image.network(imageDummyNetwork,
                                                  fit: BoxFit.cover)),
                                    ),
                                  ),
                                ],
                              ),
                              adjustHieght(khieght * .02),
                              Row(
                                children: [
                                  adjustWidth(kwidth * .02),
                                  Text(
                                    '${state.deletedCards![index].name ?? ''}\n${state.deletedCards![index].designation ?? ''}',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const Spacer(),
                                  InkWell(
                                    onTap: () {
                                      showConfirmationDialog(
                                        actionButton: 'Restore',
                                        heading: 'Restore Deleted cards',
                                        context,
                                        onPressed: () {
                                          CardActionRequestModel
                                              cardActionRewuestModel =
                                              CardActionRequestModel(
                                            isArchived: state
                                                .deletedCards![index]
                                                .isArchived,
                                            isActive: true,
                                          );
                                          context.read<CardBloc>().add(
                                                CardEvent.restoreDeletedCard(
                                                  cardActionRequestModel:
                                                      cardActionRewuestModel,
                                                  cardId: state
                                                      .deletedCards![index].id!,
                                                ),
                                              );
                                        },
                                      );
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: kblue,
                                      ),
                                      width: 100,
                                      height: 30,
                                      child: Center(
                                        child:
                                            Text('Restore', style: textStyle1),
                                      ),
                                    ),
                                  ),
                                  adjustWidth(kwidth * .02)
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
              ),
              adjustHieght(khieght * .02),
              BlocConsumer<CardSecondBloc, CardSecondState>(
                listener: (context, state) {
                  if (state.message != null && state.seondCardRestored) {
                    showSnackbar(
                      context,
                      message: state.message!,
                    );
                  }
                },
                builder: (context, state) {
                  if (state.deleteSecondCardLoading) {
                    return SizedBox(
                      height: khieght * .4,
                      child: ShimmerLoader(
                        itemCount: 10,
                        height: 240,
                        scrollDirection: Axis.horizontal,
                        width: kwidth * 0.9,
                        seprator: const SizedBox(height: 10),
                      ),
                    );
                  } else if (state.deleteSecondCards == null) {
                    return RefreshIndicatorCustom(
                      message: errorMessage,
                      onRefresh: () => context.read<CardSecondBloc>().add(
                          const CardSecondEvent.getDeleteCardSecondEvent()),
                    );
                  } else if (state.deleteSecondCards!.isEmpty) {
                    return SizedBox(
                      height: khieght * .4,
                      child: const Center(
                        child: Text("You doesn't have Selfie deeleted cards"),
                      ),
                    );
                  }
                  return SizedBox(
                    height: khieght * .4,
                    child: ListView.separated(
                      controller: secondcardscrollController,
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: (state.deleteSecondCards?.length ?? 0) +
                          (state.deleteSecondCardEventLoading ? 1 : 0),
                      separatorBuilder: (context, index) =>
                          adjustWidth(kwidth * .05),
                      itemBuilder: (context, index) {
                        if (state.deleteSecondCardEventLoading &&
                            index == state.deleteSecondCards!.length) {
                          return const LoadingAnimation();
                        }
                        final card = state.deleteSecondCards![index];
                        String base64String = card.image!;

                        base64String = base64String.replaceFirst(
                            RegExp(r'data:image/jpg;base64,'), '');

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
                                    height: 240,
                                    child: InkWell(
                                      onTap: () {},
                                      child: ClipRRect(
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(25),
                                            topRight: Radius.circular(20),
                                          ),
                                          child: state.deleteSecondCards !=
                                                      null &&
                                                  state
                                                          .deleteSecondCards![
                                                              index]
                                                          .image !=
                                                      null
                                              ? Image.memory(
                                                  base64.decode(base64String),
                                                  fit: BoxFit.cover,
                                                  errorBuilder: (context, error,
                                                      stackTrace) {
                                                    return const Icon(
                                                        Icons.error);
                                                  },
                                                )
                                              : Image.network(imageDummyNetwork,
                                                  fit: BoxFit.cover)),
                                    ),
                                  ),
                                ],
                              ),
                              adjustHieght(khieght * .02),
                              Row(
                                children: [
                                  adjustWidth(kwidth * .02),
                                  Text(
                                    '${card.name ?? ''}\n${card.designation}',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const Spacer(),
                                  InkWell(
                                    onTap: () {
                                      showConfirmationDialog(
                                        actionButton: 'Restore',
                                        heading: 'Restore Deleted cards',
                                        context,
                                        onPressed: () {
                                          CardActionRequestModel
                                              cardActionRewuestModel =
                                              CardActionRequestModel(
                                                  isActive: true);
                                          context.read<CardSecondBloc>().add(
                                                CardSecondEvent
                                                    .restoreDeleteCardSecond(
                                                  id: card.id!,
                                                  cardActionRewuestModel:
                                                      cardActionRewuestModel,
                                                ),
                                              );
                                        },
                                      );
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: kblue,
                                      ),
                                      width: 100,
                                      height: 30,
                                      child: Center(
                                        child:
                                            Text('Restore', style: textStyle1),
                                      ),
                                    ),
                                  ),
                                  adjustWidth(kwidth * .02)
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
    );
  }
}
