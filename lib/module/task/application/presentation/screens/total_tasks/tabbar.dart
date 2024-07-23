import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/task/application/controller/caleder_view/calender_view.dart';
import 'package:bizkit/module/task/application/controller/home_controller/home_controller.dart';
import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/application/presentation/widgets/task_container.dart';
import 'package:bizkit/module/task/domain/model/task/filter_by_type_model/filter_by_type_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class TotalTaskListView extends StatelessWidget {
  TotalTaskListView({super.key});
  final controller = Get.find<TaskCalenderViewController>();
  final taskController = Get.find<CreateTaskController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (taskController.isLoading.value || taskController.pinLoader.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (taskController.typeTasks.isEmpty) {
          return const Center(
            child: Text('No Tasks'),
          );
        } else {
          return RefreshIndicator(
            onRefresh: () async {
              taskController.filterByType(
                  filterByType: FilterByTypeModel(
                      taskType: Get.find<TaskHomeScreenController>()
                          .taskCategory
                          .value
                          .replaceAll(' ', '_')
                          .toLowerCase()));
            },
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              itemCount: taskController.typeTasks.length,
              // itemCount: tasks.length,
              itemBuilder: (context, index) {
                // final task = tasks[index];
                // final task = taskController.allTasks[index];
                final typeTask = taskController.typeTasks[index];

                return GestureDetector(
                  onLongPress: () {
                    controller.longPress(index);
                  },
                  onTap: () {
                    if (controller.selectedFolderContainer.value) {
                      controller.longPress(index);
                    } else {
                      GoRouter.of(context).push(Routes.taskChatScreen);
                    }
                  },
                  child: TaskContainer(
                    index: index,
                    typeTask: typeTask,
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
