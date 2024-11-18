// import 'dart:developer';

import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/biz_card/application/controller/received_card/received_card_controller.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class ReceivedCardsTab extends StatelessWidget {
  const ReceivedCardsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final receivedCardController = Get.find<ReceivedCardController>();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      receivedCardController.fetchAllreceivedCards();
    });
    return RefreshIndicator(
      onRefresh: () async {},
      child: Obx(
        () {
          if (receivedCardController.loadingForVisitingCard.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {}
          return SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1 / 1.4,
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemCount: receivedCardController.visitingCards.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        // log("ID == > ${receivedCardController.visitingCards[index].id ?? ''}");

                        // receivedCardController.fetchReceivedCardDetails(
                        //     receivedCardId: receivedCardController
                        //             .visitingCards[index].id ??
                        //         '');

                        GoRouter.of(context).pushNamed(
                            Routes.receivedCardDetail,
                            extra: receivedCardController
                                    .visitingCards[index].id ??
                                '');
                      },
                      child: Card(
                        elevation: 1,
                        child: Column(
                          children: [
                            Image.asset(bizcardBgImage),
                            adjustHieght(10.h),
                            Text(
                              receivedCardController
                                      .visitingCards[index].name ??
                                  'name',
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                            Text(
                              receivedCardController
                                      .visitingCards[index].company ??
                                  'company',
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.copyWith(fontSize: 10),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                kHeight50
              ],
            ),
          );
        },
      ),
    );
  }
}
