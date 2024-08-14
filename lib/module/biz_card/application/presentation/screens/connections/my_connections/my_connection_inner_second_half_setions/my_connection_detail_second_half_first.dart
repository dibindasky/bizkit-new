import 'package:bizkit/module/biz_card/application/business_logic/card/card/card_bloc.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/reminder/reminder_section.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/preview_commen_widgets/banking_personal_achieved/bank_person_achived_rows.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/preview_commen_widgets/brochers_and_products_builder/brocher_and_products_tab/preview_products_and_brands.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/preview_commen_widgets/preview_row_vice_icons/preview_row_wice_icons.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/module/biz_card/domain/model/card/card/brochure/brochure.dart';
import 'package:bizkit/module/biz_card/domain/model/card/card/product/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardMyConnectionDetailScreenSecondHalf extends StatelessWidget {
  const CardMyConnectionDetailScreenSecondHalf({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // add reminder button
        const PreviewHomeContactDetailAddReminderContainer(),
        // row icons call,mail,website,socialmedia ,location
        const PreviewRowWiceIcons(fromPreview: false),
        adjustHieght(khieght * .02),
        // banking, personal, achivements butons
        const PreviewBankPersonAchivedRows(fromPreview: false),
        adjustHieght(khieght * .02),
        // brochers and product preview sestion
        BlocBuilder<CardBloc, CardState>(builder: (context, state) {
          List<Product> images = [];
          if (state.anotherCard != null && state.anotherCard!.product != null) {
            images = state.anotherCard!.product!;
          }
          List<Brochure> pdfBase64 = [];
          if (state.anotherCard != null &&
              state.anotherCard!.businessDetails != null &&
              state.anotherCard!.brochure != null) {
            pdfBase64 = state.anotherCard!.brochure!;
            // .map((e) =>
            //     e.file!.substring('data:application/pdf;base64,'.length))
            // .toList();
          }
          return CardProductsBrandsLists(
            networkImages: images,
            pdf: pdfBase64,
          );
        }),
        adjustHieght(khieght * .02),
        // meeting history section
        // const MeetingDetailHistoryLogTabBuilder()
      ],
    );
  }
}
