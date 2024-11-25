import 'package:animate_do/animate_do.dart';
import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/task/application/controller/home_controller/home_controller.dart';
import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/domain/model/task/get_single_task_model/get_single_task_model.dart';
import 'package:bizkit/utils/clipper/task_status_clipper.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class TaskStatusCardWidget extends StatelessWidget {
  const TaskStatusCardWidget(
      {super.key,
      required this.homeController,
      this.allTasksCount,
      this.completedTasksCount,
      this.onTap});

  final TaskHomeScreenController homeController;

  final int? allTasksCount;
  final int? completedTasksCount;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final taskController = Get.find<CreateTaskController>();
    // final completed = completedTasksCount ?? 0;
    // final all = allTasksCount ?? 0;
    // final progress = all > 0 ? (completed / all) : 0.0;
    return Obx(
      () => Column(
        children: [
          adjustHieght(20.h),
          Stack(
            children: [
              // White Border
              ClipPath(
                clipper: TaskStatusClipper(),
                child: Container(
                  height: 165.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: kwhite,
                  ),
                ),
              ),
              // Main Card
              Padding(
                padding: const EdgeInsets.all(4),
                child: ClipPath(
                  clipper: TaskStatusClipper(),
                  child: Container(
                    width: double.infinity,
                    height: 158.h,
                    decoration: BoxDecoration(
                      gradient: neonNewLinearGradient,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10.h),
                          FadeInRight(
                            animate: true,
                            child: Text(
                              '${completedTasksCount ?? 0} / ${allTasksCount ?? 0} Task Completed ',
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.copyWith(
                                    fontSize: 15,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onTertiary,
                                  ),
                            ),
                          ),
                          adjustHieght(30.h),
                          SizedBox(
                            height: 50.h,
                            width: 290.w,
                            child: FadeInRight(
                              animate: true,
                              child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    var tasks = homeController
                                                .taskStatusTabIndex.value ==
                                            0
                                        ? homeController.selfieTasks[index]
                                        : homeController
                                                    .taskStatusTabIndex.value ==
                                                1
                                            ? homeController
                                                .toOthersTasks[index]
                                            : homeController.toMeTasks[index];
                                    if (homeController
                                        .loadingForRecentTasks.value) {
                                      return ShimmerLoader(
                                        itemCount: 10,
                                        scrollDirection: Axis.horizontal,
                                        height: 60.h,
                                        width: 140.w,
                                        seprator: kWidth20,
                                      );
                                    } else if (homeController
                                            .toMeTasks.isEmpty &&
                                        homeController.toOthersTasks.isEmpty &&
                                        homeController.selfieTasks.isEmpty) {
                                      return Center(
                                        child: Text(
                                          'No recent tasks',
                                          style: Theme.of(context)
                                              .textTheme
                                              .displaySmall,
                                        ),
                                      );
                                    } else {
                                      return GestureDetector(
                                        onTap: () {
                                          taskController.fetchSingleTask(
                                            singleTaskModel: GetSingleTaskModel(
                                              taskId: tasks.taskId ?? '',
                                            ),
                                          );
                                          GoRouter.of(context).pushNamed(
                                            Routes.taskDeail,
                                            pathParameters: {
                                              "taskId": tasks.taskId ?? ''
                                            },
                                          );
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.all(3),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          decoration: BoxDecoration(
                                            color: kwhite.withOpacity(0.2),
                                            borderRadius: kBorderRadius10,
                                          ),
                                          child: Center(
                                            child: Text(
                                                tasks.taskTitle ?? 'Task title',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .displaySmall
                                                    ?.copyWith(
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .onTertiary)),
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                  separatorBuilder: (context, index) =>
                                      kWidth10,
                                  itemCount: homeController
                                              .taskStatusTabIndex.value ==
                                          0
                                      ? homeController.selfieTasks.length > 3
                                          ? 3
                                          : homeController.selfieTasks.length
                                      : homeController
                                                  .taskStatusTabIndex.value ==
                                              1
                                          ? homeController
                                                      .toOthersTasks.length >
                                                  3
                                              ? 3
                                              : homeController
                                                  .toOthersTasks.length
                                          : homeController.taskStatusTabIndex
                                                      .value ==
                                                  2
                                              ? homeController
                                                          .toMeTasks.length >
                                                      3
                                                  ? 3
                                                  : homeController
                                                      .toMeTasks.length
                                              : 0),
                            ),
                          ),
                          // FadeInRight(
                          //   animate: true,
                          //   child: Text(
                          //     'Progress',
                          //     style: Theme.of(context)
                          //         .textTheme
                          //         .displaySmall
                          //         ?.copyWith(
                          //           fontSize: 13,
                          //           color:
                          //               Theme.of(context).colorScheme.onTertiary,
                          //         ),
                          //   ),
                          // ),
                          // SizedBox(height: 5.h),
                          // Column(
                          //   crossAxisAlignment: CrossAxisAlignment.start,
                          //   children: [
                          //     FadeInRight(
                          //       animate: true,
                          //       child: ClipRRect(
                          //         borderRadius: BorderRadius.circular(12),
                          //         child: LinearProgressIndicator(
                          //           minHeight: 12,
                          //           value: progress,
                          //           backgroundColor: kwhite.withOpacity(0.3),
                          //           valueColor:
                          //               const AlwaysStoppedAnimation<Color>(
                          //             kwhite,
                          //           ),
                          //         ),
                          //       ),
                          //     ),
                          //     SizedBox(height: 5.h),
                          //     FadeInRight(
                          //       animate: true,
                          //       child: Align(
                          //         alignment: Alignment.centerRight,
                          //         child: Text(
                          //           '${(progress * 100).toInt()}%',
                          //           style: Theme.of(context)
                          //               .textTheme
                          //               .displaySmall
                          //               ?.copyWith(
                          //                 fontSize: 13,
                          //                 color: Theme.of(context)
                          //                     .colorScheme
                          //                     .onTertiary,
                          //               ),
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // )
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              Positioned(
                right: 0,
                top: 0,
                child: GestureDetector(
                  onTap: onTap,
                  child: const CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.black,
                    child: Icon(
                      Icons.arrow_outward_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
