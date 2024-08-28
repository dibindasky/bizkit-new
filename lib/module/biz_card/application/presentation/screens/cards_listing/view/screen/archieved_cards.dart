import 'dart:convert';

import 'package:bizkit/module/biz_card/application/controller/card/create_controller.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/card_archive_model/card_archive_model.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/utils/dailog.dart';
import 'package:bizkit/utils/refresh_indicator/refresh_custom.dart';
import 'package:bizkit/utils/shimmier/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ArchivedCards extends StatefulWidget {
  const ArchivedCards({super.key});

  @override
  State<ArchivedCards> createState() => _ArchivedCardsState();
}

class _ArchivedCardsState extends State<ArchivedCards> {
  final ScrollController scrollController = ScrollController();
  final cardController = Get.find<CardController>();
  Future<void> onRefresh() async {
    cardController.fetchDeletedAndArchivedCards();
    await Future.delayed(const Duration(milliseconds: 1000));
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      // if (scrollController.position.pixels ==
      //   scrollController.position.maxScrollExtent) {
      // context.read<CardBloc>().add(const CardEvent.getArchievedCardsEvent());
      // }
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
          'Archived Cards',
          style: textHeadStyle1,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
            child: RefreshIndicator(
          onRefresh: onRefresh,
          child: GetBuilder<CardController>(
            builder: (controller) {
              if (controller.isLoading.value) {
                return SizedBox(
                  height: khieght,
                  child: ShimmerLoader(
                    height: 200.h,
                    seprator: adjustHieght(khieght * .03),
                    scrollDirection: Axis.vertical,
                    itemCount: controller.archivedCards.length,
                    width: 300.w,
                  ),
                );
              } else if (controller.archivedCards.isEmpty) {
                return SizedBox(
                  height: 400.h,
                  child: ErrorRefreshIndicator(
                    image: emptyNodata2,
                    errorMessage: 'No archived cards',
                    onRefresh: () {
                      controller.fetchDeletedAndArchivedCards();
                    },
                  ),
                );
              } else {
                return ListView.separated(
                  controller: scrollController,
                  shrinkWrap: true,
                  itemCount: controller.archivedCards.length,
                  // (state.archievedCards?.length ?? 0) +
                  //     (state.archiveCardLoading ? 1 : 0),
                  separatorBuilder: (context, index) =>
                      adjustHieght(khieght * .03),
                  itemBuilder: (context, index) {
                    // if (state.archiveCardLoading &&
                    //     index == state.archievedCards!.length) {
                    //   return const LoadingAnimation();
                    // }
                    // final card = state.archievedCards![index];
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
                                    // final Map<String, String> map = state
                                    //                 .archievedCards !=
                                    //             null &&
                                    //         state.archievedCards![index].id != null
                                    //     ? {
                                    //         'myCard': 'true',
                                    //         'cardId': state.archievedCards![index].id!
                                    //             .toString()
                                    //       }
                                    //     : <String, String>{};
                                    // GoRouter.of(context).pushNamed(
                                    //   Routes.cardDetailView,
                                    //   pathParameters: map,
                                    // );
                                  },
                                  child: ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(25),
                                        topRight: Radius.circular(20),
                                      ),
                                      child: Image.memory(base64Decode(
                                          imageTestingBase64.substring(22)))
                                      // state.archievedCards == null ||
                                      //         state.archievedCards![index].logo == null
                                      //     ? Image.network(imageDummyNetwork,
                                      //         fit: BoxFit.cover)
                                      //     : Image.network(
                                      //         card.logo!,
                                      //         fit: BoxFit.cover,
                                      //       ),
                                      ),
                                ),
                              ),
                            ],
                          ),
                          adjustHieght(khieght * .02),
                          Row(
                            children: [
                              adjustWidth(kwidth * .02),
                              Text(
                                  controller.archivedCards[index].designation ??
                                      'Designation',
                                  style:
                                      textThinStyle1.copyWith(fontSize: 14.sp)),
                              const Spacer(),
                              InkWell(
                                onTap: () {
                                  showConfirmationDialog(
                                    heading: 'Restore Card',
                                    actionButton: 'Restore',
                                    context,
                                    onPressed: () {
                                      controller.archiveACard(
                                        context: context,
                                        cardArchive: CardArchiveModel(
                                            bizcardId: controller
                                                    .archivedCards[index]
                                                    .bizcardId ??
                                                '',
                                            isArchived: false),
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
                                    child: Text('Restore',
                                        style: textThinStyle1.copyWith(
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
                    );
                  },
                );
              }
            },
          ),
        )),
      ),
    );
  }
}
