import 'dart:developer';

import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/task/application/controller/caleder_view/calender_view.dart';
import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/application/presentation/widgets/task_container.dart';
import 'package:bizkit/module/task/domain/model/task/get_single_task_model/get_single_task_model.dart';
import 'package:bizkit/module/task/domain/model/task/spot_light_task/spot_light_task.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/refresh_indicator/refresh_custom.dart';
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
        if (taskController.taksListLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (taskController.deadlineTasks.isEmpty) {
          return ErrorRefreshIndicator(
            shrinkWrap: true,
            image: emptyNodata2,
            errorMessage: 'No tasks available',
            onRefresh: () {},
          );
        } else {
          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            itemCount: taskController.deadlineTasks.length,
            // itemCount: tasks.length,
            itemBuilder: (context, index) {
              // final task = tasks[index];
              // final deadlineTask = taskController.deadlineTasks[index];
              // final typeTask = taskController.typeTasks[index];

              return GestureDetector(
                onLongPress: () {
                  controller.longPress(index);
                },
                onTap: () {
                  if (controller.selectedFolderContainer.value) {
                    controller.longPress(index);
                  } else {
                    // log('id : ${deadlineTask.id}');
                    taskController.fetchSingleTask(
                      singleTaskModel: GetSingleTaskModel(
                          taskId: taskController.deadlineTasks[index].id),
                    );
                    if (taskController.deadlineTasks[index].isOwned == false) {
                      taskController.spotLightTask(
                          spotLightTask: SpotLightTask(
                              spotLightStatus: false,
                              taskId: taskController.deadlineTasks[index].id));
                    }
                    GoRouter.of(context).pushNamed(
                      Routes.taskDeail,
                      pathParameters: {
                        "taskId": '${taskController.deadlineTasks[index].id}'
                      },
                    );
                  }
                },
                child: TaskContainer(
                  tasksFromTasksList: true,
                  fromFolders: false,
                  tasksFromFoldrs: false,
                  tasksFromInnerFolder: false,
                  typeTask: taskController.deadlineTasks[index],
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
