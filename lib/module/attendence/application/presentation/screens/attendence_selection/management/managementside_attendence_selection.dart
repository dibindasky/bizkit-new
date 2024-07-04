import 'package:bizkit/module/attendence/application/presentation/screens/attendence_selection/management/widgets/grid_view_section.dart';
import 'package:bizkit/module/attendence/application/presentation/screens/attendence_selection/management/widgets/tabs_section.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/attendence_appbar.dart';

class AttendenceSelectionManagementSide extends StatefulWidget {
  const AttendenceSelectionManagementSide({super.key});

  @override
  _AttendenceSelectionManagementSideState createState() =>
      _AttendenceSelectionManagementSideState();
}

class _AttendenceSelectionManagementSideState
    extends State<AttendenceSelectionManagementSide>
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
              const AttendenceAppBar(title: 'Welcome Guest'),
              adjustHieght(25.h),
              TabsSection(tabController: tabController),
              adjustHieght(25.h),
              GridViewSection(tabController: tabController)
            ],
          ),
        ),
      ),
    );
  }
}
