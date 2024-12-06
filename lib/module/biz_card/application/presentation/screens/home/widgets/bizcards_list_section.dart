import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/biz_card/application/controller/card/create_controller.dart';
import 'package:bizkit/module/biz_card/application/controller/text_extraction/text_extraction_controller.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/home/widgets/business_card.dart';
import 'package:bizkit/module/biz_card/application/presentation/widgets/bizcard_widget.dart';
import 'package:bizkit/module/module_manager/application/controller/access/access_controller.dart';
import 'package:bizkit/utils/animations/pageview_animated_builder.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class BizcardsListSection extends StatefulWidget {
  const BizcardsListSection({super.key});

  @override
  State<BizcardsListSection> createState() => _BizcardsListSectionState();
}

class _BizcardsListSectionState extends State<BizcardsListSection> {
  late PageController pageController;
  int currentIndex = 0;
  double pageValue = 0.0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(
      viewportFraction: 0.8,
    )..addListener(() {
        if (Get.find<CardController>().autoScrollCard.value) {
          setState(() {
            pageValue = pageController.page!;
          });
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    final bizcardController = Get.find<CardController>();
    final accessController = Get.find<AccessController>();
    return Obx(() {
      if (bizcardController.isLoading.value) {
        return _buildShimmerLoading();
      }

      // Get the length of cards or default to 0 if null
      final cardCount = bizcardController.bizcards.length;

      // Show loading or empty state if no cards
      // if (cardCount == 0) {
      //   return Padding(
      //     padding: const EdgeInsets.symmetric(horizontal: 10),
      //     child: Column(
      //       children: [
      //         Text('BizCards',style: Theme.of(context).textTheme.displayMedium),
      //         SizedBox(
      //           width: 382.w,
      //           height: 400.h,
      //           child: Center(
      //             child: Image.asset(emptyNodata2),
      //           ),
      //         ),
      //       ],
      //     ),
      //   );
      // }

      return SizedBox(
        width: 382.w,
        height: 450.h,
        child: PagviewAnimateBuilder(
          pageController: pageController,
          // offAnimation: bizcardController.autoScrollCard.value,
          pageValue: pageValue,
          // Add 1 for the "add" button at the end
          pageCount: (cardCount == 0 &&
                  (accessController.userRole.value != 'user'))
              ? (1)
              : (cardCount +
                  ((accessController.userRole.value == 'user')
                      ? 1
                      : 0)),
          onpageCallBack: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          child: (index, context) {
            // Show add button as last item
            if (index == cardCount) {
              return Column(
                children: [
                  BizcardWidget(
                    width: 362.w,
                    height: 260.h,
                    createCard: true,
                    onTap: () {
                      if ((accessController.userRole.value !=
                          'user')) return;
                      Get.find<CardTextExtractionController>()
                          .clearCardImages();
                      GoRouter.of(context).pushNamed(Routes.cardCreation);
                    },
                  ),
                  kHeight30,
                ],
              );
            }
            // Show business card if index is valid
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: BusinessCard(
                bizcard: bizcardController.bizcards[index],
              ),
            );
          },
        ),
      );
    });
  }

  Widget _buildShimmerLoading() {
    return SizedBox(
      width: 382.w,
      height: 450.h,
      child: PagviewAnimateBuilder(
        // offAnimation: false,
        pageController: pageController,
        pageValue: pageValue,
        pageCount: 6, // Show 6 shimmer cards while loading
        onpageCallBack: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        child: (index, context) => const BizcardShimmer(),
      ),
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
