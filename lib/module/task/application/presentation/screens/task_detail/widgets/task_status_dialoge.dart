// ignore_for_file: unrelated_type_equality_checks

import 'dart:developer';

import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/task/application/controller/home_controller/home_controller.dart';
import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/domain/model/task/completed_task_model/completed_task_model.dart';
import 'package:bizkit/module/task/domain/model/task/kill_a_task_model/kill_a_task_model.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/widgets/event_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class TaskStatusChangeDialog extends StatelessWidget {
  const TaskStatusChangeDialog({super.key, this.taskId});

  final String? taskId;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CreateTaskController>();
    final homeController = Get.find<TaskHomeScreenController>();

    void showKillTaskConfirmationDialog() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Confirm Kill Task',
              style: Theme.of(context)
                  .textTheme
                  .displaySmall
                  ?.copyWith(fontSize: 14),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 150,
                  child: Image.asset('asset/images/yes_or_no.png'),
                ),
                Text('Are you sure you want to kill this task?',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displaySmall),
              ],
            ),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      GoRouter.of(context).pop();
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 12),
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.onSecondary,
                          borderRadius: kBorderRadius10),
                      child: Center(
                        child: Text(
                          'Cancel',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      GoRouter.of(context).pop();
                      controller.killatask(
                        context: context,
                        killAtaskModel: KillATaskModel(
                            isKilled: true, taskId: taskId ?? ''),
                      );
                      GoRouter.of(context).pop();
                      controller.taskFilterByDeadline();
                      homeController.progresBar();
                      controller.getTasksCountWithoutDate();

                      GoRouter.of(context).pop();
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 12),
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.onSecondary,
                          borderRadius: kBorderRadius10),
                      child: Center(
                        child: Text(
                          'Yes',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          );
        },
      );
    }

    void showCompleteATaskConfirmationDialog() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Confirm Complete Task',
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall
                      ?.copyWith(fontSize: 14),
                ),
                GestureDetector(
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: kGreyNormal.withOpacity(0.2),
                    child: const Icon(
                      Icons.close,
                      size: 18,
                    ),
                  ),
                )
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 150,
                  child: Image.asset('asset/images/yes_or_no.png'),
                ),
                Text(
                  textAlign: TextAlign.center,
                  'Are you sure you want to complete this task?',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ],
            ),
            actions: <Widget>[
              GestureDetector(
                onTap: () {
                  GoRouter.of(context).pop();
                  controller.completeTask(
                      context: context,
                      completedTaskModel: CompletedTaskModel(
                          isCompleted: true, taskId: taskId ?? ''));
                  GoRouter.of(context).pop();
                  controller.taskFilterByDeadline();
                  homeController.progresBar();
                  controller.getTasksCountWithoutDate();
                  homeController.fetchRecentTasks();
                  GoRouter.of(context).pop();
                },
                child: Container(
                  width: 320,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onSecondary,
                      borderRadius: kBorderRadius10),
                  child: Center(
                    child: Text(
                      'Complete ',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ),
              )
            ],
          );
        },
      );
    }

    return SizedBox(
      height: 200.h,
      width: 200.h,
      child: Stack(
        children: [
          Positioned(
            top: 50.h,
            right: 70.w,
            child: Card(
              child: Container(
                // height: 200.h,
                width: 200.h,
                decoration: BoxDecoration(
                  borderRadius: kBorderRadius20,
                  // color: kblack,
                ),
                padding: EdgeInsets.all(10.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    kHeight10,
                    EventButton(
                      text: 'Edit Task',
                      textColr: kwhite,
                      onTap: () {
                        log('Edit');
                        GoRouter.of(context).pop();
                        GoRouter.of(context).pushNamed(Routes.editTask,
                            pathParameters: {"taskId": '$taskId'});
                        final isAlreadyAdded = controller
                            .participantsForEditTask
                            .any((participant) =>
                                participant.userId ==
                                controller.singleTask.value.assignedToDetails
                                    ?.first.userId);
                        if (!isAlreadyAdded) {
                          controller.participantsForEditTask.assignAll(
                              controller.singleTask.value.assignedToDetails ??
                                  []);
                        }

                        final isTagAlreadyAdded = controller.tagsForEdit.any(
                          (tag) => tag == controller.singleTask.value.tags,
                        );

                        if (!isTagAlreadyAdded) {
                          controller.tagsForEdit.assignAll(
                              controller.singleTask.value.tags ?? []);
                        }
                      },
                      color: const LinearGradient(
                        colors: [
                          kblack,
                          kblack,
                        ],
                      ),
                      width: double.infinity,
                    ),
                    kHeight10,
                    EventButton(
                      text: 'Kill Task',
                      textColr: kwhite,
                      onTap: () {
                        log('Kill');
                        GoRouter.of(context).pop();
                        showKillTaskConfirmationDialog();
                      },
                      width: double.infinity,
                      color: const LinearGradient(
                        colors: [
                          kblack,
                          kblack,
                        ],
                      ),
                    ),
                    kHeight10,
                    EventButton(
                      text: 'Complete Task',
                      textColr: kwhite,
                      onTap: () {
                        GoRouter.of(context).pop();
                        showCompleteATaskConfirmationDialog();
                      },
                      width: double.infinity,
                      color: const LinearGradient(
                        colors: [
                          kblack,
                          kblack,
                        ],
                      ),
                    ),
                    kHeight10,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
