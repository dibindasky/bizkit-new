import 'package:animate_do/animate_do.dart';
import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/task/application/controller/hierarchy/hierarchy_controller.dart';
import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/application/presentation/widgets/task_container.dart';
import 'package:bizkit/module/task/domain/model/task/get_single_task_model/get_single_task_model.dart';
import 'package:bizkit/utils/shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class FilterTasksListView extends StatelessWidget {
  const FilterTasksListView({
    super.key,
    required this.fromHeirarachy,
    required this.hierarchyController,
    required this.taskController,
  });

  final bool? fromHeirarachy;
  final HierarchyController hierarchyController;
  final CreateTaskController taskController;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: fromHeirarachy == true
          ? hierarchyController.filterTasksScrollController
          : taskController.typeTasksScrollController,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      itemCount: (fromHeirarachy == true)
          ? hierarchyController.filterTasks.length +
              (hierarchyController.filterTasksLoadMoreLoading.value ? 1 : 0)
          : taskController.typeTasks.length +
              (taskController.filterByTypeLoadMoreLoading.value ? 1 : 0),
      itemBuilder: (context, index) {
        if (fromHeirarachy == true
            ? index == hierarchyController.filterTasks.length &&
                hierarchyController.filterTasksLoadMoreLoading.value
            : index == taskController.typeTasks.length &&
                taskController.filterByTypeLoadMoreLoading.value) {
          return ShimmerLoaderTaskContainer(
            height: 50.h,
            itemCount: 1,
            width: double.infinity,
          );
        } else {
          return GestureDetector(
            onLongPress: () {
              // controller.longPress(index);
            },
            onTap: () {
              if (fromHeirarachy == true) {
                hierarchyController.fetchTaskDetails(
                    taskId: GetSingleTaskModel(
                        taskId:
                            hierarchyController.filterTasks[index].id ?? ''));
                GoRouter.of(context).pushNamed(
                  Routes.taskDeail,
                  pathParameters: {
                    "taskId": hierarchyController.filterTasks[index].id ?? ''
                  },
                );
              } else {
                taskController.fetchSingleTask(
                    singleTaskModel: GetSingleTaskModel(
                        taskId: taskController.typeTasks[index].id));

                GoRouter.of(context).pushNamed(
                  Routes.taskDeail,
                  pathParameters: {
                    "taskId": '${taskController.typeTasks[index].id}'
                  },
                );
              }
            },
            child: FadeIn(
              animate: true,
              child: TaskContainer(
                fromHeirarachy: true,
                tasksFromFilterSection: true,
                index: index,
                typeTask: fromHeirarachy == true
                    ? hierarchyController.filterTasks[index]
                    : taskController.typeTasks[index],
              ),
            ),
          );
        }
      },
    );
  }
}
