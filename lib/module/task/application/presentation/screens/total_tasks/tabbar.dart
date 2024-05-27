import 'package:bizkit/module/task/application/presentation/widgets/task_container.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter/material.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        return TaskContainer(task: task);
      },
    );
  }
}
