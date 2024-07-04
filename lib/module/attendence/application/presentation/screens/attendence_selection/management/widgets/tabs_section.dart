import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabsSection extends StatelessWidget {
  final TabController tabController;
  const TabsSection({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320.w,
      height: 50.h,
      child: TabBar(
        dividerColor: kblack,
        indicatorSize: TabBarIndicatorSize.tab,
        controller: tabController,
        indicator: BoxDecoration(
            color: neonShade,
            gradient: neonShadeLinearGradient,
            borderRadius: const BorderRadius.all(Radius.circular(5))),
        tabs: const [
          Text(
            'My Activities',
            style: TextStyle(color: kwhite),
          ),
          Text(
            'My Team Activities',
            style: TextStyle(color: kwhite),
          ),
        ],
      ),
    );
  }
}
