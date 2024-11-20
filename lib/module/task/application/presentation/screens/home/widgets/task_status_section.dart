import 'dart:developer';

import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/task/application/controller/home_controller/home_controller.dart';
import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/utils/clipper/task_status_clipper.dart';
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
          labelPadding: EdgeInsets.zero,

          labelColor: Theme.of(context).colorScheme.onTertiary,
          // indicatorPadding: const EdgeInsets.symmetric(horizontal: -6),
          labelStyle: Theme.of(context).textTheme.displaySmall,
          onTap: (value) {
            homeController.taskStatusTabController(value);
          },
          padding: EdgeInsets.zero,
          indicator:
              BoxDecoration(color: kblack, borderRadius: kBorderRadius25),
          tabs: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                border: Border.all(color: kGreyNormal),
                borderRadius: kBorderRadius25,
              ),
              child: Tab(
                child: Row(
                  children: [
                    const Text('Self'),
                    adjustWidth(5.w),
                    CircleAvatar(
                      radius: 10,
                      backgroundColor: kgrey,
                      child: Text(
                        '${homeController.progresBarCounts.value.selfToSelf?.all ?? 0}',
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall
                            ?.copyWith(
                                color:
                                    Theme.of(context).colorScheme.onTertiary),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: kBorderRadius25,
              ),
              child: const Tab(
                child: Text('Self to others'),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: kBorderRadius25,
              ),
              child: const Tab(
                child: Text('Others to self'),
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            Get.toNamed(Routes.taskLists, id: 1);
          },
          child: SizedBox(
            height: 231.h,
            child: TabBarView(
              controller: tabController,
              children: [
                // First Tab
                Column(
                  children: [
                    adjustHieght(20.h),
                    Stack(children: [
                      ClipPath(
                        clipper: TaskStatusClipper(),
                        child: Card(
                          child: Container(
                            width: double.infinity,
                            height: 161.h,
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
                                // border: Border.all(
                                //   color: kwhite,
                                //   width: 5,
                                // ),
                                borderRadius: kBorderRadius15),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Self tasks',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall
                                        ?.copyWith(
                                            fontSize: 19,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onTertiary),
                                  ),
                                  adjustHieght(10.h),
                                  Text(
                                    '12 / 15 Task Completed',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall
                                        ?.copyWith(
                                            fontSize: 14,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onTertiary),
                                  ),
                                  adjustHieght(20.h),
                                  Text(
                                    'Progress',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall
                                        ?.copyWith(
                                            fontSize: 13,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onTertiary),
                                  ),
                                  adjustHieght(5.h),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: LinearProgressIndicator(
                                      minHeight: 13,
                                      value: ((homeController
                                                      .progresBarCounts
                                                      .value
                                                      .selfToSelf
                                                      ?.completed ??
                                                  0) *
                                              (homeController.progresBarCounts
                                                      .value.selfToSelf?.all ??
                                                  0)) /
                                          100,
                                      backgroundColor: smallBigGrey,
                                      valueColor:
                                          const AlwaysStoppedAnimation<Color>(
                                              kwhite),
                                    ),
                                  ),
                                  adjustHieght(5.h),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      "45%",
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall
                                          ?.copyWith(
                                              fontSize: 13,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onTertiary),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Positioned(
                        right: 2,
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: kblack,
                          child: Icon(
                            Icons.arrow_outward_outlined,
                            color: kwhite,
                          ),
                        ),
                      )
                    ]),
                  ],
                ),
                // Second Tab
                // Column(
                //   children: [
                //     adjustHieght(20.h),
                //     ClipPath(
                //       child: Card(
                //         child: Stack(
                //           children: [
                //             Container(
                //               width: double.infinity,
                //               height: 171.h,
                //               decoration: BoxDecoration(
                //                   gradient: neonShadeGradient,
                //                   border: Border.all(
                //                     color: kwhite,
                //                     width: 5,
                //                   ),
                //                   borderRadius: kBorderRadius15),
                //               child: Padding(
                //                 padding:
                //                     const EdgeInsets.symmetric(horizontal: 20),
                //                 child: Column(
                //                   mainAxisAlignment: MainAxisAlignment.center,
                //                   crossAxisAlignment: CrossAxisAlignment.start,
                //                   children: [
                //                     Text(
                //                       'Self to others tasks',
                //                       style: Theme.of(context)
                //                           .textTheme
                //                           .displaySmall
                //                           ?.copyWith(
                //                               fontSize: 19,
                //                               color: Theme.of(context)
                //                                   .colorScheme
                //                                   .onTertiary),
                //                     ),
                //                     adjustHieght(10.h),
                //                     Text(
                //                       '12 / 15 Task Completed',
                //                       style: Theme.of(context)
                //                           .textTheme
                //                           .displaySmall
                //                           ?.copyWith(
                //                               fontSize: 14,
                //                               color: Theme.of(context)
                //                                   .colorScheme
                //                                   .onTertiary),
                //                     ),
                //                     adjustHieght(20.h),
                //                     Text(
                //                       'Progress',
                //                       style: Theme.of(context)
                //                           .textTheme
                //                           .displaySmall
                //                           ?.copyWith(
                //                               fontSize: 13,
                //                               color: Theme.of(context)
                //                                   .colorScheme
                //                                   .onTertiary),
                //                     ),
                //                     adjustHieght(5.h),
                //                     ClipRRect(
                //                       borderRadius: BorderRadius.circular(12),
                //                       child: LinearProgressIndicator(
                //                         minHeight: 13,
                //                         value: ((45.toDouble()) / 100),
                //                         backgroundColor: smallBigGrey,
                //                         valueColor:
                //                             const AlwaysStoppedAnimation<Color>(
                //                                 kwhite),
                //                       ),
                //                     ),
                //                     adjustHieght(5.h),
                //                     Align(
                //                       alignment: Alignment.centerRight,
                //                       child: Text(
                //                         "45%",
                //                         style: Theme.of(context)
                //                             .textTheme
                //                             .displaySmall
                //                             ?.copyWith(
                //                                 fontSize: 13,
                //                                 color: Theme.of(context)
                //                                     .colorScheme
                //                                     .onTertiary),
                //                       ),
                //                     )
                //                   ],
                //                 ),
                //               ),
                //             ),
                //             const Positioned(
                //               right: 2,
                //               child: CircleAvatar(
                //                 radius: 25,
                //                 backgroundColor: kblack,
                //                 child: Icon(
                //                   Icons.arrow_outward_outlined,
                //                   color: kwhite,
                //                 ),
                //               ),
                //             )
                //           ],
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                // // Third Tab
                // Column(
                //   children: [
                //     adjustHieght(20.h),
                //     ClipPath(
                //       child: Card(
                //         child: Stack(
                //           children: [
                //             Container(
                //               width: double.infinity,
                //               height: 171.h,
                //               decoration: BoxDecoration(
                //                   gradient: neonShadeGradient,
                //                   border: Border.all(
                //                     color: kwhite,
                //                     width: 5,
                //                   ),
                //                   borderRadius: kBorderRadius15),
                //               child: Padding(
                //                 padding:
                //                     const EdgeInsets.symmetric(horizontal: 20),
                //                 child: Column(
                //                   mainAxisAlignment: MainAxisAlignment.center,
                //                   crossAxisAlignment: CrossAxisAlignment.start,
                //                   children: [
                //                     Text(
                //                       'Others to self tasks',
                //                       style: Theme.of(context)
                //                           .textTheme
                //                           .displaySmall
                //                           ?.copyWith(
                //                               fontSize: 19,
                //                               color: Theme.of(context)
                //                                   .colorScheme
                //                                   .onTertiary),
                //                     ),
                //                     adjustHieght(10.h),
                //                     Text(
                //                       '12 / 15 Task Completed',
                //                       style: Theme.of(context)
                //                           .textTheme
                //                           .displaySmall
                //                           ?.copyWith(
                //                               fontSize: 14,
                //                               color: Theme.of(context)
                //                                   .colorScheme
                //                                   .onTertiary),
                //                     ),
                //                     adjustHieght(20.h),
                //                     Text(
                //                       'Progress',
                //                       style: Theme.of(context)
                //                           .textTheme
                //                           .displaySmall
                //                           ?.copyWith(
                //                               fontSize: 13,
                //                               color: Theme.of(context)
                //                                   .colorScheme
                //                                   .onTertiary),
                //                     ),
                //                     adjustHieght(5.h),
                //                     ClipRRect(
                //                       borderRadius: BorderRadius.circular(12),
                //                       child: LinearProgressIndicator(
                //                         minHeight: 13,
                //                         value: ((45.toDouble()) / 100),
                //                         backgroundColor: smallBigGrey,
                //                         valueColor:
                //                             const AlwaysStoppedAnimation<Color>(
                //                                 kwhite),
                //                       ),
                //                     ),
                //                     adjustHieght(5.h),
                //                     Align(
                //                       alignment: Alignment.centerRight,
                //                       child: Text(
                //                         "45%",
                //                         style: Theme.of(context)
                //                             .textTheme
                //                             .displaySmall
                //                             ?.copyWith(
                //                                 fontSize: 13,
                //                                 color: Theme.of(context)
                //                                     .colorScheme
                //                                     .onTertiary),
                //                       ),
                //                     )
                //                   ],
                //                 ),
                //               ),
                //             ),
                //             const Positioned(
                //               right: 2,
                //               child: CircleAvatar(
                //                 radius: 25,
                //                 backgroundColor: kblack,
                //                 child: Icon(
                //                   Icons.arrow_outward_outlined,
                //                   color: kwhite,
                //                 ),
                //               ),
                //             )
                //           ],
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                Text('adfa'),
                Text('adfa'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
