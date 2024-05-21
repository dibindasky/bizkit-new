import 'package:bizkit/core/routes/fade_transition/fade_transition.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_view/widgets/banking_and_personal_detail_card_view.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/create_business_card/view/screens/progeress_indicator_start/linear_progress_indicator/personal_detail_screen/achevements/achivements_screen.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardViewBankPersonAchivedRows extends StatelessWidget {
  const CardViewBankPersonAchivedRows({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Banking
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 5, right: 7),
            child: InkWell(
              onTap: () => Navigator.of(context).push(
                fadePageRoute(const ScreenPreviewBankOrPersnalCArdView(
                  isFromBankScreen: true,
                )),
              ),
              child: containerStyle(iconBankingHouse, 'Banking'),
            ),
          ),
        ),
        // Personal
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 5, right: 7),
            child: InkWell(
              onTap: () => Navigator.of(context).push(fadePageRoute(
                const ScreenPreviewBankOrPersnalCArdView(
                  isFromBankScreen: false,
                ),
              )),
              child: containerStyle(iconPersonOutline, 'Personal'),
            ),
          ),
        ),
        // Achivements
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 5, right: 7),
            child: InkWell(
              onTap: () => Navigator.of(context).push(
                fadePageRoute(const AchivementsScreen(isPreview: false)),
              ),
              child: containerStyle(iconAchivementsMedal, 'Achieved'),
            ),
          ),
        )
      ],
    );
  }

  Widget containerStyle(String image, String text) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: lightColr,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: Image.asset(image)),
          Text(text, style: TextStyle(fontSize: 10.sp)),
        ],
      ),
    );
  }
}
