import 'package:bizkit/core/const.dart';
import 'package:bizkit/feature/home/view/home_main_screen/home_screen_main.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget homeAppbarSecondAndThird(
    {AnimationController? animationController}) {
  return PreferredSize(
    preferredSize: Size(kwidth, kwidth * 0.15),
    child: GestureDetector(
      onVerticalDragDown: (details) {
        if (animationController == null) return;
        animationController.reverse();
        showCardsNotifier.value = HomeScreensList.first;
        showCardsNotifier.notifyListeners();
      },
      child: AppBar(
        foregroundColor: kwhite,
        leadingWidth: kwidth * 0.30,
        leading: Row(
          children: [
            SizedBox(width: kwidth * 0.05),
            Text(
              'Todays\nReminders',
              style: textHeadStyle1,
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
