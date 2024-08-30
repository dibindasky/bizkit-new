import 'package:bizkit/module/biz_card/application/controller/card/create_controller.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_detail_view/widgets/card_persentage_completion_indicator.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_detail_view/widgets/card_view_personal_banking_achive.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_detail_view/widgets/card_view_row_icons.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/preview_commen_widgets/brochers_and_products_builder/brocher_and_products_tab/preview_products_and_brands.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/card_detail_model/brochure.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/card_detail_model/product.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenCardDetailSecondHalf extends StatelessWidget {
  const ScreenCardDetailSecondHalf({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // completion persentage indicator
        // add reminder button
        const CardViewCompletionPersentageIndicator(),
        //const CardViewAddReminderContainer(),
        // row icons call,mail,website,socialmedia ,location
        const CardViewRowWiceIcons(),
        adjustHieght(khieght * .02),
        // banking, personal, achivements butons
        const CardViewBankPersonAchivedRows(),
        adjustHieght(khieght * .02),
        // brochers and product preview section
        GetBuilder<CardController>(builder: (controller) {
          List<Product> images = [];
          final businessDetail = controller.bizcardDetail.value.businessDetails;
          if (businessDetail != null && businessDetail.product != null) {
            images = businessDetail.product!;
          }
          List<Brochure> pdfBase64 = [];
          if (businessDetail != null && businessDetail.brochure != null) {
            pdfBase64 = businessDetail.brochure!.toList();
          }
          return CardProductsBrandsLists(networkImages: images, pdf: pdfBase64);
        }),
        adjustHieght(khieght * .02),
        // meeting history section
        //const CardMeetingDetailHistoryCardBuilder()
      ],
    );
  }
}
