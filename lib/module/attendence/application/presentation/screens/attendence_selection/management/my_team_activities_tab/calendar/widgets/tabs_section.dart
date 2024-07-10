import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../../../utils/constants/colors.dart';

class AttendenceMsCalendarTabsSection extends StatelessWidget {
  final TabController tabController;
  const AttendenceMsCalendarTabsSection(
      {super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320.w,
      height: 40.h,
      child: TabBar(
        indicatorSize: TabBarIndicatorSize.tab,
        controller: tabController,
        dividerColor: kblack,
        indicatorColor: neonShade,
        labelColor: kblack,
        unselectedLabelColor: kgrey,
        labelStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 13,
        ),
        indicator: const BoxDecoration(
          color: neonShade,
          gradient: LinearGradient(colors: [neonShade, neonShade]),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        tabs: const [
          Text(
            'All',
          ),
          Text(
            'Holidays',
          ),
          Text(
            'Leaves',
          ),
        ],
      ),
    );
  }
}
