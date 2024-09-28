import 'dart:developer';

import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/attendence/application/presentation/screens/attendence_selection/management/managementside_attendence_selection.dart';
import 'package:bizkit/module/attendence/application/presentation/screens/attendence_selection/management/my_team_activities_tab/calendar/calendar_screen.dart';
import 'package:bizkit/module/attendence/application/presentation/screens/attendence_selection/management/my_team_activities_tab/calendar/widgets/add_new_holiday_screen.dart';
import 'package:bizkit/module/attendence/application/presentation/screens/attendence_selection/management/my_team_activities_tab/leave%20&%20requests/leave_and_requests.dart';
import 'package:bizkit/module/attendence/application/presentation/screens/attendence_selection/management/my_team_activities_tab/leave%20&%20requests/widgets/leave_request_detailed_view.dart';
import 'package:bizkit/module/attendence/application/presentation/screens/attendence_selection/management/my_team_activities_tab/pelt&pell/pelt_and_pell.dart';
import 'package:bizkit/module/attendence/application/presentation/screens/attendence_selection/management/my_team_activities_tab/pelt&pell/widgets/change_pelt_and_pell_view.dart';
import 'package:bizkit/module/attendence/application/presentation/screens/attendence_selection/management/my_team_activities_tab/team_timesheet/team_timesheet.dart';
import 'package:bizkit/module/attendence/application/presentation/screens/attendence_selection/management/my_team_activities_tab/team_timesheet/widgets/employee_attendence_view.dart';
import 'package:bizkit/module/attendence/application/presentation/screens/attendence_selection/user/attendence_selection.dart';
import 'package:bizkit/module/attendence/application/presentation/screens/attendence_selection/user/calender/calender_screen.dart';
import 'package:bizkit/module/attendence/application/presentation/screens/attendence_selection/user/calender/widgets/employe_leave_view.dart';
import 'package:bizkit/module/attendence/application/presentation/screens/attendence_selection/user/leaves/leaves_screen.dart';
import 'package:bizkit/module/attendence/application/presentation/screens/attendence_selection/user/leaves/widgets/add_new_leave.dart';
import 'package:bizkit/module/attendence/application/presentation/screens/attendence_selection/user/pelt&pell/pelt_and_pell_screen.dart';
import 'package:bizkit/module/attendence/application/presentation/screens/attendence_selection/user/pelt&pell/widgets/pelt_and_pell_request_to_change.dart';
import 'package:bizkit/module/attendence/application/presentation/screens/attendence_selection/user/report/report_screen.dart';
import 'package:bizkit/module/attendence/application/presentation/screens/attendence_selection/user/report/widgets/create_new_report.dart';
import 'package:bizkit/module/attendence/application/presentation/screens/attendence_selection/user/report/widgets/report_history.dart';
import 'package:bizkit/module/attendence/application/presentation/screens/attendence_selection/user/team_timesheet/teamtime_sheet_screen.dart';
import 'package:bizkit/module/attendence/application/presentation/screens/attendence_selection/user/timesheet/time_sheet_screen.dart';
import 'package:bizkit/module/attendence/application/presentation/screens/home/home_screen.dart';
import 'package:bizkit/module/task/application/presentation/screens/calender_view/calender_view.dart';
import 'package:bizkit/module/task/application/presentation/screens/calender_view/folder/inside_the_inner_folder.dart';
import 'package:bizkit/module/task/application/presentation/screens/calender_view/heirarchy/hierarchy_tile.dart';
import 'package:bizkit/module/task/application/presentation/screens/create_task/add_task.dart';
import 'package:bizkit/module/task/application/presentation/screens/create_task/edit_task.dart';
import 'package:bizkit/module/task/application/presentation/screens/generate_report/widgets/reports_view.dart';
import 'package:bizkit/module/task/application/presentation/screens/generate_report/widgets/search_tasks.dart';
import 'package:bizkit/module/task/application/presentation/screens/home/notification/notofication.dart';
import 'package:bizkit/module/task/application/presentation/screens/home/notification/tab_notification/tab_notification.dart';
import 'package:bizkit/module/task/application/presentation/screens/home/task_home.dart';
import 'package:bizkit/module/task/application/presentation/screens/home/widgets/task_search.dart';
import 'package:bizkit/module/task/application/presentation/screens/total_tasks/total_tasks.dart';
import 'package:flutter/material.dart';

import '../../../module/attendence/application/presentation/screens/attendence_selection/user/rules/rules_screen.dart';

