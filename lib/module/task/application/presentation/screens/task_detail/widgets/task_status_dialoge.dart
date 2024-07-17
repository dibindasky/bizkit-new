import 'dart:developer';

import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/domain/model/task/kill_a_task_model/kill_a_task_model.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/utils/event_button.dart';
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
              decoration:
                  BoxDecoration(borderRadius: kBorderRadius20, color: kblack),
              padding: EdgeInsets.all(10.w),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                kHeight10,
                EventButton(
                    text: 'Edit Task',
                    onTap: () {
                      log('Edit');
                      GoRouter.of(context).pop();
                      GoRouter.of(context).push(Routes.editTask);
                    },
                    wdth: double.infinity),
                kHeight10,
                EventButton(
                    text: 'Kill Task',
                    onTap: () {
                      log('Kill ');
                      GoRouter.of(context).pop();
                      controller.killatask(
                          killAtaskModel:
                              KillATaskModel(isKilled: true, taskId: taskId));
                    },
                    wdth: double.infinity),
                kHeight10,
                EventButton(
                    text: 'Complete Task',
                    onTap: () {
                      log('Complete');
                    },
                    wdth: double.infinity),
                kHeight10
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
