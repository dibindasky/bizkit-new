import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/screens/home/view/home_first_screen/home_first_screen.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget homeAppbarSecondAndThird(
    {List<AnimationController>? animationController}) {
  return PreferredSize(
    preferredSize: Size(kwidth, kwidth * 0.15),
    child: GestureDetector(
      onVerticalDragDown: (details) {
        if (animationController == null) return;
        animationController[0].reverse();
        animationController[2]
            .reverse()
            .whenComplete(() => animationController[1].reverse());
        showCardsNotifier.value = HomeScreensList.first;
        showCardsNotifier.notifyListeners();
      },
      child: AppBar(
        backgroundColor: backgroundColour,
        foregroundColor: kwhite,
        leadingWidth: kwidth * 0.35,
        leading: Row(
          children: [
            SizedBox(width: kwidth * 0.05),
            Text(
              'Todays\nReminders',
              style: custumText(
                  fontSize: kwidth * 0.05, fontWeight: FontWeight.w700),
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.filter_alt))
        ],
      ),
    ),
  );
}
