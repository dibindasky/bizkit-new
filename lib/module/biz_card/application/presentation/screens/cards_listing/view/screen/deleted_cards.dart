import 'dart:convert';

import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/biz_card/application/controller/card/create_controller.dart';
import 'package:bizkit/module/biz_card/domain/modell/cards/card_delete_model/card_delete_model.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/utils/dailog.dart';
import 'package:bizkit/utils/refresh_indicator/refresh_custom.dart';
import 'package:bizkit/utils/shimmier/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DeletedCards extends StatefulWidget {
  const DeletedCards({super.key});

  @override
  State<DeletedCards> createState() => _DeletedCardsState();
}

class _DeletedCardsState extends State<DeletedCards> {
  late ScrollController firstCardscrollController = ScrollController();
  late ScrollController secondcardscrollController = ScrollController();
  final cardController = Get.find<CardController>();
  Future<void> onRefresh() async {
    cardController.fetchDeletedAndArchivedCards();

    await Future.delayed(const Duration(milliseconds: 500));
  }

  @override
  void initState() {
    super.initState();
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
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: RefreshIndicator(
          onRefresh: () => onRefresh(),
          child: ListView(
            children: [
              SizedBox(
                  height: khieght * .4,
                  child: GetBuilder<CardController>(
                    builder: (controller) {
                      if (controller.isLoading.value) {
                        return ShimmerLoader(
                          height: 125.w,
                          width: 200.w,
                          seprator: kHeight10,
                          itemCount: controller.deletedCards.length,
                        );
                      } else if (controller.deletedCards.isEmpty) {
                        return SizedBox(
                          height: 400.h,
                          child: ErrorRefreshIndicator(
                            image: emptyNodata2,
                            errorMessage: 'No deleted cards',
                            onRefresh: () {
                              controller.fetchDeletedAndArchivedCards();
                            },
                          ),
                        );
                      } else {
                        return ListView.separated(
                          controller: firstCardscrollController,
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.deletedCards.length,
                          //  (state.deletedCards?.length ?? 0) +
                          //     (state.deleteCardEventLoading ? 1 : 0),
                          separatorBuilder: (context, index) =>
                              adjustWidth(kwidth * .05),
                          itemBuilder: (context, index) {
                            // if (state.deleteCardEventLoading &&
                            //     index == state.deletedCards!.length) {
                            //   return const LoadingAnimation();
                            // }
                            // final deletedFirstCard = state.deletedCards![index];
                            // String base64String = deletedFirstCard.logo ?? '';
                            // base64String = base64String.replaceFirst(
                            //     RegExp(r'data:image/jpg;base64,'), '');
                            return InkWell(
                              onTap: () {
                                // final Map<String, String> map = state.deletedCards !=
                                //             null &&
                                //         state.deletedCards![index].id != null
                                //     ? {
                                //         'myCard': 'true',
                                //         'cardId':
                                //             state.deletedCards![index].id!.toString()
                                //       }
                                //     : <String, String>{};
                                // GoRouter.of(context).pushNamed(
                                //   Routes.cardDetailView,
                                //   pathParameters: map,
                                // );
                              },
                              child: Container(
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
                                          height: khieght * .3,
                                          child: ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(25),
                                                topRight: Radius.circular(20),
                                              ),
                                              child:
                                                  //  state.deletedCards != null &&
                                                  //         state.deletedCards![index].logo !=
                                                  //             null
                                                  Image.memory(
                                                //base64Decode(memoryImage),
                                                base64Decode(imageTestingBase64
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
                                          controller.deletedCards[index]
                                                  .designation ??
                                              'Designation',
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
                                              child: Text('Restore',
                                                  style: textStyle1),
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
                        );
                      }
                    },
                  )),
              adjustHieght(khieght * .02),
            ],
          ),
        ),
      ),
    );
  }
}
