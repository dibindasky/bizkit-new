import 'package:bizkit/module/biz_card/application/controller/card/create_controller.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_detail_view/widgets/card_bottom_part.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/preview_commen_widgets/preview_pageview_image_builder/preview_pageview_image_builder.dart';
import 'package:bizkit/module/module_manager/application/controller/auth_controller.dart';
import 'package:bizkit/module/module_manager/application/controller/module_controller.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CardDetailViewDeeplinkScreen extends StatefulWidget {
  const CardDetailViewDeeplinkScreen({super.key, required this.cardId});
  final String? cardId;

  @override
  State<CardDetailViewDeeplinkScreen> createState() =>
      _CardDetailViewDeeplinkScreenState();
}

class _CardDetailViewDeeplinkScreenState
    extends State<CardDetailViewDeeplinkScreen> {
  bool formDeeplink = false;
  @override
  void initState() {
    if (!Get.isRegistered<ModuleController>()) {
      Get.lazyPut(() => AuthenticationController());
      Get.lazyPut(() => ModuleController());
      formDeeplink = true;
    }
    getCard();
    super.initState();
  }

  Future getCard() async {
    if (!Get.isRegistered<CardController>()) {
      Get.find<ModuleController>().initCardControllers();
    }
    Get.find<CardController>().scanAndConnect(cardId: widget.cardId ?? '');
  }

  @override
  Widget build(BuildContext context) {
    if (Get.find<CardController>().connectionExist.value ) {
      Get.find<CardController>().showConnectionDetailPopUp(context);
    }
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
            () => !Get.find<CardController>().isLoading.value &&
                    !Get.find<CardController>().myCardDeeplinkPage.value
                ? IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.people),
                  )
                : kempty,
          ),
          kWidth10
        ],
      ),
      body: Obx(
        () {
          if (Get.find<CardController>().isLoading.value) {
            return const Center(
                child: CircularProgressIndicator(color: neonShade));
          } else if (Get.find<CardController>().bizcards == null) {
            return GestureDetector(
              onTap: () {},
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
          print(
              'Get.find<CardController>().myCardDeeplinkPage.value ====> ${Get.find<CardController>().myCardDeeplinkPage.value}');
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: RefreshIndicator(
              onRefresh: () async {
                Get.find<CardController>().cardDetail(cardId: widget.cardId!);
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
                      if (Get.find<CardController>()
                              .bizcardDetail
                              .value
                              .businessDetails
                              ?.businessLogo !=
                          null) {
                        images.add(Get.find<CardController>()
                                .bizcardDetail
                                .value
                                .businessDetails!
                                .businessLogo!
                                .startsWith('data:')
                            ? Get.find<CardController>()
                                .bizcardDetail
                                .value
                                .businessDetails!
                                .businessLogo!
                                .substring(22)
                            : Get.find<CardController>()
                                .bizcardDetail
                                .value
                                .businessDetails!
                                .businessLogo!);
                        story = true;
                      }
                      if (Get.find<CardController>()
                                  .bizcardDetail
                                  .value
                                  .personalDetails
                                  ?.images !=
                              null &&
                          Get.find<CardController>()
                              .bizcardDetail
                              .value
                              .personalDetails!
                              .images!
                              .isNotEmpty) {
                        images.addAll(Get.find<CardController>()
                            .bizcardDetail
                            .value
                            .personalDetails!
                            .images!
                            .map((e) =>
                                e.startsWith('data') ? e.substring(22) : e)
                            .toList());
                      }
                      return PreviewPageviewImageBuilder(
                        imagesList: images.isEmpty
                            ? [bizcardIconBase64.substring(22)]
                            : images,
                        storyIndex: story ? 0 : null,
                        story: Get.find<CardController>()
                            .bizcardDetail
                            .value
                            .businessDetails
                            ?.logoStory,
                      );
                    }),
                  ),
                  Column(
                    children: [
                      kHeight20,
                      Text(
                        Get.find<CardController>()
                                    .personalDetails
                                    .value
                                    ?.name !=
                                null
                            ? Get.find<CardController>()
                                    .personalDetails
                                    .value
                                    ?.name ??
                                ''
                            : Get.find<CardController>()
                                        .businessDetails
                                        .value
                                        ?.businessName !=
                                    null
                                ? Get.find<CardController>()
                                        .businessDetails
                                        .value
                                        ?.businessName ??
                                    ""
                                : '',
                        overflow: TextOverflow.ellipsis,
                        style: custumText(fontSize: kwidth * 0.06),
                      ),
                      Text(
                        Get.find<CardController>()
                                    .personalDetails
                                    .value
                                    ?.email !=
                                null
                            ? Get.find<CardController>()
                                    .personalDetails
                                    .value
                                    ?.email ??
                                ''
                            : Get.find<CardController>()
                                        .businessDetails
                                        .value
                                        ?.designation !=
                                    null
                                ? Get.find<CardController>()
                                        .businessDetails
                                        .value
                                        ?.designation ??
                                    ""
                                : '',
                        overflow: TextOverflow.ellipsis,
                      ),
                      adjustHieght(khieght * .02),
                    ],
                  ),
                  // Card details
                  ScreenCardDetailSecondHalf(
                    mycard: Get.find<CardController>().myCardDeeplinkPage.value,
                    cardId: widget.cardId,
                  )
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.find<ModuleController>()
              .chooseModule(context, module: Module.card);
        },
        child: const Icon(Icons.home),
      ),
    );
  }
}
