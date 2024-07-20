import 'dart:developer';

import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/task/application/controller/caleder_view/calender_view.dart';
import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/application/presentation/widgets/task_container.dart';
import 'package:bizkit/module/task/domain/model/task/get_single_task_model/get_single_task_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class TaskListView extends StatelessWidget {
  TaskListView({super.key});
  final controller = Get.find<TaskCalenderViewController>();
  final taskController = Get.find<CreateTaskController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (taskController.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (taskController.deadlineTasks.isEmpty) {
          return const Center(child: Text('No Tasks'));
        } else {
          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            itemCount: taskController.deadlineTasks.length,
            // itemCount: tasks.length,
            itemBuilder: (context, index) {
              // final task = tasks[index];
              final deadlineTask = taskController.deadlineTasks[index];
              // final typeTask = taskController.typeTasks[index];

              return GestureDetector(
                onLongPress: () {
                  controller.longPress(index);
                },
                onTap: () {
                  if (controller.selectedFolderContainer.value) {
                    controller.longPress(index);
                  } else {
                    log('id : ${deadlineTask.id}');
                    taskController.fetchSingleTask(
                      singleTaskModel:
                          GetSingleTaskModel(taskId: deadlineTask.id),
                    );
                    GoRouter.of(context).push(
                      Routes.taskChatScreen,
                    );
                  }
                },
                child: TaskContainer(
                  typeTask: deadlineTask,
                  index: index,
                ),
              );
            },
          );
        }
      },
    );
  }
}
