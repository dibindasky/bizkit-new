import 'package:bizkit/application/presentation/screens/home/view/first_and_second_commen/pageview_location_datas.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/screens/home/view/home_first_screen/home_first_screen.dart';
import 'package:bizkit/application/presentation/screens/home/view/home_second_screen/widgets/tabbar_with_containers.dart';
import 'package:flutter/material.dart';

class SecondHomeScreenPAgeviewMeetingScreen extends StatelessWidget {
  const SecondHomeScreenPAgeviewMeetingScreen({super.key, this.fadeCallBack});

  final VoidCallback? fadeCallBack;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            fadeCallBack != null
                ? adjustHieght(khieght * .02)
                : adjustHieght(khieght * 0.1),
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  height: khieght * .75,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: neonShade,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: HomeSecondScreenPageviewLocationRows(),
                      ),
                      adjustHieght(khieght * .02),
                      const Expanded(
                        child: PreviewScreenDetailMeetingTabBarHomeScreen(),
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: () {
                      if (fadeCallBack != null) {
                        showCardsNotifier.value = HomeScreensList.second;
                        showCardsNotifier.notifyListeners();
                        fadeCallBack!();
                      } else {
                        Navigator.pop(context);
                      }
                    },
                    child: const CircleAvatar(
                      radius: 15,
                      backgroundColor: neonShade,
                      child: Icon(
                        Icons.close,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
