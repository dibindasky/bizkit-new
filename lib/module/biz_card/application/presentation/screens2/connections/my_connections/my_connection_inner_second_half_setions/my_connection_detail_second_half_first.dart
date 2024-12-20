import 'package:bizkit/module/biz_card/application/presentation/screens2/preview_commen_widgets/banking_personal_achieved/bank_person_achived_rows.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens2/preview_commen_widgets/brochers_and_products_builder/brocher_and_products_tab/preview_products_and_brands.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens2/preview_commen_widgets/preview_row_vice_icons/preview_row_wice_icons.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens2/reminder/reminder_container.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';

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
        const CardProductsBrandsLists(
          networkImages: [],
          pdf: [],
        ),
        adjustHieght(khieght * .02),
        // meeting history section
        // const MeetingDetailHistoryLogTabBuilder()
      ],
    );
  }
}
