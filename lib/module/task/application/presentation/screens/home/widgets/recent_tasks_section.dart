import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/task/application/controller/home_controller/home_controller.dart';
import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/domain/model/task/get_single_task_model/get_single_task_model.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

// ! The progress bar part is pending

class RecentTasksSection extends StatelessWidget {
  const RecentTasksSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<TaskHomeScreenController>();
    final taskController = Get.find<CreateTaskController>();
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Recent Tasks',
              style: Theme.of(context)
                  .textTheme
                  .displaySmall
                  ?.copyWith(fontSize: 14),
            ),
            Text(
              'See all',
              style: Theme.of(context)
                  .textTheme
                  .displaySmall
                  ?.copyWith(fontSize: 14),
            ),
          ],
        ),
        adjustHieght(10.h),
        SizedBox(
          height: 90.h,
          child: Obx(
            () {
              if (homeController.loadingForRecentTasks.value) {
                return ShimmerLoader(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  height: 60.h,
                  width: 190.w,
                  seprator: kWidth20,
                );
              } else if (homeController.toMeTasks.isEmpty &&
                  homeController.toOthersTasks.isEmpty &&
                  homeController.selfieTasks.isEmpty) {
                return Center(
                  child: Text(
                    'No recent tasks',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                );
              } else {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: homeController.taskStatusTabIndex.value == 0
                      ? homeController.selfieTasks.length
                      : homeController.taskStatusTabIndex.value == 1
                          ? homeController.toOthersTasks.length
                          : homeController.toMeTasks.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        taskController.fetchSingleTask(
                          singleTaskModel: GetSingleTaskModel(
                            taskId: homeController.taskStatusTabIndex.value == 0
                                ? homeController.selfieTasks[index].taskId ?? ''
                                : homeController.taskStatusTabIndex.value == 1
                                    ? homeController
                                            .toOthersTasks[index].taskId ??
                                        ''
                                    : homeController.toMeTasks[index].taskId ??
                                        '',
                          ),
                        );
                        GoRouter.of(context).pushNamed(
                          Routes.taskDeail,
                          pathParameters: {
                            "taskId": homeController.taskStatusTabIndex.value ==
                                    0
                                ? homeController.selfieTasks[index].taskId ?? ''
                                : homeController.taskStatusTabIndex.value == 1
                                    ? homeController
                                            .toOthersTasks[index].taskId ??
                                        ''
                                    : homeController.toMeTasks[index].taskId ??
                                        ''
                          },
                        );
                      },
                      child: Card(
                        elevation: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15, right: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                homeController.taskStatusTabIndex.value == 0
                                    ? homeController
                                            .selfieTasks[index].taskTitle ??
                                        'TaskTitle'
                                    : homeController.taskStatusTabIndex.value ==
                                            1
                                        ? homeController.toOthersTasks[index]
                                                .taskTitle ??
                                            'TaskTitle'
                                        : homeController
                                                .toMeTasks[index].taskTitle ??
                                            'TaskTitle',
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall
                                    ?.copyWith(fontSize: 13),
                              ),
                              Text(
                                homeController.taskStatusTabIndex.value == 0
                                    ? homeController
                                            .selfieTasks[index].deadLine ??
                                        'deadline'
                                    : homeController.taskStatusTabIndex.value ==
                                            1
                                        ? homeController.toOthersTasks[index]
                                                .deadLine ??
                                            'deadline'
                                        : homeController
                                                .toMeTasks[index].deadLine ??
                                            'deadline',
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall
                                    ?.copyWith(fontSize: 10),
                              ),
                              adjustHieght(15.h),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Progress",
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall
                                            ?.copyWith(
                                                fontSize: 9,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .secondary),
                                      ),
                                      adjustWidth(8.w),
                                      SizedBox(
                                        width: 100,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          child: LinearProgressIndicator(
                                            minHeight: 8,
                                            value: 45.toDouble() / 100,
                                            backgroundColor: klightGrey,
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                    index == 0 || index == 2
                                                        ? kred
                                                        : kneon),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  adjustHieght(10.h),
                                  Text(
                                      homeController.taskStatusTabIndex.value ==
                                                      0 &&
                                                  homeController
                                                          .selfieTasks[index]
                                                          .isOwned ==
                                                      true ||
                                              homeController.taskStatusTabIndex
                                                          .value ==
                                                      1 &&
                                                  homeController
                                                          .toOthersTasks[index]
                                                          .isOwned ==
                                                      true ||
                                              homeController.taskStatusTabIndex
                                                          .value ==
                                                      2 &&
                                                  homeController
                                                          .toMeTasks[index]
                                                          .isOwned ==
                                                      true
                                          ? 'Created by ${homeController.taskStatusTabIndex.value == 0 ? homeController.selfieTasks[index].createdBy?.name ?? 'name' : homeController.taskStatusTabIndex.value == 1 ? homeController.toOthersTasks[index].createdBy?.name ?? 'name' : 'name'}'
                                          : 'Assgined by ${homeController.taskStatusTabIndex.value == 2 ? homeController.toMeTasks[index].createdBy?.name : 'name'}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall
                                          ?.copyWith(fontSize: 8)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  shrinkWrap: true,
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
