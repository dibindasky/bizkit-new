import 'package:bizkit/module/biz_card/application/presentation/screens/card_detail/widgets/bizcard_detail_edit_button.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_detail/widgets/bizcard_detail_top_portion.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_detail/widgets/bizcard_details_icons.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_detail/widgets/bizcard_products_brand.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_detail/widgets/bizcard_reminders_notes.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';

class BizCardDetailScreen extends StatefulWidget {
  const BizCardDetailScreen({super.key, this.cardId, required this.myCard});
  final String? cardId;
  final bool myCard;

  @override
  State<BizCardDetailScreen> createState() => _BizCardDetailScreenState();
}

class _BizCardDetailScreenState extends State<BizCardDetailScreen> {
  // final cardController = Get.find<CardController>();
  // final personalDetailsController = Get.find<PersonalDetailsController>();
  // final businessDetailsController = Get.find<BusinesDetailsController>();
  // final connectionController = Get.find<ConnectionsController>();

  // @override
  // void initState() {
  //   getCard();
  //   super.initState();
  // }

  // Future getCard() async {
  //   if (widget.cardId != null && widget.myCard) {
  //     cardController.cardDetail(cardId: widget.cardId ?? '');
  //   } else if (!widget.myCard) {
  //     connectionController.getConnectionCardDetail(cardId: widget.cardId ?? '');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              // card user data and images
              BizcardDetailTopPotion(myCard: widget.myCard),
              Column(
                children: [
                  // card details icons and gifs
                  const BizCardDetailsIconsWidgets(),
                  // products and brands
                  const BizCardProductsOrBrands(),
                  widget.myCard
                      // edit button
                      ? const BizcardDetailEditButton()
                      // notes section
                      : const BizCardRminderNotes(),
                  kHeight30,
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
