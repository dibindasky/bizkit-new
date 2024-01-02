import 'package:bizkit/core/const.dart';
import 'package:bizkit/feature/home/view/home_main_screen/home_screen_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

PreferredSizeWidget homeAppbarSecondAndThird({AnimationController? animationController}) {
  return PreferredSize(
    preferredSize: Size(kwidth, kwidth * 0.15),
    child: GestureDetector(
      onVerticalDragDown: (details) {
        if(animationController==null)return;
        animationController.reverse();
        showCardsNotifier.value = HomeScreensList.first;
        showCardsNotifier.notifyListeners();
      },
      child: AppBar(
        foregroundColor: kwhite,
        leadingWidth: kwidth * 0.25,
        leading: Row(
          children: [
            SizedBox(width: kwidth * 0.05),
            Text(
              'Todays\nReminders',
              style: TextStyle(
                  fontFamily: 'Euclid',
                  fontWeight: FontWeight.w700,
                  fontSize: 17.sp),
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
