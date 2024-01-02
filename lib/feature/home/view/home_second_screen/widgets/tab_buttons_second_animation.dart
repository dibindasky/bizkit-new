import 'package:bizkit/core/const.dart';
import 'package:bizkit/feature/home/view/home_second_screen/second_screen_anime.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    with TickerProviderStateMixin, ChangeNotifier {
  int selectedIndex = 0;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        textButton(index: 0),
        textButton(index: 1),
        textButton(index: 2),
      ],
    );
  }

  Widget textButton({required int index}) {
    return FadeTransition(
      opacity: _animationController,
      child: TextButton(
        onPressed: () {
          setState(() {
            String temp = tabBarNames[index];
            tabBarNames[index] = tabBarNames[1];
            tabBarNames[1] = temp;
            _animationController.forward(from: 0);
            selectedTabNotifier.value = tabBarNames[1];
            selectedTabNotifier.notifyListeners();
          });
        },
        child: Text(
          tabBarNames[index],
          style: TextStyle(
            fontSize: index == 1 ? 16.sp : 14.sp,
            fontWeight: FontWeight.w700,
            color: index == 1 ? kwhite : klightgrey,
          ),
        ),
      ),
    );
  }

  // void animate(AnimationController controller1, AnimationController controller2,
  //     Animation<Offset> offset1, Animation<Offset> offset2) {}
}
