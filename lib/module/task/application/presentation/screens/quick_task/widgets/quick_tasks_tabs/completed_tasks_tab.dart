import 'dart:math' as math;

import 'package:animate_do/animate_do.dart';
import 'package:bizkit/module/module_manager/application/controller/internet_controller.dart';
import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/application/presentation/screens/quick_task/widgets/assigness_list.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/images/network_image_with_loader.dart';
import 'package:bizkit/utils/intl/intl_date_formater.dart';
import 'package:bizkit/utils/refresh_indicator/refresh_custom.dart';
import 'package:bizkit/utils/shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CompletedQuickTasksTab extends StatelessWidget {
  const CompletedQuickTasksTab({
    super.key,
    required this.taskController,
  });

  final CreateTaskController taskController;

  @override
  Widget build(BuildContext context) {
    final internetConnectinController =
        Get.find<InternetConnectionController>();
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          height: constraints.maxHeight,
          child: Obx(
            () {
              if (taskController.loadingForCompletedQuickTasks.value) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: ShimmerLoader(
                    itemCount: 15,
                    height: 90.h,
                    width: double.infinity,
                    seprator: kHeight10,
                  ),
                );
              } else if (!internetConnectinController
                      .isConnectedToInternet.value &&
                  taskController.completedQuickTasks.isEmpty) {
                return InternetConnectionLostWidget(
                  onTap: () {
                    taskController.fetchCompletedQuickTasks();
                  },
                );
              } else if (taskController.completedQuickTasks.isEmpty) {
                return ErrorRefreshIndicator(
                  image: emptyNodata2,
                  errorMessage: 'No Completed Quick Tasks',
                  onRefresh: () {
                    taskController.fetchCompletedQuickTasks();
                  },
                );
              } else {
                return RefreshIndicator(
                  onRefresh: () async {
                    taskController.fetchCompletedQuickTasks();
                  },
                  child: Column(
                    children: [
                      kHeight5,
                      Obx(() => AnimatedContainer(
                            height: taskController
                                        .loadingForCompletedQuickTakSyncing
                                        .value ||
                                    taskController.errorQuickTakSyncing.value
                                ? null
                                : 0,
                            duration: const Duration(milliseconds: 300),
                            child: taskController
                                    .loadingForCompletedQuickTakSyncing.value
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      // Rotating Sync icon using TweenAnimationBuilder
                                      TweenAnimationBuilder(
                                        tween: Tween<double>(
                                            begin: 0, end: 2 * math.pi),
                                        duration: const Duration(seconds: 1),
                                        builder:
                                            (context, double angle, child) {
                                          return Transform.rotate(
                                            angle: angle,
                                            child: const Icon(
                                              Icons.sync,
                                              color: kneonDark,
                                              size: 15,
                                            ),
                                          );
                                        },
                                        onEnd: () {
                                          // Repeat the animation
                                          taskController
                                                  .loadingForCompletedQuickTakSyncing
                                                  .value
                                              ? Future.delayed(Duration.zero,
                                                  () {
                                                  (context as Element)
                                                      .markNeedsBuild();
                                                })
                                              : null;
                                        },
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        'Syncing ...',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall
                                            ?.copyWith(
                                              color: kneonDark,
                                            ),
                                      ),
                                    ],
                                  )
                                : taskController.errorQuickTakSyncing.value
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Icon(
                                            Icons.error_outline,
                                            color: kred,
                                            size: 12,
                                          ),
                                          const SizedBox(width: 8),
                                          Text(
                                            'Syncing failed',
                                            style: Theme.of(context)
                                                .textTheme
                                                .displaySmall
                                                ?.copyWith(
                                                    color: kred,
                                                    fontSize: 11.sp),
                                          ),
                                        ],
                                      )
                                    : const SizedBox.shrink(),
                          )),
                      Expanded(
                        child: ListView.separated(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          itemCount: taskController.completedQuickTasks.length,
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 5.h),
                          itemBuilder: (context, index) {
                            final completedQuickTasks =
                                taskController.completedQuickTasks[index];
                            return FadeInRight(
                              child: Card(
                                elevation: 0,
                                child: Padding(
                                  padding: const EdgeInsets.all(13.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        completedQuickTasks.title ??
                                            'Untitled Task',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall,
                                      ),
                                      adjustHieght(10.h),
                                      Text(
                                        completedQuickTasks.description ??
                                            'No description',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall
                                            ?.copyWith(
                                              fontSize: 10,
                                              color: kGreyNormal,
                                            ),
                                      ),
                                      adjustHieght(10.h),
                                      // Stacked profile images replacement
                                      if (completedQuickTasks.assignedTo !=
                                              null &&
                                          completedQuickTasks
                                              .assignedTo!.isNotEmpty)
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          child: SizedBox(
                                            height: 30.h,
                                            child: completedQuickTasks
                                                            .assignedTo !=
                                                        null &&
                                                    completedQuickTasks
                                                        .assignedTo!.isNotEmpty
                                                ? LayoutBuilder(
                                                    builder:
                                                        (context, constraints) {
                                                      return GestureDetector(
                                                        onTap: () {
                                                          showModalBottomSheet(
                                                            context: context,
                                                            enableDrag: true,
                                                            showDragHandle:
                                                                true,
                                                            isDismissible: true,
                                                            builder: (context) {
                                                              return AssinessQuickTaskList(
                                                                  quickTask:
                                                                      completedQuickTasks);
                                                            },
                                                          );
                                                        },
                                                        child: Stack(
                                                          clipBehavior:
                                                              Clip.none,
                                                          children:
                                                              List.generate(
                                                            completedQuickTasks
                                                                        .assignedTo!
                                                                        .length >
                                                                    4
                                                                ? 5
                                                                : completedQuickTasks
                                                                    .assignedTo!
                                                                    .length,
                                                            (index) =>
                                                                Positioned(
                                                              left: index *
                                                                  20.0, // Adjust overlap as needed
                                                              child:
                                                                  CircleAvatar(
                                                                radius: 20
                                                                    .r, // Use .r for responsive sizing
                                                                backgroundColor:
                                                                    knill,
                                                                child:
                                                                    CircleAvatar(
                                                                  backgroundColor:
                                                                      index == 4
                                                                          ? kblack
                                                                              .withOpacity(0.3)
                                                                          : null,
                                                                  radius: 18.r,
                                                                  child: index ==
                                                                          4
                                                                      ? const Icon(
                                                                          Icons
                                                                              .add,
                                                                          color:
                                                                              kwhite)
                                                                      : completedQuickTasks.assignedTo?[index].profilePicture !=
                                                                              null
                                                                          ? NetworkImageWithLoader(
                                                                              radius: 50,
                                                                              completedQuickTasks.assignedTo?[index].profilePicture ?? '',
                                                                            )
                                                                          : const Icon(
                                                                              Icons.person,
                                                                              size: 19,
                                                                            ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  )
                                                : const SizedBox.shrink(),
                                          ),
                                        ),
                                      adjustHieght(5.h),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Completed at : ${DateTimeFormater.formatTimeAMPMDate(completedQuickTasks.completedAt)}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .displaySmall
                                                ?.copyWith(fontSize: 9),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional.bottomEnd,
                                            child: Text(
                                              completedQuickTasks.isOwned ==
                                                      true
                                                  ? 'Created by you'
                                                  : 'Assigned by ${completedQuickTasks.createdBy?.name ?? 'Unknown'}',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displaySmall
                                                  ?.copyWith(fontSize: 9),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        );
      },
    );
  }
}
