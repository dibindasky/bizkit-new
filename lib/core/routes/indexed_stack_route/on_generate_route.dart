import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/task/application/presentation/screens/create_task/add_task.dart';
import 'package:bizkit/module/task/application/presentation/screens/home/task_home.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  Route onGenerateRoute(RouteSettings settings) {
    // final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.taskHome:
        return MaterialPageRoute(builder: (ctx) => const ScreenTaskHome());
      case Routes.addTask:
        return MaterialPageRoute(builder: (ctx) => const ScreenAddTask());
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
