import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/task/application/controller/chat/message_count_controller.dart';
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

class RecentTasksSection extends StatelessWidget {
  const RecentTasksSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<TaskHomeScreenController>();
    final taskController = Get.find<CreateTaskController>();
    final messageCountController = Get.find<MessageCountController>();
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
            GestureDetector(
              onTap: () {
                homeController.changeSelectedTaskCategory('All');
                taskController.changeFilterTaskType('all');
                taskController.filterByType();
                taskController.filterPinnedTasksByType();
                Get.toNamed(Routes.taskLists, id: 1);
              },
              child: Text(
                'See all',
                style: Theme.of(context)
                    .textTheme
                    .displaySmall
                    ?.copyWith(fontSize: 14),
              ),
            ),
          ],
        ),
        adjustHieght(10.h),
        SizedBox(
          height: 95.h,
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
                    var recnetTask =
                        homeController.taskStatusTabIndex.value == 0
                            ? homeController.selfieTasks[index]
                            : homeController.taskStatusTabIndex.value == 1
                                ? homeController.toOthersTasks[index]
                                : homeController.toMeTasks[index];
                    final count =
                        messageCountController.unreadCounts[recnetTask.taskId];
                    return GestureDetector(
                      onTap: () {
                        taskController.fetchSingleTask(
                          singleTaskModel: GetSingleTaskModel(
                            taskId: recnetTask.taskId ?? '',
                          ),
                        );
                        GoRouter.of(context).pushNamed(
                          Routes.taskDeail,
                          pathParameters: {"taskId": recnetTask.taskId ?? ''},
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
                                recnetTask.taskTitle ?? 'TaskTitle',
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall
                                    ?.copyWith(fontSize: 13),
                              ),
                              Text(
                                recnetTask.deadLine ?? 'deadline',
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall
                                    ?.copyWith(fontSize: 10),
                              ),
                              adjustHieght(1.h),
                              if (count == null || count.value == 0)
                                kempty
                              else
                                Padding(
                                  padding: const EdgeInsets.only(left: 50),
                                  child: Text('unread messages $count',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall
                                          ?.copyWith(
                                              color: kGreyNormal, fontSize: 8)),
                                ),
                              adjustHieght(5.h),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Endline",
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
                                            value: homeController
                                                .recentTaskProgress(
                                                    recnetTask.createdAt,
                                                    recnetTask.deadLine),
                                            backgroundColor: klightGrey,
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                    taskSpotLightColorChanger(
                                                        recnetTask.createdAt,
                                                        recnetTask.deadLine)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  adjustHieght(10.h),
                                  Text(
                                      recnetTask.isOwned == true
                                          ? 'Created by you'
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
