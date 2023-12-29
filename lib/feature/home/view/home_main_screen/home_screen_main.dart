import 'package:bizkit/feature/home/view/home_main_screen/widgets/home_screen_first_part.dart';
import 'package:bizkit/feature/home/view/home_main_screen/widgets/home_screen_second_part.dart';
import 'package:bizkit/feature/home/view/home_second_screen/second_screen_anime.dart';
import 'package:bizkit/feature/home/view/home_second_screen/widgets/pageview_detail_screen.dart';
import 'package:flutter/material.dart';

enum HomeScreensList{first,second,third}
ValueNotifier<HomeScreensList> showCardsNotifier = ValueNotifier(HomeScreensList.first);

class SplitScreen extends StatelessWidget {
  const SplitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ValueListenableBuilder(
        valueListenable: showCardsNotifier,
        builder: (context, value, child) {
          if (value==HomeScreensList.first) {
            return const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [HomeScreenFirstPart(), HomeScreenSecondPart()],
            );
          }else if (value==HomeScreensList.second){
            return const SecondAnimation();
          }else{
            return const SecondHomeScreenPAgeviewMeetingScreen();
          }
        },
      )),
    );
  }
}