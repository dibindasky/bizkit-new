import 'dart:developer';

import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/task/application/controller/home_controller/home_controller.dart';
import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/domain/model/task/completed_task_model/completed_task_model.dart';
import 'package:bizkit/module/task/domain/model/task/filter_by_deadline_model/filter_by_deadline_model.dart';
import 'package:bizkit/module/task/domain/model/task/kill_a_task_model/kill_a_task_model.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/utils/event_button.dart';
import 'package:bizkit/utils/intl/intl_date_formater.dart';
import 'package:bizkit/utils/snackbar/snackbar.dart';
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
            title: const Text('Confirm Kill Task'),
            content: const Text('Are you sure you want to kill this task?'),
            actions: <Widget>[
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Yes'),
                onPressed: () {
                  GoRouter.of(context).pop();
                  controller.killatask(
                    context: context,
                    killAtaskModel:
                        KillATaskModel(isKilled: true, taskId: taskId ?? ''),
                  );
                  showSnackbar(
                    context,
                    message: 'Killed task successfully',
                    backgroundColor: neonShade,
                    textColor: kblack,
                    duration: 4,
                  );
                  GoRouter.of(context).pop();
                  homeController.progresBar();
                  controller.getTasksCountWithoutDate();
                  controller.taskFilterByDeadline(
                      filterByDeadline: FilterByDeadlineModel(
                          date: DateTimeFormater.dateTimeFormat(
                              controller.selectedDate.value)));
                  GoRouter.of(context).pop();
                },
              ),
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
            title: const Text('Confirm Complete Task'),
            content: const Text('Are you sure you want to complete this task?'),
            actions: <Widget>[
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Yes'),
                onPressed: () {
                  GoRouter.of(context).pop();
                  controller.completeTask(
                      completedTaskModel: CompletedTaskModel(
                          isCompleted: true, taskId: taskId ?? ''));
                  homeController.progresBar();
                  controller.getTasksCountWithoutDate();
                  showSnackbar(
                    context,
                    message: 'Complete task successfully',
                    backgroundColor: neonShade,
                    textColor: kblack,
                    duration: 4,
                  );
                  GoRouter.of(context).pop();
                  controller.taskFilterByDeadline(
                      filterByDeadline: FilterByDeadlineModel(
                          date: DateTimeFormater.dateTimeFormat(
                              controller.selectedDate.value)));

                  GoRouter.of(context).pop();
                },
              ),
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
            child: Container(
              // height: 200.h,
              width: 200.h,
              decoration: BoxDecoration(
                borderRadius: kBorderRadius20,
                color: kblack,
              ),
              padding: EdgeInsets.all(10.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  kHeight10,
                  EventButton(
                    text: 'Edit Task',
                    onTap: () {
                      log('Edit');
                      GoRouter.of(context).pop();
                      GoRouter.of(context).pushNamed(Routes.editTask,
                          pathParameters: {"taskId": '$taskId'});
                      final isAlreadyAdded = controller.participantsForEditTask
                          .any((participant) =>
                              participant.userId ==
                              controller.singleTask.value.assignedToDetails
                                  ?.first.userId);
                      if (!isAlreadyAdded) {
                        controller.participantsForEditTask.addAll(
                            controller.singleTask.value.assignedToDetails ??
                                []);
                      }
                    },
                    wdth: double.infinity,
                  ),
                  kHeight10,
                  EventButton(
                    text: 'Kill Task',
                    onTap: () {
                      log('Kill');
                      GoRouter.of(context).pop();
                      showKillTaskConfirmationDialog();
                    },
                    wdth: double.infinity,
                  ),
                  kHeight10,
                  EventButton(
                    text: 'Complete Task',
                    onTap: () {
                      GoRouter.of(context).pop();
                      showCompleteATaskConfirmationDialog();
                    },
                    wdth: double.infinity,
                  ),
                  kHeight10,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
