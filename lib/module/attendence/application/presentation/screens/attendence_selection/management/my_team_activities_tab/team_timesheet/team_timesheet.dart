import 'package:bizkit/module/attendence/application/presentation/screens/attendence_selection/management/my_team_activities_tab/team_timesheet/widgets/employes_listview.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/team_timesheet_appbar.dart';
import 'widgets/team_timesheet_searchbar.dart';

class AttendenceMsTeamTimesheetScreen extends StatelessWidget {
  const AttendenceMsTeamTimesheetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 17.0, right: 17.0, top: 24),
          child: Column(
            children: [
              const AttendenceMsTeamTimesheetAppbar(),
              adjustHieght(10.h),
              const AttendenceMsTeamTimesheetSearchBar(),
              const EmployesListView()
            ],
          ),
        ),
      ),
    );
  }
}
