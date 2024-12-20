// import 'dart:developer';

import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/biz_card/application/controller/received_card/received_card_controller.dart';
import 'package:bizkit/module/module_manager/application/controller/internet_controller.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/images/network_image_with_loader.dart';
import 'package:bizkit/utils/refresh_indicator/refresh_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class ReceivedCardsTab extends StatelessWidget {
  const ReceivedCardsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final receivedCardController = Get.find<ReceivedCardController>();
    final internetConnectinController =
        Get.find<InternetConnectionController>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      receivedCardController.fetchAllreceivedCards();
    });
    return RefreshIndicator(
      onRefresh: () async {
        receivedCardController.fetchAllreceivedCards(refresh: true);
      },
      child: Obx(
        () {
          if (receivedCardController.loadingForVisitingCard.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (!internetConnectinController.isConnectedToInternet.value &&
              receivedCardController.filterdVisitingCards.isEmpty) {
            return InternetConnectionLostWidget(
              onTap: () {
                receivedCardController.fetchAllreceivedCards(refresh: true);
              },
            );
          } else if (receivedCardController.filterdVisitingCards.isEmpty) {
            return ErrorRefreshIndicator(
              onRefresh: () {
                receivedCardController.fetchAllreceivedCards(refresh: true);
              },
              errorMessage: 'No recieved cards',
              image: emptyNodata2,
            );
          }
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
                  itemCount: receivedCardController.filterdVisitingCards.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        // log("ID == > ${receivedCardController.visitingCards[index].id ?? ''}");

                        // receivedCardController.fetchReceivedCardDetails(
                        //     receivedCardId: receivedCardController
                        //             .visitingCards[index].id ??
                        //         '');
                        receivedCardController.fetchReceivedCardDetails(
                            receivedCardId: receivedCardController
                                    .filterdVisitingCards[index].id ??
                                '');
                        GoRouter.of(context).pushNamed(
                            Routes.receivedCardDetail,
                            extra: receivedCardController
                                    .filterdVisitingCards[index].id ??
                                '');
                      },
                      child: Card(
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Expanded(
                                child: NetworkImageWithLoader(
                                  receivedCardController
                                          .filterdVisitingCards[index]
                                          .cardImage ??
                                      '',
                                  radius: 8,
                                ),
                              ),
                              adjustHieght(10.h),
                              Text(
                                receivedCardController
                                        .filterdVisitingCards[index].name ??
                                    'name',
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                              Text(
                                receivedCardController
                                        .filterdVisitingCards[index].company ??
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
