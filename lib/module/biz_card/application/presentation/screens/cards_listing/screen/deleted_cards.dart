import 'dart:convert';

import 'package:bizkit/module/biz_card/application/controller/card/create_controller.dart';
import 'package:bizkit/module/biz_card/application/controller/received_card/received_card_controller.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/card_delete_model/card_delete_model.dart';
import 'package:bizkit/module/biz_card/domain/model/received_cards/visiting_card_delete_model/visiting_card_delete_model.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/show_dialogue/dailog.dart';
import 'package:bizkit/utils/refresh_indicator/refresh_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DeletedCards extends StatefulWidget {
  const DeletedCards({super.key});

  @override
  State<DeletedCards> createState() => _DeletedCardsState();
}

class _DeletedCardsState extends State<DeletedCards>
    with SingleTickerProviderStateMixin {
  late ScrollController firstCardscrollController = ScrollController();
  late ScrollController secondcardscrollController = ScrollController();

  final cardController = Get.find<CardController>();
  Future<void> onRefresh() async {
    cardController.fetchDeletedAndArchivedCards();

    await Future.delayed(const Duration(milliseconds: 500));
  }

  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    firstCardscrollController.addListener(() {
      if (firstCardscrollController.position.pixels ==
          firstCardscrollController.position.maxScrollExtent) {
        //context.read<CardBloc>().add(const CardEvent.getdeleteCardsEvent());
      }
    });
    secondcardscrollController.addListener(() {
      if (secondcardscrollController.position.pixels ==
          secondcardscrollController.position.maxScrollExtent) {
        // context
        //     .read<CardSecondBloc>()
        //     .add(const CardSecondEvent.getDeleteCardSecondEvent());
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
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
          'Deleted Cards',
          style: textHeadStyle1,
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: Stack(
            children: [
              TabBar(
                dividerColor: kblack,
                controller: _tabController,
                indicator: BoxDecoration(
                  color: neonShade,
                  borderRadius: BorderRadius.circular(10),
                ),
                unselectedLabelColor: kwhite,
                labelColor: kwhite,
                indicatorColor: knill,
                tabs: [
                  SizedBox(
                    width: kwidth * 0.5,
                    child: const Tab(text: 'My Cards'),
                  ),
                  SizedBox(
                    width: kwidth * 0.5,
                    child: const Tab(text: 'Received Cards'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: [
          ListView(
            children: [
              SizedBox(
                height: khieght * 0.8,
                child: GetBuilder<CardController>(
                  builder: (controller) {
                    if (controller.isLoading.value) {
                      return const Center(
                          child: CircularProgressIndicator(color: neonShade));
                    } else if (controller.deletedCards.isEmpty) {
                      return SizedBox(
                        height: 400.h,
                        child: ErrorRefreshIndicator(
                          image: emptyNodata2,
                          errorMessage: 'No deleted my cards',
                          onRefresh: () {
                            controller.fetchDeletedAndArchivedCards();
                          },
                        ),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 16),
                        child: ListView.separated(
                          controller: firstCardscrollController,
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: controller.deletedCards.length,
                          separatorBuilder: (context, index) =>
                              adjustHieght(khieght * .03),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {},
                              child: Container(
                                decoration: BoxDecoration(
                                  color: textFieldFillColr,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                width: 360,
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        SizedBox(
                                          // width: 300,
                                          height: khieght * .3,
                                          child: ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(25),
                                                topRight: Radius.circular(20),
                                              ),
                                              child: Image.memory(
                                                base64Decode(controller
                                                        .deletedCards[index]
                                                        .logo ??
                                                    bizcardIconBase64
                                                        .substring(22)),
                                                //card.logo!,
                                                fit: BoxFit.cover,
                                                errorBuilder: (context, error,
                                                    stackTrace) {
                                                  return const Icon(
                                                      Icons.error);
                                                },
                                              )),
                                        ),
                                      ],
                                    ),
                                    adjustHieght(khieght * .02),
                                    Row(
                                      children: [
                                        adjustWidth(kwidth * .02),
                                        Text(
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          controller.deletedCards[index]
                                                  .designation ??
                                              '',
                                          style: textThinStyle1.copyWith(
                                              fontSize: 14.sp),
                                        ),
                                        const Spacer(),
                                        InkWell(
                                          onTap: () {
                                            showConfirmationDialog(
                                              actionButton: 'Restore',
                                              heading: 'Restore Deleted cards',
                                              context,
                                              onPressed: () {
                                                controller.deleteACard(
                                                    context: context,
                                                    cardDelete: CardDeleteModel(
                                                        bizcardId: controller
                                                                .deletedCards[
                                                                    index]
                                                                .bizcardId ??
                                                            '',
                                                        isDisabled: false));
                                              },
                                            );
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
                                              child: Text(
                                                'Restore',
                                                style: textThinStyle1.copyWith(
                                                    fontSize: 14.sp),
                                              ),
                                            ),
                                          ),
                                        ),
                                        adjustWidth(kwidth * .02)
                                      ],
                                    ),
                                    adjustHieght(khieght * .02),
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
            ],
          ),
          ListView(
            children: [
              SizedBox(
                  height: khieght * 0.8,
                  child: GetBuilder<ReceivedCardController>(
                    builder: (controller) {
                      if (controller.isLoading.value) {
                        return const Center(
                            child: CircularProgressIndicator(color: neonShade));
                      } else if (controller.deletedVisitingCards.isEmpty) {
                        return SizedBox(
                          height: 400.h,
                          child: ErrorRefreshIndicator(
                            image: emptyNodata2,
                            errorMessage: 'No deleted recevied cards',
                            onRefresh: () {
                              controller.fetchAllDeletedVisitingCards();
                            },
                          ),
                        );
                      } else {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          child: ListView.separated(
                            controller: firstCardscrollController,
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: controller.deletedVisitingCards.length,
                            separatorBuilder: (context, index) =>
                                adjustHieght(khieght * .03),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {},
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: textFieldFillColr,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  width: 360,
                                  child: Column(
                                    children: [
                                      Stack(
                                        children: [
                                          SizedBox(
                                            // width: 350,
                                            height: khieght * .3,
                                            child: ClipRRect(
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(25),
                                                  topRight: Radius.circular(20),
                                                ),
                                                child: Image.memory(
                                                  //base64Decode(memoryImage),
                                                  base64Decode(controller
                                                          .deletedVisitingCards[
                                                              index]
                                                          .cardImage ??
                                                      bizcardIconBase64
                                                          .substring(22)),
                                                  //card.logo!,
                                                  fit: BoxFit.cover,
                                                  errorBuilder: (context, error,
                                                      stackTrace) {
                                                    return const Icon(
                                                        Icons.error);
                                                  },
                                                )),
                                          ),
                                        ],
                                      ),
                                      adjustHieght(khieght * .02),
                                      Row(
                                        children: [
                                          adjustWidth(kwidth * .02),
                                          Text(
                                            controller
                                                    .deletedVisitingCards[index]
                                                    .designation ??
                                                'Designation',
                                            style: textThinStyle1.copyWith(
                                                fontSize: 14.sp),
                                          ),
                                          const Spacer(),
                                          InkWell(
                                            onTap: () {
                                              showConfirmationDialog(
                                                actionButton: 'Restore',
                                                heading:
                                                    'Restore Deleted cards',
                                                context,
                                                onPressed: () {
                                                  controller.deleteVisitingCard(
                                                      visitingCardDeleteModel:
                                                          VisitingCardDeleteModel(
                                                              cardId: controller
                                                                      .deletedVisitingCards[
                                                                          index]
                                                                      .id ??
                                                                  '',
                                                              isDisabled:
                                                                  false),
                                                      context: context);
                                                },
                                              );
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
                                                child: Text('Restore',
                                                    style:
                                                        textThinStyle1.copyWith(
                                                            fontSize: 14.sp)),
                                              ),
                                            ),
                                          ),
                                          adjustWidth(kwidth * .02)
                                        ],
                                      ),
                                      adjustHieght(khieght * .02),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      }
                    },
                  )),
            ],
          )
        ],
      ),
    );
  }
}
