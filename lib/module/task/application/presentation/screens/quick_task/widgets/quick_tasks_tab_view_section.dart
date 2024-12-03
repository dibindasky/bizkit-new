import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/application/presentation/screens/quick_task/widgets/quick_tasks_tabs/active_tasks_tab.dart';
import 'package:bizkit/module/task/application/presentation/screens/quick_task/widgets/quick_tasks_tabs/completed_tasks_tab.dart';
import 'package:flutter/material.dart';

class QuickTasksTabViewSection extends StatelessWidget {
  const QuickTasksTabViewSection({
    super.key,
    required this.tabController,
    required this.taskController,
  });

  final TabController tabController;
  final CreateTaskController taskController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        controller: tabController,
        children: [
          ActiveQuickTasksTab(taskController: taskController),
          CompletedQuickTasksTab(taskController: taskController),
        ],
      ),
    );
  }
}
