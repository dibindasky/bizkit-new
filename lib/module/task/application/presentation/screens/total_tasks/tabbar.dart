import 'dart:developer';

import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/task/application/controller/caleder_view/calender_view.dart';
import 'package:bizkit/module/task/application/controller/home_controller/home_controller.dart';
import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/application/presentation/widgets/task_container.dart';
import 'package:bizkit/module/task/domain/model/task/filter_by_type_model/filter_by_type_model.dart';
import 'package:bizkit/module/task/domain/model/task/get_single_task_model/get_single_task_model.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/refresh_indicator/refresh_custom.dart';
import 'package:bizkit/utils/shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        if (taskController.filterByTypeLoading.value ||
            taskController.pinLoader.value) {
          return ShimmerLoaderTaskContainer(
            height: 50.h,
            itemCount: 10,
            width: double.infinity,
          );
        } else if (taskController.typeTasks.isEmpty) {
          return ErrorRefreshIndicator(
            image: emptyNodata2,
            errorMessage: 'No Tasks',
            onRefresh: () {
              // taskController.filterByType(
              //     filterByType: FilterByTypeModel(
              //         taskType: Get.find<TaskHomeScreenController>()
              //             .taskCategory
              //             .value
              //             .replaceAll(' ', '_')
              //             .toLowerCase()));
            },
          );
        } else {
          return RefreshIndicator(
            onRefresh: () async {
              // taskController.filterByType(
              //     filterByType: FilterByTypeModel(
              //         taskType: Get.find<TaskHomeScreenController>()
              //             .taskCategory
              //             .value
              //             .replaceAll(' ', '_')
              //             .toLowerCase()));
            },
            child: ListView.builder(
              controller: taskController.typeTasksScrollController,
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              itemCount: taskController.typeTasks.length +
                  (taskController.filterByTypeLoadMoreLoading.value ? 1 : 0),
              // itemCount: tasks.length,
              itemBuilder: (context, index) {
                // final task = tasks[index];
                // final task = taskController.allTasks[index];
                if (index == taskController.typeTasks.length &&
                    taskController.filterByTypeLoadMoreLoading.value) {
                  return ShimmerLoaderTaskContainer(
                    height: 50.h,
                    itemCount: 1,
                    width: double.infinity,
                  );
                } else {
                  final typeTask = taskController.typeTasks[index];

                  return GestureDetector(
                    onLongPress: () {
                      // controller.longPress(index);
                    },
                    onTap: () {
                      taskController.fetchSingleTask(
                          singleTaskModel:
                              GetSingleTaskModel(taskId: typeTask.id));

                      GoRouter.of(context).pushNamed(
                        Routes.taskDeail,
                        pathParameters: {"taskId": '${typeTask.id}'},
                      );
                      // log('Task id form filter by type==> ${typeTask.id}');
                    },
                    child: TaskContainer(
                      tasksFromFilterSection: true,
                      index: index,
                      typeTask: typeTask,
                    ),
                  );
                }
              },
            ),
          );
        }
      },
    );
  }
}