class RouteGenerator {
  Route onGenerateRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    //Task section
    switch (settings.name) {
      case Routes.taskHome:
        return MaterialPageRoute(builder: (ctx) => const ScreenTaskHome());
      case Routes.taskSearch:
        return MaterialPageRoute(
          builder: (ctx) => const TaskSearchScreen(),
        );
      case Routes.taskLists:
        return MaterialPageRoute(
            builder: (ctx) => const ScreenTotalTasksScreen());
      case Routes.addTask:
        if (arguments is int) {
          return MaterialPageRoute(
            builder: (ctx) => ScreenAddTask(
              navigationId: arguments,
            ),
          );
        } else {
          return _errorScreen();
        }

      case Routes.taskInsideTheInnerFolderScreen:
        if (arguments is Map<String, dynamic>?) {
          return MaterialPageRoute(
            builder: (ctx) => TaskInsideTheInnerFolderScreen(
              arguments: arguments,
            ),
            settings: RouteSettings(arguments: arguments),
          );
        } else {
          return _errorScreen();
        }

      case Routes.editTask:
        return MaterialPageRoute(builder: (ctx) => ScreenEditTask());
      case Routes.taskNotification:
        return MaterialPageRoute(builder: (ctx) => const NotoficationBuilder());

      case Routes.taskTabNotification:
        return MaterialPageRoute(builder: (ctx) => TaskTabNotification());

      case Routes.cardDetailView:
        return MaterialPageRoute(
            builder: (ctx) => const ScreenTaskCalenderView());
      case Routes.generateTasksSearch:
        return MaterialPageRoute(builder: (ctx) => const SearchTasksWidget());
      case Routes.reportsview:
        return MaterialPageRoute(builder: (ctx) => const ReportsView());

      case Routes.heirarchyUserDetail:
        if (arguments is String) {
          return MaterialPageRoute(
            builder: (context) => ScreenHeirarchyTaskUserDetails(
              folderId: arguments,
            ),
          );
        } else {
          return _errorScreen();
        }

      //Attendence Module
      case Routes.attendenceHome:
        return MaterialPageRoute(
            builder: (ctx) => const AttendenceHomeScreen());
      case Routes.attendenceSelection:
        return MaterialPageRoute(builder: (ctx) => const AttendenceSelection());
      case Routes.attendenceTimeSheet:
        return MaterialPageRoute(
            builder: (ctx) => const AttendenceTimeSheetScreen());
      case Routes.attendenceLeaves:
        return MaterialPageRoute(
            builder: (ctx) => const AttendenceLeavesScreeen());
      case Routes.attendenceRules:
        return MaterialPageRoute(builder: (ctx) => AttendenceRulesScreen());
      case Routes.attendenceTeamTimeSheet:
        return MaterialPageRoute(
            builder: (ctx) => const AttendenceTeamTimeSheetScreen());
      case Routes.attendenceReport:
        return MaterialPageRoute(
            builder: (ctx) => const AttendenceReportScreen());
      case Routes.attendenceCalender:
        return MaterialPageRoute(
            builder: (ctx) => const AttendenceCalenderScreen());
      case Routes.attendencePeltAndPell:
        return MaterialPageRoute(
            builder: (ctx) => const AttendencePeltAndPellScreen());
      case Routes.attendenceAddNewLeave:
        return MaterialPageRoute(
            builder: (ctx) => const AttendenceAddNewLeaveScreen());
      case Routes.attendenceCreateNewReport:
        return MaterialPageRoute(
            builder: (ctx) => const AttendenceCreateNewReportScreen());
      case Routes.attendenceReportHistory:
        return MaterialPageRoute(
            builder: (ctx) => const AttendenceReportHistoryScreen());
      case Routes.attendencePeltAndPellRequestChange:
        return MaterialPageRoute(
            builder: (ctx) => AttendencePPRequestToChangeScreen());
      case Routes.attendenceEmployeeLeaveView:
        return MaterialPageRoute(builder: (ctx) => EmployeeLeaveView());

// Attendence Module Management Side
      case Routes.attendenceSelectionManagementSide:
        return MaterialPageRoute(
            builder: (ctx) => const AttendenceSelectionManagementSide());
      case Routes.attendenceMSLeaveAndRequests:
        return MaterialPageRoute(
            builder: (ctx) => const AttendenceMSLeaveAndRequestsScreen());
      case Routes.attendenceMsLeaveRequestDetailedView:
        return MaterialPageRoute(
            builder: (ctx) =>
                const AttendenceMsLeaveRequestDetailedViewScreen());
      case Routes.attendenceMsCalendar:
        return MaterialPageRoute(
            builder: (ctx) => const AttendenceMsCalendarScreen());
      case Routes.attendenceMsPeltAndPell:
        return MaterialPageRoute(
            builder: (ctx) => const AttendenceMsPeltAndPellScreen());
      case Routes.attendenceMsTeamTimeSheet:
        return MaterialPageRoute(
            builder: (ctx) => const AttendenceMsTeamTimesheetScreen());
      case Routes.attendenceMsAddNewHoliday:
        return MaterialPageRoute(
            builder: (ctx) => const AttendenceMsAddNewHolidayScreen());
      case Routes.attendenceMsChangePeltAndPell:
        return MaterialPageRoute(
            builder: (ctx) => const AttendenceMsChangePeltAndPellView());
      case Routes.attendenceEmployeeAttendanceCard:
        if (arguments is Map<String, dynamic>?) {
          return MaterialPageRoute(
            builder: (ctx) => EmployeeAttendanceCard(
              arguments: arguments,
            ),
            settings: RouteSettings(arguments: arguments),
          );
        } else {
          return _errorScreen();
        }

      default:
        return _errorScreen();
    }
  }

  Route _errorScreen() {
    return MaterialPageRoute(builder: (ctx) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Error"),
        ),
        body: const Center(
          child: Text("Error while navigating"),
        ),
      );
    });
  }
}
