import 'package:bizkit/module/biz_card/application/controller/card/create_controller.dart';
import 'package:bizkit/module/biz_card/application/controller/connections/connections_controller.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_detail/widgets/bizcard_detail_edit_button.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_detail/widgets/bizcard_detail_top_portion.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_detail/widgets/bizcard_details_icons.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_detail/widgets/product/bizcard_products_brand.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_detail/widgets/reminder_notes/bizcard_reminders_notes.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BizCardDetailScreen extends StatelessWidget {
  const BizCardDetailScreen(
      {super.key, this.cardId, required this.myCard, this.fromPreview = false});
  final String? cardId;
  final bool myCard;
  final bool fromPreview;

  @override
  Widget build(BuildContext context) {
    final cardController = Get.find<CardController>();
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          if (cardId != null && myCard) {
            cardController.cardDetail(cardId: cardId ?? '', refresh: true);
          } else if (!myCard) {
            Get.find<ConnectionsController>()
                .getConnectionCardDetail(cardId: cardId ?? '', refresh: true);
          }
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              // card user data and images
              BizcardDetailTopPotion(myCard: myCard, fromPreview: fromPreview),
              Column(
                children: [
                  // card details icons and gifs
                  const BizCardDetailsIconsWidgets(),
                  // products and brands
                  const BizCardProductsOrBrands(),
                  myCard
                      // edit button
                      ? const BizcardDetailEditButton()
                      : fromPreview
                          ? kempty
                          // notes section
                          : const BizCardRminderNotes(),
                  kHeight50,
                  kHeight50,
                  kHeight50,
                  kHeight50,
                  kHeight50,
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
