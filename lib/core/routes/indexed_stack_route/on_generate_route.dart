import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/task/application/presentation/screens/calender_view/calender_view.dart';
import 'package:bizkit/module/task/application/presentation/screens/calender_view/heirarchy/hierarchy_tile.dart';
import 'package:bizkit/module/task/application/presentation/screens/create_task/add_task.dart';
import 'package:bizkit/module/task/application/presentation/screens/home/notification/notofication.dart';
import 'package:bizkit/module/task/application/presentation/screens/home/notification/tab_notification/tab_notification.dart';
import 'package:bizkit/module/task/application/presentation/screens/home/task_home.dart';
import 'package:bizkit/module/task/application/presentation/screens/total_tasks/total_tasks.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  Route onGenerateRoute(RouteSettings settings) {
    // final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.taskHome:
        return MaterialPageRoute(builder: (ctx) => const ScreenTaskHome());
      case Routes.taskLists:
        return MaterialPageRoute(
            builder: (ctx) => const ScreenTotalTasksScreen());
      case Routes.addTask:
        return MaterialPageRoute(builder: (ctx) => const ScreenAddTask());
      case Routes.taskNotification:
        return MaterialPageRoute(builder: (ctx) => const NotoficationBuilder());
      case Routes.taskTabNotification:
        return MaterialPageRoute(builder: (ctx) => const TaskTabNotification());
      case Routes.cardDetailView:
        return MaterialPageRoute(builder: (ctx) => ScreenTaskCalenderView());
      case Routes.heirarchyUserDetail:
        return MaterialPageRoute(
            builder: (ctx) => const ScreenHeirarchyTaskUserDetails());
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
