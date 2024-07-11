import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/task/application/controller/caleder_view/calender_view.dart';
import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/application/presentation/widgets/task_container.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class TaskListView extends StatelessWidget {
  TaskListView({super.key});
  final controller = Get.find<TaskCalenderViewController>();
  final taskController = Get.find<CreateTaskController>();

  @override
  Widget build(BuildContext context) {
    if (taskController.allTasks.isEmpty) {
      return Center(
        child: Image.asset(
          emptyNodata3,
          width: 250,
        ),
      );
    } else {
      return ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        itemCount: taskController.allTasks.length,
        // itemCount: tasks.length,
        itemBuilder: (context, index) {
          // final task = tasks[index];
          final task = taskController.allTasks[index];
          return GestureDetector(
            onLongPress: () {
              bool isSelected = !controller.selectedIndices.contains(index);
              controller.longPress(isSelected, index);
            },
            onTap: () {
              if (controller.selectedFolderContainer.value) {
                bool isSelected = !controller.selectedIndices.contains(index);
                controller.longPress(isSelected, index);
              } else {
                GoRouter.of(context).push(Routes.taskChatScreen);
              }
            },
            child: TaskContainer(
              task: task,
              index: index,
            ),
          );
        },
      );
    }
  }
}
