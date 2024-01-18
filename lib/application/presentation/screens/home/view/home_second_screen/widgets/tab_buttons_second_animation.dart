import 'package:bizkit/application/commen/const.dart';
import 'package:bizkit/application/presentation/home/view/home_second_screen/second_screen_anime.dart';
import 'package:flutter/material.dart';

class TabButtonsSecondAnimation extends StatefulWidget {
  const TabButtonsSecondAnimation({
    super.key,
  });

  @override
  State<TabButtonsSecondAnimation> createState() =>
      _TabButtonsSecondAnimationState();
}

List tabBarNames = [
  'Archived',
  'Reminders',
  'Upcoming',
];

class _TabButtonsSecondAnimationState extends State<TabButtonsSecondAnimation>
    with ChangeNotifier, SingleTickerProviderStateMixin {
      
  List align = [Alignment.centerLeft, Alignment.center, Alignment.centerRight];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        textButton(index: 0),
        textButton(index: 1),
        textButton(index: 2),
      ],
    );
  }

  Widget textButton({required int index}) {
    return AnimatedAlign(
      duration: const Duration(milliseconds: 500),
      alignment: align[index],
      curve: Curves.fastOutSlowIn,
      child: TextButton(
        onPressed: () {
          setState(() {
            if (align[index] == Alignment.centerLeft) {
              align[align.indexWhere((e) => e == Alignment.center)] =
                  Alignment.centerLeft;
              align[index] = Alignment.center;
            } else if (align[index] == Alignment.centerRight) {
              align[align.indexWhere((e) => e == Alignment.center)] =
                  Alignment.centerRight;
              align[index] = Alignment.center;
            }
            selectedTabNotifier.value =
                tabBarNames[align.indexWhere((e) => e == Alignment.center)];
            selectedTabNotifier.notifyListeners();
          });
        },
        child: Text(
          tabBarNames[index],
          style: TextStyle(
            fontSize: align[index] == Alignment.center
                ? kwidth * 0.045
                : kwidth * 0.035,
            fontWeight: FontWeight.w700,
            color: align[index] == Alignment.center ? kwhite : klightgrey,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // implement dispose
    super.dispose();
  }
}
