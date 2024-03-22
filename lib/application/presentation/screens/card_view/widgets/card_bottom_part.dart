import 'package:bizkit/application/business_logic/card/card/card_bloc.dart';
import 'package:bizkit/application/presentation/screens/card_view/widgets/card_view_personal_banking_achive.dart';
import 'package:bizkit/application/presentation/screens/card_view/widgets/card_view_row_icons.dart';
import 'package:bizkit/application/presentation/screens/card_view/widgets/reminder_adding_session.dart';
import 'package:bizkit/application/presentation/screens/home/view/home_second_screen/meeting_detail_section/meeting_detail_tab/history_log_tab_builder.dart';
import 'package:bizkit/application/presentation/screens/preview_commen_widgets/brochers_and_products_builder/brocher_and_products_tab/preview_products_and_brands.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardDetailScreenSecondHalf extends StatelessWidget {
  const CardDetailScreenSecondHalf({super.key, required this.myCard});

  final bool myCard;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // add reminder button
        !myCard
            ? const CardViewAddReminderContainer()
            : const SizedBox(), // row icons call,mail,website,socialmedia ,location
        const CardViewRowWiceIcons(),
        adjustHieght(khieght * .02),
        // banking, personal, achivements butons
        const CardViewBankPersonAchivedRows(),
        adjustHieght(khieght * .02),
        // brochers and product preview sestion
        BlocBuilder<CardBloc, CardState>(
          builder: (context, state) {
            List<String> images = [];
            if (state.anotherCard != null &&
                state.anotherCard!.businessDetails != null &&
                state.anotherCard!.businessDetails!.product != null) {
              images = state.anotherCard!.businessDetails!.product!
                  .map((e) => e.product!)
                  .toList();
            }
            List<String> pdfBase64 = [];
            if (state.anotherCard != null &&
                state.anotherCard!.businessDetails != null &&
                state.anotherCard!.businessDetails!.brochure != null) {
              pdfBase64 = state.anotherCard!.businessDetails!.brochure!
                  .map((e) =>
                      e.file!.substring('data:application/pdf;base64,'.length))
                  .toList();
            }
            return PreviewProductsBrandsLists(
              networkImages: images,
              pdf: pdfBase64,
            );
          },
        ),
        adjustHieght(khieght * .02),
        // meeting history section
        !myCard
            ? const SizedBox(
                height: 300, child: MeetingDetailHistoryLogTabBuilder())
            : const SizedBox()
      ],
    );
  }
}
