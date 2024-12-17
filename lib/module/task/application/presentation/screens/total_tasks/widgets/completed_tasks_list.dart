import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/domain/model/task/get_single_task_model/get_single_task_model.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../utils/refresh_indicator/refresh_custom.dart';

class CompletedTasksListView extends StatelessWidget {
  const CompletedTasksListView({super.key});

  @override
  Widget build(BuildContext context) {
    final taskController = Get.find<CreateTaskController>();
    return Obx(
      () {
        if (taskController.filterByTypeLoading.value) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
            child: ShimmerLoaderTaskContainer(
              height: 50.h,
              itemCount: 10,
              width: double.infinity,
            ),
          );
        } else if (taskController.completedTasks.isEmpty) {
          return ErrorRefreshIndicator(
            image: emptyNodata2,
            errorMessage: 'No completed tasks',
            onRefresh: () {
              taskController.fetchAllCompletedTasks();
            },
          );
        } else {
          return RefreshIndicator(
            onRefresh: () async {
              taskController.fetchAllCompletedTasks();
            },
            child: ListView.builder(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
              itemCount: taskController.completedTasks.length,
              itemBuilder: (context, index) {
                final typeTask = taskController.completedTasks[index];

                return GestureDetector(
                  onTap: () {
                    taskController.fetchSingleTask(
                        singleTaskModel:
                            GetSingleTaskModel(taskId: typeTask.taskId));

                    GoRouter.of(context).pushNamed(
                      Routes.taskDeail,
                      pathParameters: {"taskId": '${typeTask.taskId}'},
                    );
                  },
                  child: Card(
                    elevation: 1,
                    margin: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              adjustWidth(10),
                              Expanded(
                                child: Text(
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
                                  typeTask.taskTitle ?? '',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall
                                      ?.copyWith(fontSize: 14),
                                ),
                              ),
                              adjustWidth(15),
                            ],
                          ),
                          adjustHieght(5.h),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  typeTask.deadLine ?? '',
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall
                                      ?.copyWith(fontSize: 10),
                                ),
                                Text(
                                    maxLines: 1,
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                    typeTask.isOwned == true
                                        ? 'Created by  ${typeTask.createdBy?.name ?? 'no name'}'
                                        : 'Assigned by ${typeTask.createdBy?.name ?? 'no name'}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall
                                        ?.copyWith(fontSize: 9)),
                              ],
                            ),
                          ),
                          adjustHieght(10),
                        ],
                      ),
                    ),
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
