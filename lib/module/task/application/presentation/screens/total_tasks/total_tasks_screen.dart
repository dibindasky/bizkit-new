import 'dart:developer';

import 'package:bizkit/module/module_manager/application/controller/auth_controller.dart';
import 'package:bizkit/module/task/application/controller/home_controller/home_controller.dart';
import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/application/presentation/screens/home/widgets/task_home_appbar.dart';
import 'package:bizkit/module/task/application/presentation/screens/total_tasks/widgets/custom_pop_menubutton.dart';
import 'package:bizkit/module/task/application/presentation/widgets/task_container.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

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
                taskController.filterPinnedTasksByType(
                    // filterPinnedTask: FilterPinnedTaskByTypeModel(
                    //   taskType: 'all',
                    //   isPinned: true,
                    // ),
                    );
                // taskController.taskType.value = 'all';
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
                taskController.filterPinnedTasksByType(
                    // filterPinnedTask: FilterPinnedTaskByTypeModel(
                    //   taskType: 'self_to_self',
                    //   isPinned: true,
                    // ),
                    );
                // taskController.taskType.value = 'self_to_self';
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
                taskController.filterPinnedTasksByType(
                    // filterPinnedTask: FilterPinnedTaskByTypeModel(
                    //   taskType: 'self_to_others',
                    //   isPinned: true,
                    // ),
                    );
                // taskController.taskType.value = 'self_to_others';
                taskController.filterByType();

                Navigator.of(context).pop();
                log(homeController.taskCategory.value);
              },
            ),
          ),
          PopupMenuItem(
            child: CustomPopupMenuItem(
              text: 'Others to self',
              onTap: () {
                homeController.changeSelectedTaskCategory('Others to self');
                taskController.filterPinnedTasksByType(
                    // filterPinnedTask: FilterPinnedTaskByTypeModel(
                    //   taskType: 'others_to_self',
                    //   isPinned: true,
                    // ),
                    );

                taskController.taskType.value = 'others_to_self';
                taskController.filterByType();
                taskController.changeFilterTaskType('others_to_self');

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
          // PopupMenuItem(
          //   child: CustomPopupMenuItem(
          //     text: 'Combleted task',
          //     onTap: () {
          //       homeController.changeSelectedTaskCategory('Combleted task');
          //       Navigator.of(context).pop();
          //     },
          //   ),
          // ),
        ],
      );
    }

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
              pinned: true,
              leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  size: 17,
                ),
              ),
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              floating: false,
              snap: false,
              stretch: true,
              title: GetBuilder<TaskHomeScreenController>(
                builder: (controller) {
                  return GestureDetector(
                    onTap: () => showCustomMenu(context),
                    child: Row(
                      children: [
                        Text(
                          controller.taskCategory.value.replaceAll('_', ' '),
                          style: TextStyle(fontSize: 13.sp),
                        ),
                        adjustWidth(10.w),
                        const Icon(Icons.arrow_drop_down)
                      ],
                    ),
                  );
                },
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(130.h),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        width: 330.w,
                        height: 130.h,
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
                                  seprator: kWidth10,
                                  scrollDirection: Axis.horizontal,
                                ),
                              );
                            } else {
                              return ListView.separated(
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
                                          border: Border.all(
                                              color: kwhite, width: 3),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 4),
                                        child: Stack(children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Metting Project Landing',
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .displayMedium
                                                        ?.copyWith(
                                                          fontSize: 13,
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .onTertiary,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                              adjustHieght(10.h),
                                              Text(
                                                'Complete the documentation for the current project including all \nmodules Complete the documentation for the current project including all modules',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .displaySmall
                                                    ?.copyWith(
                                                      fontSize: 8,
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
                                                    MainAxisAlignment
                                                        .spaceBetween,
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
                                                        'July 12 Wednesday 2023',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .displaySmall
                                                            ?.copyWith(
                                                              fontSize: 11,
                                                              color: Theme.of(
                                                                      context)
                                                                  .colorScheme
                                                                  .onTertiary,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                  Text(
                                                    'Created by Mac',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .displaySmall
                                                        ?.copyWith(
                                                          fontSize: 11,
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .onTertiary,
                                                        ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                          Positioned(
                                            right: -2,
                                            top: 1,
                                            child: CircleAvatar(
                                              backgroundColor:
                                                  kwhite.withOpacity(0.2),
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
                                  separatorBuilder: (context, index) =>
                                      kWidth20,
                                  itemCount:
                                      taskController.allPinnedTasks.length);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              sliver: Obx(() => SliverList.separated(
                    itemCount: taskController.typeTasks.length,
                    itemBuilder: (context, index) {
                      return TaskContainer(
                        tasksFromFilterSection: true,
                        typeTask: taskController.typeTasks[index],
                        index: index,
                      );
                    },
                    separatorBuilder: (context, index) => kHeight5,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
