import 'package:bizkit/module/attendence/application/presentation/screens/attendence_selection/management/my_team_activities_tab/calendar/widgets/tabs_view_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../../utils/constants/colors.dart';
import 'widgets/appbar.dart';
import 'widgets/tabs_section.dart';

class AttendenceMsCalendarScreen extends StatefulWidget {
  const AttendenceMsCalendarScreen({super.key});

  @override
  State<AttendenceMsCalendarScreen> createState() =>
      _AttendenceMsCalendarScreenState();
}

class _AttendenceMsCalendarScreenState extends State<AttendenceMsCalendarScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final TabController tabController = TabController(length: 3, vsync: this);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 17.0, right: 17.0, top: 24),
          child: Column(
            children: [
              const AttendenceMsCalendarAppbar(),
              adjustHieght(20.h),
              AttendenceMsCalendarTabsSection(
                tabController: tabController,
              ),
              adjustHieght(25.h),
              AttendenceMsCalendarTabsViewSection(
                tabController: tabController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
