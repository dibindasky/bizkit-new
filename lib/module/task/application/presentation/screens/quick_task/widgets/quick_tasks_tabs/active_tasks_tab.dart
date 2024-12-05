import 'package:animate_do/animate_do.dart';
import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/domain/model/quick_task/complete_quick_task/complete_quick_task.dart';
import 'package:bizkit/utils/animations/expansion_tile.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/images/network_image_with_loader.dart';
import 'package:bizkit/utils/refresh_indicator/refresh_custom.dart';
import 'package:bizkit/utils/shimmer/shimmer.dart';
import 'package:bizkit/utils/widgets/event_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class ActiveQuickTasksTab extends StatelessWidget {
  const ActiveQuickTasksTab({
    super.key,
    required this.taskController,
  });

  final CreateTaskController taskController;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          height: constraints.maxHeight,
          child: Obx(
            () {
              if (taskController.loadingForAllQuickTasks.value) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: ShimmerLoader(
                    itemCount: 15,
                    height: 90.h,
                    width: double.infinity,
                    seprator: kHeight10,
                  ),
                );
              } else if (taskController.quickTasks.isEmpty) {
                return ErrorRefreshIndicator(
                  image: emptyNodata2,
                  errorMessage: 'No Quick Tasks',
                  onRefresh: () {
                    taskController.fetchAllQuickTasks();
                  },
                );
              } else {
                return RefreshIndicator(
                  onRefresh: () async {
                    taskController.fetchAllQuickTasks();
                  },
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    itemCount: taskController.quickTasks.length,
                    separatorBuilder: (context, index) => SizedBox(height: 5.h),
                    itemBuilder: (context, index) {
                      final quickTask = taskController.quickTasks[index];
                      return CustomExpansionTileWidget(
                        borderColor: kblack,
                        isBorder: true,
                        child: FadeInLeft(
                          child: Card(
                            elevation: 0,
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        quickTask.title ?? 'Untitled Task',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall,
                                      ),
                                      const Icon(
                                        Iconsax.more_circle,
                                      )
                                    ],
                                  ),
                                  adjustHieght(7.h),
                                  Text(
                                    quickTask.description ?? 'No description',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall
                                        ?.copyWith(
                                          fontSize: 10,
                                          color: kGreyNormal,
                                        ),
                                  ),

                                  // Stacked profile images replacement
                                  if (quickTask.assignedTo != null &&
                                      quickTask.assignedTo!.isNotEmpty)
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0),
                                      child: SizedBox(
                                        height: 40.h,
                                        child: quickTask.assignedTo != null &&
                                                quickTask.assignedTo!.isNotEmpty
                                            ? LayoutBuilder(
                                                builder:
                                                    (context, constraints) {
                                                  return Stack(
                                                    clipBehavior: Clip.none,
                                                    children: List.generate(
                                                      quickTask
                                                          .assignedTo!.length,
                                                      (index) => Positioned(
                                                        left: index *
                                                            20.0, // Adjust overlap as needed
                                                        child: CircleAvatar(
                                                          radius: 20
                                                              .r, // Use .r for responsive sizing
                                                          backgroundColor:
                                                              knill,
                                                          child: CircleAvatar(
                                                            radius: 18.r,
                                                            child: quickTask
                                                                        .assignedTo?[
                                                                            index]
                                                                        .profilePicture !=
                                                                    null
                                                                ? NetworkImageWithLoader(
                                                                    radius: 50,
                                                                    quickTask
                                                                            .assignedTo?[index]
                                                                            .profilePicture ??
                                                                        '',
                                                                  )
                                                                : const Icon(
                                                                    Icons
                                                                        .person,
                                                                    size: 19,
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
                                  Align(
                                    alignment: AlignmentDirectional.bottomEnd,
                                    child: Text(
                                      quickTask.isOwned == true
                                          ? 'Created by you'
                                          : 'Assigned by ${quickTask.completedBy?.firstOrNull?.name ?? 'Unknown'}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall
                                          ?.copyWith(fontSize: 9),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Dismissible(
                              direction: DismissDirection.startToEnd,
                              onDismissed: (direction) {
                                // Remove the task from the list immediately to prevent it from staying in the widget tree
                                final dismissedTaskIndex =
                                    index; // Save the index before removing
                                final dismissedTask =
                                    taskController.quickTasks[index];

                                taskController.quickTasks
                                    .removeAt(dismissedTaskIndex);
                                taskController.completeQuickTask(
                                  completeQuickTask: CompleteQuickTask(
                                    isCompleted: true,
                                    quickTaskId: dismissedTask.id ?? '',
                                  ),
                                );
                              },
                              key: Key(quickTask.id ?? ''),
                              child: EventButton(
                                width: double.infinity,
                                borderRadius: 10.0,
                                textColr: kwhite,
                                color: const LinearGradient(
                                    colors: [kblack, kblack]),
                                text: taskController.loadingForQuickTask.value
                                    ? 'Loading...'
                                    : 'Swipe to complete   ➠ ',
                                onTap: () {},
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: EventButton(
                              width: double.infinity,
                              borderRadius: 10.0,
                              textColr: kwhite,
                              color: const LinearGradient(
                                  colors: [kblack, kblack]),
                              text: 'Edit quick task ',
                              onTap: () {
                                taskController.titleController.text =
                                    quickTask.title ?? '';
                                taskController.descriptionController.text =
                                    quickTask.description ?? '';
                                // taskController.participantsForEditTask.value =
                                //     quickTask.assignedTo;
                                GoRouter.of(context).pushNamed(
                                  Routes.quickTaskCreateUpdate,
                                  extra: {
                                    'edit': true,
                                    'quickTaskId': quickTask.id ?? ''
                                  },
                                );
                              },
                            ),
                          )
                        ],
                      );
                    },
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
