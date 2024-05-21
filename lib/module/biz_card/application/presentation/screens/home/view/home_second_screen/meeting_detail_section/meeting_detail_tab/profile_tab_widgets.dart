import 'package:bizkit/module/biz_card/application/presentation/screens/preview_commen_widgets/banking_personal_achieved/bank_person_achived_rows.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/preview_commen_widgets/brochers_and_products_builder/brocher_and_products_tab/preview_products_and_brands.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/preview_commen_widgets/preview_row_vice_icons/preview_row_wice_icons.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class MeetingDetailProfileTabWidgets extends StatelessWidget {
  const MeetingDetailProfileTabWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            const PreviewRowWiceIcons(fromPreview: false),
            adjustHieght(khieght * .01),
            const PreviewBankPersonAchivedRows(fromPreview: false),
            adjustHieght(khieght * .02),
            const PreviewProductsBrandsLists(networkImages: [], pdf: []),
            adjustHieght(khieght * .02),
          ],
        ),
      ),
    );
  }
}
