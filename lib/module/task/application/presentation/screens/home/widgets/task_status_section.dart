import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/task/application/controller/home_controller/home_controller.dart';
import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/application/presentation/screens/home/widgets/task_status_card_widget.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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

    return Column(
      children: [
        SizedBox(
          height: 40.h,
          child: GestureDetector(
            onTap: () {
              taskController.searchTasks();
              FocusScope.of(context).unfocus();
              Get.toNamed(Routes.taskSearch, id: 1);
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
                Get.toNamed(Routes.addTask, id: 1, arguments: 1);
              },
              child: Container(
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF59FBFB),
                        Color(0xFF379D98),
                        Color(0xFF59F6FB),
                      ],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                    ),
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
        TabBar(
          controller: tabController,
          isScrollable: true,
          tabAlignment: TabAlignment.start,
          dividerColor: Colors.transparent,
          overlayColor: WidgetStateColor.transparent,
          indicatorSize: TabBarIndicatorSize.tab,
          labelPadding: const EdgeInsets.symmetric(horizontal: 3),
          splashBorderRadius: kBorderRadius25,
          labelColor: Theme.of(context).colorScheme.onTertiary,
          labelStyle: Theme.of(context).textTheme.displaySmall,
          onTap: (value) {
            homeController.taskStatusTabController(value);
          },
          padding: EdgeInsets.zero,
          indicator: const BoxDecoration(
              color: kblack,
              borderRadius: BorderRadius.all(Radius.circular(27))),
          tabs: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  border: Border.all(color: kblack.withOpacity(0.3)),
                  borderRadius: kBorderRadius25),
              child: Tab(
                child: Row(
                  children: [
                    const Text('Self'),
                    adjustWidth(5.w),
                    CircleAvatar(
                      radius: 10,
                      backgroundColor: kgrey,
                      child: Obx(() => Text(
                            '${homeController.progresBarCounts.value.selfToSelf?.all ?? 0}',
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall
                                ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onTertiary),
                          )),
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  border: Border.all(color: kblack.withOpacity(0.3)),
                  borderRadius: kBorderRadius25),
              child: Tab(
                child: Row(
                  children: [
                    const Text('Self to others'),
                    adjustWidth(5.w),
                    CircleAvatar(
                      radius: 10,
                      backgroundColor: kgrey,
                      child: Obx(() => Text(
                            '${homeController.progresBarCounts.value.selfToOthers?.all ?? 0}',
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall
                                ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onTertiary),
                          )),
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  border: Border.all(color: kblack.withOpacity(0.3)),
                  borderRadius: kBorderRadius25),
              child: Tab(
                child: Row(
                  children: [
                    const Text('Others to self'),
                    adjustWidth(5.w),
                    CircleAvatar(
                      radius: 10,
                      backgroundColor: kgrey,
                      child: Obx(() => Text(
                            '${homeController.progresBarCounts.value.othersToSelf?.all ?? 0}',
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall
                                ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onTertiary),
                          )),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            Get.toNamed(Routes.taskLists, id: 1);
          },
          child: SizedBox(
            height: 221.h,
            child: Obx(() => TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: tabController,
                  children: [
                    TaskStatusCardWidget(
                      onTap: () {},
                      homeController: homeController,
                      cardTitle: homeController.taskStatusTabIndex.value == 0
                          ? 'Self tasks'
                          : '',
                      allTasksCount:
                          homeController.taskStatusTabIndex.value == 0
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
                      onTap: () {},
                      homeController: homeController,
                      cardTitle: homeController.taskStatusTabIndex.value == 1
                          ? 'Self to others tasks'
                          : '',
                      allTasksCount:
                          homeController.taskStatusTabIndex.value == 1
                              ? homeController.progresBarCounts.value
                                      .selfToOthers?.all ??
                                  0
                              : 0,
                      completedTasksCount:
                          homeController.taskStatusTabIndex.value == 1
                              ? homeController.progresBarCounts.value
                                      .selfToOthers?.completed ??
                                  0
                              : 0,
                    ),
                    TaskStatusCardWidget(
                      onTap: () {},
                      homeController: homeController,
                      cardTitle: homeController.taskStatusTabIndex.value == 2
                          ? 'Others to self tasks'
                          : '',
                      allTasksCount:
                          homeController.taskStatusTabIndex.value == 2
                              ? homeController.progresBarCounts.value
                                      .othersToSelf?.all ??
                                  0
                              : 0,
                      completedTasksCount:
                          homeController.taskStatusTabIndex.value == 2
                              ? homeController.progresBarCounts.value
                                      .othersToSelf?.completed ??
                                  0
                              : 0,
                    ),
                  ],
                )),
          ),
        ),
      ],
    );
  }
}
