import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/biz_card/application/controller/card/business_details.dart';
import 'package:bizkit/module/biz_card/application/controller/card/create_controller.dart';
import 'package:bizkit/module/biz_card/application/controller/card/personal_details.dart';
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
    return Column(
      children: [
        kHeight30,
        EventButton(
            text: 'Edit Card',
            onTap: () {
              GoRouter.of(context).pushNamed(Routes.cardUpdating);
              final cardController = Get.find<CardController>();
              Get.find<PersonalDetailsController>()
                  .getPersonalDetails(cardController.bizcardDetail.value);
              Get.find<BusinesDetailsController>()
                  .getBusinessDetails(cardController.bizcardDetail.value);
            },
            showGradiant: false,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity),
      ],
    );
  }
}
