import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/biz_card/application/controller/card/business_details.dart';
import 'package:bizkit/module/biz_card/application/controller/card/create_controller.dart';
import 'package:bizkit/module/biz_card/application/controller/card/personal_details.dart';
import 'package:bizkit/module/biz_card/application/controller/connections/connections_controller.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens2/card_detail_view/screen_detail_editing/card_detail_editing_screen.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens2/card_detail_view/widgets/card_bottom_part.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens2/preview_commen_widgets/preview_pageview_image_builder/preview_pageview_image_builder.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class ScreenCardDetailView extends StatefulWidget {
  const ScreenCardDetailView(
      {super.key, required this.myCard, required this.cardId});
  final String? cardId;
  final bool myCard;

  @override
  State<ScreenCardDetailView> createState() => _ScreenCardDetailViewState();
}

class _ScreenCardDetailViewState extends State<ScreenCardDetailView> {
  final cardController = Get.find<CardController>();
  final personalDetailsController = Get.find<PersonalDetailsController>();
  final businessDetailsController = Get.find<BusinesDetailsController>();
  final connectionController = Get.find<ConnectionsController>();

  @override
  void initState() {
    getCard();
    super.initState();
  }

  Future getCard() async {
    if (widget.cardId != null && widget.myCard) {
      cardController.cardDetail(cardId: widget.cardId ?? '');
    } else if (!widget.myCard) {
    //  connectionController.getConnectionCardDetail(cardId: widget.cardId ?? '') ;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: kwhite,
            size: 18,
          ),
        ),
        backgroundColor: knill,
        title: const Text('Card'),
        actions: [
          Obx(
            () => !cardController.isLoading.value && widget.myCard
                ? IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ScreenCardDetailEditingList()));
                      personalDetailsController.getPersonalDetails(
                          cardController.bizcardDetail.value);
                      businessDetailsController.getBusinessDetails(
                          cardController.bizcardDetail.value);
                    },
                    icon: const Icon(Icons.edit),
                  )
                : !widget.myCard && !cardController.isLoading.value
                    ? IconButton(
                        onPressed: () async {
                          await GoRouter.of(context).pushNamed(
                              Routes.connectionDetailFilling,
                              extra: cardController.bizcardDetail.value);
                          setState(() {});
                        },
                        icon: const Icon(Icons.people),
                      )
                    : kempty,
          ),
          kWidth10
        ],
      ),
      body: Obx(
        () {
          if (cardController.isLoading.value ||
              connectionController.cardLoading.value) {
            return const Center(
                child: CircularProgressIndicator(color: neonShade));
          } else if (cardController.bizcards == null) {
            return GestureDetector(
              onTap: () {
                if (widget.cardId != null) {
                  cardController.cardDetail(cardId: widget.cardId!);
                } else if (!widget.myCard && widget.cardId != null) {
                  // connectionController.getConnectionCardDetail(
                  //     cardId: widget.cardId ?? '');
                }
              },
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.refresh),
                    Text('Tap to retry'),
                  ],
                ),
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: RefreshIndicator(
              onRefresh: () async {
                cardController.cardDetail(cardId: widget.cardId!);
              },
              child: ListView(
                children: [
                  kHeight20,
                  // Image carosal view
                  SizedBox(
                    height: 200.h,
                    child: GetBuilder<CardController>(builder: (controller) {
                      List<String> images = [];
                      bool story = false;
                      // add images from business logo
                      if (cardController.bizcardDetail.value.businessDetails
                              ?.businessLogo !=
                          null) {
                        images.add(cardController.bizcardDetail.value
                                .businessDetails!.businessLogo!
                                .startsWith('data:')
                            ? cardController.bizcardDetail.value
                                .businessDetails!.businessLogo!
                                .substring(22)
                            : cardController.bizcardDetail.value
                                .businessDetails!.businessLogo!);
                        story = true;
                      }
                      // add personal images
                      if (cardController.bizcardDetail.value.personalDetails
                              ?.images?.isNotEmpty ??
                          false) {
                        images.addAll(cardController
                            .bizcardDetail.value.personalDetails!.images!
                            .map((e) =>
                                e.startsWith('data') ? e.substring(22) : e)
                            .toList());
                      }
                      // add selfie from cocnnection details
                      if (cardController
                              .bizcardDetail.value.selfie?.isNotEmpty ??
                          false) {
                        images
                            .addAll(cardController.bizcardDetail.value.selfie!);
                      }
                      return PreviewPageviewImageBuilder(
                        imagesList: images.isEmpty
                            ? [bizcardIconBase64.substring(22)]
                            : images,
                        storyIndex: story ? 0 : null,
                        story: cardController
                            .bizcardDetail.value.businessDetails?.logoStory,
                      );
                    }),
                  ),
                  Column(
                    children: [
                      kHeight20,
                      Text(
                        // cardController.personalDetails.value?.name != null
                        //     ? cardController.personalDetails.value?.name ?? ''
                        //     : cardController
                        //                 .businessDetails.value?.businessName !=
                        //             null
                        //         ? cardController
                        //                 .businessDetails.value?.businessName ??
                        //             ""
                        //         :
                        'Name',
                        overflow: TextOverflow.ellipsis,
                        style: custumText(fontSize: kwidth * 0.06),
                      ),
                      Text(
                        // cardController.personalDetails.value?.email != null
                        //     ? cardController.personalDetails.value?.email ?? ''
                        //     : cardController
                        //                 .businessDetails.value?.designation !=
                        //             null
                        //         ? cardController
                        //                 .businessDetails.value?.designation ??
                        //             ""
                        //         :
                        'Designation',
                        overflow: TextOverflow.ellipsis,
                      ),
                      adjustHieght(khieght * .02),
                    ],
                  ),
                  // Card details
                  ScreenCardDetailSecondHalf(
                    mycard: widget.myCard,
                    cardId: widget.cardId,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
