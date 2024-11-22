import 'package:bizkit/module/module_manager/application/controller/auth_controller.dart';
import 'package:bizkit/module/task/application/controller/home_controller/home_controller.dart';
import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/application/presentation/screens/total_tasks/widgets/custom_pop_menubutton.dart';
import 'package:bizkit/module/task/application/presentation/widgets/task_container.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/intl/intl_date_formater.dart';
import 'package:bizkit/utils/refresh_indicator/refresh_custom.dart';
import 'package:bizkit/utils/shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

class TotalTasksScreen extends StatelessWidget {
  const TotalTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthenticationController>();
    final homeController = Get.find<TaskHomeScreenController>();
    final taskController = Get.find<CreateTaskController>();

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
                homeController.changeSelectedTaskCategory('All');
                taskController.changeFilterTaskType('all');
                taskController.filterByType();
                Navigator.of(context).pop();
              },
            ),
          ),
          PopupMenuItem(
            child: CustomPopupMenuItem(
              text: 'Self to Self',
              onTap: () {
                homeController.changeSelectedTaskCategory('Self to self');
                taskController.changeFilterTaskType('self_to_self');
                taskController.filterByType();
                Navigator.of(context).pop();
              },
            ),
          ),
          PopupMenuItem(
            child: CustomPopupMenuItem(
              text: 'Self to others',
              onTap: () {
                homeController.changeSelectedTaskCategory('Self to others');
                taskController.changeFilterTaskType('self_to_others');
                taskController.filterByType();
                Navigator.of(context).pop();
              },
            ),
          ),
          PopupMenuItem(
            child: CustomPopupMenuItem(
              text: 'Others to self',
              onTap: () {
                homeController.changeSelectedTaskCategory('Others to self');
                taskController.changeFilterTaskType('others_to_self');
                taskController.filterByType();
                Navigator.of(context).pop();
              },
            ),
          ),
          PopupMenuItem(
            child: CustomPopupMenuItem(
              text: 'Completed Tasks',
              onTap: () {
                homeController.changeSelectedTaskCategory('Completed Tasks');
                taskController.fetchAllCompletedTasks();
                Navigator.of(context).pop();
              },
            ),
          ),
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
      appBar: AppBar(
        surfaceTintColor: knill,
        title: GetBuilder<TaskHomeScreenController>(
          builder: (controller) {
            return GestureDetector(
              onTap: () => showCustomMenu(context),
              child: Row(
                children: [
                  Text(
                    controller.taskCategory.value.replaceAll('_', ' '),
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
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new, size: 17),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                width: double.infinity,
                height: 130.h,
                child: Obx(
                  () {
                    if (taskController.filterByTypeLoading.value ||
                        taskController.pinLoader.value) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        child: ShimmerLoader(
                          width: 320.w,
                          height: 100.h,
                          itemCount: 10,
                          seprator: kWidth10,
                          scrollDirection: Axis.horizontal,
                        ),
                      );
                    } else if (taskController.allPinnedTasks.isEmpty) {
                      return RefreshIndicator(
                        onRefresh: () async {
                          taskController.filterPinnedTasksByType();
                        },
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(60.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.push_pin),
                                adjustWidth(10.w),
                                Text(
                                  'No pinned tasks',
                                  style:
                                      Theme.of(context).textTheme.displaySmall,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    } else {
                      return ListView.separated(
                        separatorBuilder: (context, index) => kWidth10,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Container(
                              width: 320.w,
                              height: 100.h,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFF59FBFB),
                                    Color(0xFF379D98),
                                    Color(0xFF59F6FB),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: kBorderRadius15,
                                border: Border.all(color: kwhite, width: 3),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 4),
                              child: Stack(children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          taskController.allPinnedTasks[index]
                                                  .title ??
                                              'title',
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayMedium
                                              ?.copyWith(
                                                fontSize: 13,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onTertiary,
                                              ),
                                        ),
                                      ],
                                    ),
                                    adjustHieght(10.h),
                                    Text(
                                      taskController.allPinnedTasks[index]
                                              .description ??
                                          'description',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall
                                          ?.copyWith(
                                            fontSize: 10,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onTertiary,
                                          ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      softWrap: true,
                                    ),
                                    adjustHieght(30.h),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Iconsax.calendar_1,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onTertiary,
                                              size: 18,
                                            ),
                                            adjustWidth(8.w),
                                            Text(
                                              taskController
                                                          .allPinnedTasks[index]
                                                          .deadLine !=
                                                      null
                                                  ? DateTimeFormater
                                                      .formatDateForPinnedTaskCard(
                                                          taskController
                                                                  .allPinnedTasks[
                                                                      index]
                                                                  .deadLine ??
                                                              '')
                                                  : '',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displaySmall
                                                  ?.copyWith(
                                                    fontSize: 10,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .onTertiary,
                                                  ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          taskController.allPinnedTasks[index]
                                                      .isOwned ==
                                                  true
                                              ? 'Created by ${taskController.allPinnedTasks[index].createdBy?.name ?? 'name'}'
                                              : 'Assgined by ${taskController.allPinnedTasks[index].createdBy?.name ?? 'name'}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .displaySmall
                                              ?.copyWith(
                                                fontSize: 10,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onTertiary,
                                              ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Positioned(
                                  right: -1,
                                  top: 1,
                                  child: CircleAvatar(
                                    backgroundColor: kwhite.withOpacity(0.2),
                                    child: Transform.rotate(
                                      angle: 0.7,
                                      child: const Icon(
                                        Icons.push_pin,
                                        color: kwhite,
                                      ),
                                    ),
                                  ),
                                )
                              ]),
                            ),
                          );
                        },
                        itemCount: taskController.allPinnedTasks.length,
                      );
                    }
                  },
                ),
              ),
            ),
            Expanded(
              child: Obx(
                () {
                  if (taskController.filterByTypeLoading.value ||
                      taskController.pinLoader.value) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 5),
                      child: ShimmerLoaderTaskContainer(
                        height: 50.h,
                        itemCount: 10,
                        width: double.infinity,
                      ),
                    );
                  } else if (taskController.typeTasks.isEmpty) {
                    return ErrorRefreshIndicator(
                      image: emptyNodata2,
                      errorMessage: 'No Tasks',
                      onRefresh: () {
                        taskController.filterByType();
                      },
                    );
                  } else {
                    return RefreshIndicator(
                      onRefresh: () async {
                        taskController.filterByType();
                      },
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 0),
                        itemBuilder: (context, index) {
                          return TaskContainer(
                            tasksFromFilterSection: true,
                            typeTask: taskController.typeTasks[index],
                            index: index,
                          );
                        },
                        itemCount: taskController.typeTasks.length,
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
