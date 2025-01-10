import 'package:bizkit/module/task/application/controller/home_controller/home_controller.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TaskStatusTabBar extends StatelessWidget {
  const TaskStatusTabBar({
    super.key,
    required this.tabController,
    required this.homeController,
  });

  final TabController tabController;
  final TaskHomeScreenController homeController;

  @override
  Widget build(BuildContext context) {
    return TabBar(
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
          borderRadius:
              BorderRadius.all(Radius.circular(20))), // Reduced radius
      tabs: [
        Container(
          height: 30.h, // Added fixed height
          padding: const EdgeInsets.symmetric(
              horizontal: 12, vertical: 5), // Reduced padding
          decoration: BoxDecoration(
              border: Border.all(color: kblack.withOpacity(0.3)),
              borderRadius: BorderRadius.circular(20)), // Matching radius
          child: Tab(
            height: 22, // Added tab height
            child: Row(
              mainAxisSize: MainAxisSize.min, // Added to keep row compact
              children: [
                const Text('Self'),
                adjustWidth(5.w),
                CircleAvatar(
                  radius: 8, // Reduced radius
                  backgroundColor: kgrey,
                  child: Obx(() => Text(
                        '${homeController.progresBarCounts.value.selfToSelf?.all ?? 0}',
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall
                            ?.copyWith(
                                fontSize: 10, // Added smaller font size
                                color:
                                    Theme.of(context).colorScheme.onTertiary),
                      )),
                )
              ],
            ),
          ),
        ),
        Container(
          height: 30.h, // Added fixed height
          padding: const EdgeInsets.symmetric(
              horizontal: 12, vertical: 5), // Reduced padding
          decoration: BoxDecoration(
              border: Border.all(color: kblack.withOpacity(0.3)),
              borderRadius: BorderRadius.circular(20)), // Matching radius
          child: Tab(
            height: 22, // Added tab height
            child: Row(
              mainAxisSize: MainAxisSize.min, // Added to keep row compact
              children: [
                const Text('Self to others'),
                adjustWidth(5.w),
                CircleAvatar(
                  radius: 8, // Reduced radius
                  backgroundColor: kgrey,
                  child: Obx(() => Text(
                        '${homeController.progresBarCounts.value.selfToOthers?.all ?? 0}',
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall
                            ?.copyWith(
                                fontSize: 10, // Added smaller font size
                                color:
                                    Theme.of(context).colorScheme.onTertiary),
                      )),
                )
              ],
            ),
          ),
        ),
        Container(
          height: 30.h, // Added fixed height
          padding: const EdgeInsets.symmetric(
              horizontal: 12, vertical: 5), // Reduced padding
          decoration: BoxDecoration(
              border: Border.all(color: kblack.withOpacity(0.3)),
              borderRadius: BorderRadius.circular(20)), // Matching radius
          child: Tab(
            height: 22, // Added tab height
            child: Row(
              mainAxisSize: MainAxisSize.min, // Added to keep row compact
              children: [
                const Text('Others to self'),
                adjustWidth(5.w),
                CircleAvatar(
                  radius: 8, // Reduced radius
                  backgroundColor: kgrey,
                  child: Obx(() => Text(
                        '${homeController.progresBarCounts.value.othersToSelf?.all ?? 0}',
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall
                            ?.copyWith(
                                fontSize: 10, // Added smaller font size
                                color:
                                    Theme.of(context).colorScheme.onTertiary),
                      )),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
