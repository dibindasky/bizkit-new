import 'package:bizkit/module/biz_card/application/presentation/screens/card_detail_view/widgets/card_view_personal_banking_achive.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_detail_view/widgets/card_view_row_icons.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_detail_view/widgets/history_card_view.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_detail_view/widgets/reminder_adding_session.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/preview_commen_widgets/brochers_and_products_builder/brocher_and_products_tab/preview_products_and_brands.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class ScreenCardDetailSecondHalf extends StatelessWidget {
  const ScreenCardDetailSecondHalf({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // completion persentage indicator

        // add reminder button
        const CardViewAddReminderContainer(),
        // row icons call,mail,website,socialmedia ,location
        const CardViewRowWiceIcons(),
        adjustHieght(khieght * .02),
        // banking, personal, achivements butons
        const CardViewBankPersonAchivedRows(),
        adjustHieght(khieght * .02),
        // brochers and product preview sestion
        // BlocBuilder<CardBloc, CardState>(
        //   builder: (context, state) {
        //     List<Product> images = [];
        //     if (state.anotherCard != null &&
        //         state.anotherCard!.product != null) {
        //       images = state.anotherCard!.product!;
        //     }
        //     List<Brochure> pdfBase64 = [];
        //     if (state.anotherCard != null &&
        //         state.anotherCard!.brochure != null) {
        //       pdfBase64 = state.anotherCard!.brochure!;
        //       // .map((e) => e.file == null
        //       //     ? pdfImage.substring(22)
        //       //     : e.file!
        //       //         .substring('data:application/pdf;base64,'.length))
        //       // .toList();
        //     }
        //     return CardProductsBrandsLists(
        //         networkImages: images, pdf: pdfBase64);
        //   },
        // ),
        const CardProductsBrandsLists(),
        adjustHieght(khieght * .02),
        // meeting history section
        const CardMeetingDetailHistoryCardBuilder()
      ],
    );
  }
}
