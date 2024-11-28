import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/biz_card/application/controller/card/business_details.dart';
import 'package:bizkit/module/biz_card/application/controller/card/create_controller.dart';
import 'package:bizkit/module/biz_card/application/controller/card/personal_details.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/widgets/event_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class BizcardDetailEditButton extends StatelessWidget {
  const BizcardDetailEditButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cardController = Get.find<CardController>();
    return Column(
      children: [
        kHeight30,
        GestureDetector(
          onTap: () {
            if (cardController.isLoading.value) {
              return;
            }
            GoRouter.of(context).pushNamed(Routes.cardUpdating);
            Get.find<PersonalDetailsController>()
                .getPersonalDetails(cardController.bizcardDetail.value);
            Get.find<BusinesDetailsController>()
                .getBusinessDetails(cardController.bizcardDetail.value);
          },
          child: Stack(
            children: [
              // background color
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(25),
                  ),
                  color:
                      Theme.of(context).colorScheme.secondary.withOpacity(0.3),
                ),
              ),
              // persentage color
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                width: cardController.bizcardDetail.value.completionLevel ==
                        null
                    ? double.infinity
                    : (kwidth *
                        ((cardController.bizcardDetail.value.completionLevel ??
                                10) /
                            100)),
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(25),
                  ),
                  color: Theme.of(context).colorScheme.surface,
                ),
              ),
              // data
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                height: 45,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                  color: knill,
                ),
                child: Center(
                  child: Text(
                    cardController.bizcardDetail.value.completionLevel ==
                                null ||
                            cardController
                                    .bizcardDetail.value.completionLevel ==
                                100
                        ? 'Edit Card'
                        : '${cardController.bizcardDetail.value.completionLevel ?? 10}% Completed',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
              ),
            ],
          ),
        ),
        // EventButton(
        //     text: 'Edit Card',
        //     onTap: () {
        //       if (cardController.isLoading.value) {
        //         return;
        //       }
        //       GoRouter.of(context).pushNamed(Routes.cardUpdating);
        //       Get.find<PersonalDetailsController>()
        //           .getPersonalDetails(cardController.bizcardDetail.value);
        //       Get.find<BusinesDetailsController>()
        //           .getBusinessDetails(cardController.bizcardDetail.value);
        //     },
        //     showGradiant: false,
        //     margin: const EdgeInsets.symmetric(horizontal: 20),
        //     width: double.infinity),
      ],
    );
  }
}
