import 'package:bizkit/application/presentation/screens/home/view/home_first_screen/first_half_sction/home_first_my_cnnection_listview_outer.dart';
import 'package:bizkit/application/presentation/screens/home/view/home_first_screen/first_half_sction/my_cards_and_add_card.dart';
import 'package:bizkit/application/presentation/screens/home/view/home_first_screen/first_half_sction/home_first_app_bar.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class HomeFirstMainScreen extends StatelessWidget {
  const HomeFirstMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kwidth * 1.123,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HomeFirstAppBar(),
            adjustHieght(khieght * .02),
            const HomeFirstMyCardsAndAddCardSection(),
            adjustHieght(khieght * .03),
            const HomeFirstMyConnectionListviewOuter(),
          ],
        ),
      ),
    );
  }
}
