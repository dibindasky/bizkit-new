import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/module_manager/application/controller/internet_controller.dart';
import 'package:bizkit/module/task/application/controller/home_controller/home_controller.dart';
import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/application/presentation/screens/home/widgets/task_status_card_widget.dart';
import 'package:bizkit/module/task/application/presentation/screens/home/widgets/task_status_tab_bar.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/snackbar/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class TaskStatusSection extends StatelessWidget {
  const TaskStatusSection({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<TaskHomeScreenController>();
    final taskController = Get.find<CreateTaskController>();
    final internetConnectinController =
        Get.find<InternetConnectionController>();
    return Column(
      children: [
        SizedBox(
          height: 40.h,
          child: GestureDetector(
            onTap: () {
              taskController.searchTasks();
              FocusScope.of(context).unfocus();
              GoRouter.of(context).pushNamed(Routes.taskSearch);
            },
            child: TextField(
              enabled: false,
              onTapOutside: (event) => FocusScope.of(context).unfocus(),
              decoration: InputDecoration(
                labelText: 'Search your tasks',
                labelStyle: Theme.of(context).textTheme.displaySmall?.copyWith(
                      color: kGreyNormal,
                    ),
                border: const OutlineInputBorder(),
              ),
            ),
          ),
        ),
        adjustHieght(20.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Task Status',
              style: Theme.of(context)
                  .textTheme
                  .displaySmall
                  ?.copyWith(fontSize: 15),
            ),
            GestureDetector(
              onTap: () {
                if (internetConnectinController.isConnectedToInternet.value) {
                  GoRouter.of(context).pushNamed(Routes.addTask);
                } else {
                  Fluttertoast.showToast(
                    msg:
                        'You must be online to create a new task. Please check your internet connection.',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.SNACKBAR,
                    timeInSecForIosWeb: 3,
                    fontSize: 12,
                    backgroundColor: kred,
                    textColor: kwhite,
                  );
                }
              },
              child: Container(
                decoration: BoxDecoration(
                    gradient: neonNewLinearGradient,
                    borderRadius: kBorderRadius20),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 9),
                  child: Text(
                    'Add task',
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall
                        ?.copyWith(fontSize: 12, color: kwhite),
                  ),
                ),
              ),
            ),
          ],
        ),
        adjustHieght(15.h),
        TaskStatusTabBar(
          tabController: tabController,
          homeController: homeController,
        ),
        GestureDetector(
          onTap: () {
            if (homeController.taskStatusTabIndex.value == 0) {
              homeController.changeSelectedTaskCategory('Self to self');

              taskController.changeFilterTaskType('self_to_self');

              taskController.filterByType();
              taskController.filterPinnedTasksByType();
              GoRouter.of(context).pushNamed(Routes.taskLists,
                  extra: {'fromHeirarachy': false, 'targetUserId': ''});
            } else if (homeController.taskStatusTabIndex.value == 1) {
              homeController.changeSelectedTaskCategory('Self to others');

              taskController.changeFilterTaskType('self_to_others');

              taskController.filterByType();
              taskController.filterPinnedTasksByType();
              GoRouter.of(context).pushNamed(Routes.taskLists,
                  extra: {'fromHeirarachy': false, 'targetUserId': ''});
            } else {
              homeController.changeSelectedTaskCategory('Others to self');

              taskController.changeFilterTaskType('others_to_self');
              taskController.filterByType();

              taskController.filterPinnedTasksByType();
              GoRouter.of(context).pushNamed(Routes.taskLists,
                  extra: {'fromHeirarachy': false, 'targetUserId': ''});
            }
          },
          child: SizedBox(
            height: 221.h,
            child: Obx(
              () => TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: tabController,
                children: [
                  TaskStatusCardWidget(
                    onTap: () {
                      if (homeController.taskStatusTabIndex.value == 0) {
                        homeController
                            .changeSelectedTaskCategory('Self to self');

                        taskController.changeFilterTaskType('self_to_self');

                        taskController.filterByType();
                        taskController.filterPinnedTasksByType();
                        GoRouter.of(context).pushNamed(Routes.taskLists,
                            extra: {
                              'fromHeirarachy': false,
                              'targetUserId': ''
                            });
                      }
                    },
                    homeController: homeController,
                    allTasksCount: homeController.taskStatusTabIndex.value == 0
                        ? homeController
                                .progresBarCounts.value.selfToSelf?.all ??
                            0
                        : 0,
                    completedTasksCount:
                        homeController.taskStatusTabIndex.value == 0
                            ? homeController.progresBarCounts.value.selfToSelf
                                    ?.completed ??
                                0
                            : 0,
                  ),
                  TaskStatusCardWidget(
                    onTap: () {
                      if (homeController.taskStatusTabIndex.value == 1) {
                        homeController
                            .changeSelectedTaskCategory('Self to others');

                        taskController.changeFilterTaskType('self_to_others');

                        taskController.filterByType();
                        taskController.filterPinnedTasksByType();
                        GoRouter.of(context).pushNamed(Routes.taskLists,
                            extra: {
                              'fromHeirarachy': false,
                              'targetUserId': ''
                            });
                      }
                    },
                    homeController: homeController,
                    allTasksCount: homeController.taskStatusTabIndex.value == 1
                        ? homeController
                                .progresBarCounts.value.selfToOthers?.all ??
                            0
                        : 0,
                    completedTasksCount:
                        homeController.taskStatusTabIndex.value == 1
                            ? homeController.progresBarCounts.value.selfToOthers
                                    ?.completed ??
                                0
                            : 0,
                  ),
                  TaskStatusCardWidget(
                    onTap: () {
                      if (homeController.taskStatusTabIndex.value == 2) {
                        homeController
                            .changeSelectedTaskCategory('Others to self');

                        taskController.changeFilterTaskType('others_to_self');
                        taskController.filterByType();

                        taskController.filterPinnedTasksByType();
                        GoRouter.of(context).pushNamed(Routes.taskLists,
                            extra: {
                              'fromHeirarachy': false,
                              'targetUserId': ''
                            });
                      }
                    },
                    homeController: homeController,
                    allTasksCount: homeController.taskStatusTabIndex.value == 2
                        ? homeController
                                .progresBarCounts.value.othersToSelf?.all ??
                            0
                        : 0,
                    completedTasksCount:
                        homeController.taskStatusTabIndex.value == 2
                            ? homeController.progresBarCounts.value.othersToSelf
                                    ?.completed ??
                                0
                            : 0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
