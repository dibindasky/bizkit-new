import 'package:bizkit/application/presentation/screens/home/view/home_first_screen/first_half_sction/my_connections/my_connection_detail_first_half/add_reminder_container/reminder_section.dart';
import 'package:bizkit/application/presentation/screens/preview_commen_widgets/banking_personal_achieved/bank_person_achived_rows.dart';
import 'package:bizkit/application/presentation/screens/preview_commen_widgets/brochers_and_products_builder/brocher_and_products_tab/preview_products_and_brands.dart';
import 'package:bizkit/application/presentation/screens/preview_commen_widgets/preview_row_vice_icons/preview_row_wice_icons.dart';
import 'package:bizkit/application/presentation/screens/home/view/home_second_screen/meeting_detail_section/meeting_detail_tab/history_log_tab_builder.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class MyConnectionDetailScreenSecondHalf extends StatelessWidget {
  const MyConnectionDetailScreenSecondHalf({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const PreviewHomeContactDetailAddReminderContainer(),
        const PreviewRowWiceIcons(),
        adjustHieght(khieght * .02),
        const PreviewBankPersonAchivedRows(),
        adjustHieght(khieght * .02),
        const PreviewProductsBrandsLists(fileImages: []),
        adjustHieght(khieght * .02),
        const MeetingDetailHistoryLogTabBuilder()
      ],
    );
  }
}
