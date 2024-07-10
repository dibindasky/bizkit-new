import 'package:bizkit/module/attendence/application/presentation/screens/attendence_selection/management/my_team_activities_tab/leave%20&%20requests/widgets/appbar.dart';
import 'package:bizkit/module/attendence/application/presentation/screens/attendence_selection/management/my_team_activities_tab/leave%20&%20requests/widgets/search_bar.dart';
import 'package:bizkit/module/attendence/application/presentation/screens/attendence_selection/management/my_team_activities_tab/leave%20&%20requests/widgets/tabs_section.dart';
import 'package:bizkit/module/attendence/application/presentation/screens/attendence_selection/management/my_team_activities_tab/leave%20&%20requests/widgets/tabs_view_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../../utils/constants/colors.dart';

class AttendenceMSLeaveAndRequestsScreen extends StatefulWidget {
  const AttendenceMSLeaveAndRequestsScreen({super.key});

  @override
  State<AttendenceMSLeaveAndRequestsScreen> createState() =>
      _AttendenceMSLeaveAndRequestsScreenState();
}

class _AttendenceMSLeaveAndRequestsScreenState
    extends State<AttendenceMSLeaveAndRequestsScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(
      length: 2,
      vsync: this,
    );
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 14.0, right: 14.0, top: 24),
          child: Column(
            children: [
              const AttendenceMsLeavesAppbar(title: 'Leaves Requests'),
              adjustHieght(20.h),
              const AttendenceMsLeaveRequestsSearchBar(),
              adjustHieght(20.h),
              AttedenceMsLeavesAndRequestsTabsSection(
                tabController: tabController,
              ),
              adjustHieght(25.h),
              AttedenceMsLeavesAndRequestsTabsViewsSection(
                tabController: tabController,
              )
            ],
          ),
        ),
      ),
    );
  }
}
