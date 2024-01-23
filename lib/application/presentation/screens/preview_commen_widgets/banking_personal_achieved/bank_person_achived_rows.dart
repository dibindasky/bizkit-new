import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/screens/progeress_indicator_start/containers/personal_detail_screen/accolades/add_accolades.dart';
import 'package:bizkit/application/presentation/screens/preview_commen_widgets/achieved_screen.dart';
import 'package:bizkit/application/presentation/screens/preview_commen_widgets/banking_personal_achieved/banking_and_presonal_screens.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/fade_transition/fade_transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PreviewBankPersonAchivedRows extends StatelessWidget {
  const PreviewBankPersonAchivedRows({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String first = 'asset/images/banking.png';
    String scnd = 'asset/images/persona.png';
    String third = 'asset/images/achieved.png';

    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 5, right: 7),
            child: InkWell(
              onTap: () => Navigator.of(context).push(
                fadePageRoute(const PreviewBankOrPersnalScreen(
                  isFromBankScreen: true,
                )),
              ),
              child: containerStyle(first, 'Banking'),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 5, right: 7),
            child: InkWell(
              onTap: () => Navigator.of(context).push(fadePageRoute(
                const PreviewBankOrPersnalScreen(
                  isFromBankScreen: false,
                ),
              )),
              child: containerStyle(scnd, 'Personal'),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 5, right: 7),
            child: InkWell(
              onTap: () => Navigator.of(context).push(
                fadePageRoute(const AccolodesScreen()),
              ),
              child: containerStyle(third, 'Achieved'),
            ),
          ),
        )
      ],
    );
  }

  Widget containerStyle(String scnd, String text) {
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
          Image.asset(scnd),
          Text(text, style: TextStyle(fontSize: 10.sp)),
        ],
      ),
    );
  }
}
