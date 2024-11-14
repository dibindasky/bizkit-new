import 'package:bizkit/module/biz_card/application/controller/received_card/received_card_controller.dart';
import 'package:bizkit/module/biz_card/application/controller/text_extraction/text_extraction_controller.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens2/card_detail_view/second_card_detail_view.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens2/received_cards/received_card_screen.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ReceivedCardsTab extends StatelessWidget {
  const ReceivedCardsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final receivedCardController = Get.find<ReceivedCardController>();
    final textExtractionController = Get.find<CardTextExtractionController>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      receivedCardController.fetchAllreceivedCards();
    });
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: RefreshIndicator(
        onRefresh: () async {},
        child: Obx(
          () {
            if (receivedCardController.loadingForVisitingCard.value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {}
            return Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: GridView.builder(
                    // physics: NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 1 / 1.4,
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10),
                    itemCount: receivedCardController.visitingCards.length + 1,
                    itemBuilder: (context, index) {
                      if (index ==
                          receivedCardController.visitingCards.length) {
                        return Card();
                      }
                      return GestureDetector(
                        onTap: () {
                          // receivedCardController.fetchReceivedCardDetails(
                          //     receivedCardId:
                          //         receivedCardController.visitingCards[index].id ??
                          //             '');
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //     builder: (context) => ScreenCardSecondDetailView(
                          //       visitingCardId:
                          //           receivedCardController.visitingCards[index].id ??
                          //               '',
                          //     ),
                          //   ),
                          // );
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
                ),
                kHeight50
              ],
            );
          },
        ),
      ),
    );
  }
}
