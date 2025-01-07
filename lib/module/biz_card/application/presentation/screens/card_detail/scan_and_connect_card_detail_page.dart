import 'package:bizkit/module/biz_card/application/controller/card/create_controller.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_detail/widgets/bizcard_detail_top_portion.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_detail/widgets/bizcard_details_icons.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_detail/widgets/product/bizcard_products_brand.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_detail/widgets/reminder_notes/bizcard_reminders_notes.dart';
import 'package:bizkit/module/module_manager/application/controller/auth_controller.dart';
import 'package:bizkit/module/module_manager/application/controller/module_controller.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BizCardScanAndConnectCardDetailScreen extends StatefulWidget {
  const BizCardScanAndConnectCardDetailScreen({super.key, this.cardId});
  final String? cardId;

  @override
  State<BizCardScanAndConnectCardDetailScreen> createState() =>
      _BizCardScanAndConnectCardDetailScreenState();
}

class _BizCardScanAndConnectCardDetailScreenState
    extends State<BizCardScanAndConnectCardDetailScreen> {
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
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          Get.find<CardController>().cardDetail(cardId: widget.cardId!);
        },
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                // card user data and images
                /// connection detail and macho meter pop up coming from [BizcardDetailTopPotion]
                const BizcardDetailTopPotion(myCard: false, scanPage: true),
                Column(
                  children: [
                    // card details icons and gifs
                    const BizCardDetailsIconsWidgets(),
                    // products and brands
                    const BizCardProductsOrBrands(
                      myCard: false,
                    ),
                    // widget.myCard
                    //     // edit button
                    //     ? const BizcardDetailEditButton()
                    //     // notes section
                    // :
                    const BizCardRminderNotes(),
                    kHeight50,
                    kHeight50,
                    kHeight50,
                    kHeight50,
                    // kHeight50,
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
