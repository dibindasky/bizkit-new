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
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 1.0, vertical: 10.0),
          child: Column(
            children: [
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) => kHeight5,
                itemCount: 2,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return const EmployeeTimeSheetContainer(
                    employeProfile: chatSectionPersonDummyImg1,
                    attendence: 'Leaves',
                    employeDesignation: 'UI/UX Designer',
                    employeName: 'Darrell Steward',
                    attendenceColor: kyellow,
                  );
                },
              ),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) => kHeight5,
                itemCount: 1,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return const EmployeeTimeSheetContainer(
                    employeProfile: dummyImg3,
                    attendence: 'Permit',
                    employeDesignation: 'Software Developer',
                    employeName: 'Courtney Henry',
                    attendenceColor: kblue,
                  );
                },
              ),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) => kHeight5,
                itemCount: 3,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return const EmployeeTimeSheetContainer(
                    employeProfile: chatSectionPersonDummyImg2,
                    attendence: 'On Work',
                    employeDesignation: 'UI/UX Designer',
                    employeName: 'Albert Flores',
                    attendenceColor: kgreen,
                  );
                },
              ),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) => kHeight5,
                itemCount: 1,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return const EmployeeTimeSheetContainer(
                    employeProfile: dummyImg3,
                    attendence: 'Off Day',
                    employeDesignation: 'Software Developer',
                    employeName: 'Leslie Alexander',
                    attendenceColor: kgrey,
                  );
                },
              ),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) => kHeight5,
                itemCount: 2,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return const EmployeeTimeSheetContainer(
                    employeProfile: chatSectionPersonDummyImg1,
                    attendence: 'Leave',
                    employeDesignation: 'UI/UX Designer',
                    employeName: 'Darrell Steward',
                    attendenceColor: kyellow,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
