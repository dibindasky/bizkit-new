import 'package:bizkit/module/attendence/application/presentation/screens/attendence_selection/management/my_team_activities_tab/team_timesheet/widgets/employee_timesheet_container.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';

class EmployesListView extends StatelessWidget {
  const EmployesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 10.0),
        child: ListView.separated(
          separatorBuilder: (context, index) => kHeight5,
          itemCount: 15,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return const EmployeeTimeSheetContainer(
              employeProfile: personDemoImg,
              attendence: 'Leave',
              employeDesignation: 'UI/UX Designer',
              employeName: 'Darrell Steward',
              attendenceColor: kyellow,
            );
          },
        ),
      ),
    );
  }
}
