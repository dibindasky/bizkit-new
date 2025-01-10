import 'package:bizkit/module/module_manager/application/controller/internet_controller.dart';
import 'package:bizkit/module/task/application/controller/hierarchy/hierarchy_controller.dart';
import 'package:bizkit/module/task/application/controller/home_controller/home_controller.dart';
import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/application/presentation/screens/total_tasks/widgets/completed_tasks_list.dart';
import 'package:bizkit/module/task/application/presentation/screens/total_tasks/widgets/custom_pop_menubutton.dart';
import 'package:bizkit/module/task/application/presentation/screens/total_tasks/widgets/filter_tasks_list.dart';
import 'package:bizkit/module/task/application/presentation/screens/total_tasks/widgets/killed_tasks_list.dart';
import 'package:bizkit/module/task/application/presentation/screens/total_tasks/widgets/pinned_tasks_section.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/refresh_indicator/refresh_custom.dart';
import 'package:bizkit/utils/shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class TotalTasksScreen extends StatelessWidget {
  const TotalTasksScreen(
      {super.key, this.fromHeirarachy = false, this.targetUserId});
  final bool? fromHeirarachy;
  final String? targetUserId;
  @override
  Widget build(BuildContext context) {
    // print('use id == > $targetUserId');
    final hierarchyController = Get.find<HierarchyController>();
    final homeController = Get.find<TaskHomeScreenController>();
    final taskController = Get.find<CreateTaskController>();

    final internetConnectinController =
        Get.find<InternetConnectionController>();

    void showCustomMenu(BuildContext context) {
      final RenderBox button = context.findRenderObject() as RenderBox;
      final RenderBox overlay =
          Overlay.of(context).context.findRenderObject() as RenderBox;

      final RelativeRect position = RelativeRect.fromRect(
        Rect.fromPoints(
          button.localToGlobal(Offset.zero, ancestor: overlay),
          button.localToGlobal(button.size.bottomRight(Offset.zero),
              ancestor: overlay),
        ),
        Offset.zero & overlay.size,
      );

      showMenu(
        context: context,
        position: position,
        items: [
          PopupMenuItem(
            child: CustomPopupMenuItem(
              text: 'All Tasks',
              onTap: () {
                if (fromHeirarachy == true) {
                  homeController.changeSelectedTaskCategory('All');
                  hierarchyController.changeFilterTaskType('all');
                  hierarchyController.changeTargetUsers(targetUserId ?? '');
                  hierarchyController.filterTasksByType(
                      targetUserId: targetUserId ?? '');
                  Navigator.of(context).pop();
                } else {
                  homeController.changeSelectedTaskCategory('All');
                  taskController.changeFilterTaskType('all');
                  taskController.filterByType();
                  taskController.filterPinnedTasksByType();
                  Navigator.of(context).pop();
                }
              },
            ),
          ),
          PopupMenuItem(
            child: CustomPopupMenuItem(
              text: 'Self to Self',
              onTap: () {
                if (fromHeirarachy == true) {
                  homeController.changeSelectedTaskCategory('Self to self');
                  hierarchyController.changeFilterTaskType('self_to_self');
                  hierarchyController.changeTargetUsers(targetUserId ?? '');
                  hierarchyController.filterTasksByType(
                      targetUserId: targetUserId ?? '');
                  Navigator.of(context).pop();
                } else {
                  homeController.changeSelectedTaskCategory('Self to self');
                  taskController.changeFilterTaskType('self_to_self');
                  taskController.filterByType();
                  taskController.filterPinnedTasksByType();
                  Navigator.of(context).pop();
                }
              },
            ),
          ),
          PopupMenuItem(
            child: CustomPopupMenuItem(
              text: 'Self to others',
              onTap: () {
                if (fromHeirarachy == true) {
                  homeController.changeSelectedTaskCategory('Self to others');
                  hierarchyController.changeFilterTaskType('self_to_others');
                  hierarchyController.changeTargetUsers(targetUserId ?? '');
                  hierarchyController.filterTasksByType(
                      targetUserId: targetUserId ?? '');
                  Navigator.of(context).pop();
                } else {
                  homeController.changeSelectedTaskCategory('Self to others');
                  taskController.changeFilterTaskType('self_to_others');
                  taskController.filterByType();
                  taskController.filterPinnedTasksByType();
                  Navigator.of(context).pop();
                }
              },
            ),
          ),
          PopupMenuItem(
            child: CustomPopupMenuItem(
              text: 'Others to self',
              onTap: () {
                if (fromHeirarachy == true) {
                  homeController.changeSelectedTaskCategory('Others to self');
                  hierarchyController.changeFilterTaskType('others_to_self');
                  hierarchyController.changeTargetUsers(targetUserId ?? '');
                  hierarchyController.filterTasksByType(
                      targetUserId: targetUserId ?? '');
                  Navigator.of(context).pop();
                } else {
                  homeController.changeSelectedTaskCategory('Others to self');
                  taskController.changeFilterTaskType('others_to_self');
                  taskController.filterByType();
                  taskController.filterPinnedTasksByType();
                  Navigator.of(context).pop();
                }
              },
            ),
          ),
          if (fromHeirarachy == false)
            PopupMenuItem(
              child: CustomPopupMenuItem(
                text: 'Completed Tasks',
                onTap: () {
                  homeController.changeSelectedTaskCategory('Completed Tasks');
                  taskController.fetchAllCompletedTasks();
                  print(
                      'competed datas = > ${taskController.completedTasks.length}');

                  Navigator.of(context).pop();
                },
              ),
            ),
          if (fromHeirarachy == false)
            PopupMenuItem(
              child: CustomPopupMenuItem(
                text: 'Killed Tasks',
                onTap: () {
                  homeController.changeSelectedTaskCategory('Killed Tasks');
                  taskController.fetchAllKilledTasks();
                  Navigator.of(context).pop();
                },
              ),
            ),
        ],
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: Column(
            children: [
              Row(
                children: [
                  adjustWidth(6.w),
                  GestureDetector(
                    onTap: () {
                      GoRouter.of(context).pop(context);
                    },
                    child: CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.onPrimary,
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        size: 18.sp,
                        color: Theme.of(context).colorScheme.onTertiary,
                      ),
                    ),
                  ),
                  adjustWidth(20.w),
                  GetBuilder<TaskHomeScreenController>(
                    builder: (controller) {
                      return GestureDetector(
                        onTap: () => showCustomMenu(context),
                        child: Row(
                          children: [
                            Text(
                              controller.taskCategory.value
                                  .replaceAll('_', ' '),
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.copyWith(fontSize: 14),
                            ),
                            adjustWidth(6.w),
                            const Icon(
                              Icons.arrow_drop_down,
                              size: 29,
                            ),
                          ],
                        ),
                      );
                    },
                  )
                ],
              ),
              Obx(
                () => Visibility(
                  visible:
                      taskController.pinnedTasksFilterByTypeLoading.value ||
                              taskController.allPinnedTasks.isEmpty ||
                              fromHeirarachy == true
                          ? false
                          : true,
                  child: PinnedTasksSection(taskController: taskController),
                ),
              ),
              Expanded(
                child: Obx(
                  () {
                    if (fromHeirarachy == true
                        ? hierarchyController.isLoading.value
                        : taskController.filterByTypeLoading.value) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 5),
                        child: ShimmerLoaderTaskContainer(
                          height: 50.h,
                          itemCount: 10,
                          width: double.infinity,
                        ),
                      );
                    } else if (!internetConnectinController
                            .isConnectedToInternet.value &&
                        (fromHeirarachy == true
                            ? hierarchyController.filterTasks.isEmpty
                            : homeController.taskCategory.value ==
                                    'Completed Tasks'
                                ? taskController.completedTasks.isEmpty
                                : homeController.taskCategory.value ==
                                        'Killed Tasks'
                                    ? taskController.killedTasks.isEmpty
                                    : taskController.typeTasks.isEmpty)) {
                      return InternetConnectionLostWidget(
                        onTap: () {
                          if (fromHeirarachy == true) {
                            hierarchyController.filterTasksByType(
                                targetUserId: targetUserId ?? '');
                          } else if (homeController.taskCategory.value ==
                              'Completed Tasks') {
                            taskController.fetchAllCompletedTasks();
                          } else if (homeController.taskCategory.value !=
                              'Killed Tasks') {
                            taskController.fetchAllKilledTasks();
                          } else {
                            if (homeController.taskCategory.value !=
                                    'Completed Tasks' ||
                                homeController.taskCategory.value !=
                                    'Killed Tasks') {
                              taskController.filterByType();
                              taskController.filterPinnedTasksByType();
                            }
                          }
                        },
                      );
                    } else if (fromHeirarachy == true
                        ? hierarchyController.filterTasks.isEmpty
                        : homeController.taskCategory.value == 'Completed Tasks'
                            ? taskController.completedTasks.isEmpty
                            : homeController.taskCategory.value ==
                                    'Killed Tasks'
                                ? taskController.killedTasks.isEmpty
                                : taskController.typeTasks.isEmpty) {
                      return ErrorRefreshIndicator(
                        image: emptyNodata2,
                        errorMessage: 'No ${homeController.taskCategory}',
                        onRefresh: () {
                          if (fromHeirarachy == true) {
                            hierarchyController.filterTasksByType(
                                targetUserId: targetUserId ?? '');
                          } else if (homeController.taskCategory.value ==
                              'Completed Tasks') {
                            taskController.fetchAllCompletedTasks();
                          } else if (homeController.taskCategory.value !=
                              'Killed Tasks') {
                            taskController.fetchAllKilledTasks();
                          } else {
                            if (homeController.taskCategory.value !=
                                    'Completed Tasks' ||
                                homeController.taskCategory.value !=
                                    'Killed Tasks') {
                              taskController.filterByType();
                              taskController.filterPinnedTasksByType();
                            }
                          }
                        },
                      );
                    } else {
                      return RefreshIndicator(
                        onRefresh: () async {
                          if (fromHeirarachy == true) {
                            hierarchyController.filterTasksByType(
                                targetUserId: targetUserId ?? '');
                          } else if (homeController.taskCategory.value ==
                              'Completed Tasks') {
                            taskController.fetchAllCompletedTasks();
                          } else if (homeController.taskCategory.value !=
                              'Killed Tasks') {
                            taskController.fetchAllKilledTasks();
                          } else {
                            if (homeController.taskCategory.value !=
                                    'Completed Tasks' ||
                                homeController.taskCategory.value !=
                                    'Killed Tasks') {
                              taskController.filterByType();
                              taskController.filterPinnedTasksByType();
                            }
                          }
                        },
                        child: homeController.taskCategory.value ==
                                'Completed Tasks'
                            ? const CompletedTasksListView()
                            : homeController.taskCategory.value ==
                                    'Killed Tasks'
                                ? const KilledTasksListView()
                                : FilterTasksListView(
                                    fromHeirarachy: fromHeirarachy,
                                    hierarchyController: hierarchyController,
                                    taskController: taskController),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
