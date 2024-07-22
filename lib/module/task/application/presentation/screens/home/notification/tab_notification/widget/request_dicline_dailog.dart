import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/domain/model/requests/accept_or_reject_model/accept_or_reject_model.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<dynamic> requestDiclineShowDailog(
  BuildContext context, {
  String? taskId,
  String? isAccepted,
}) {
  final taskController = Get.find<CreateTaskController>();
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      backgroundColor: kNotificationColor,
      title: const Text(
        'Are you sure do you want to decline this task',
        style: TextStyle(),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text(
            'No',
            style: TextStyle(),
          ),
        ),
        TextButton(
          onPressed: () {
            taskController.acceptOrReject(
              acceptOrReject: AcceptOrRejectModel(
                taskId: taskId,
                taskType: taskController
                    .taskTypeEnumToString(taskController.createTaskTupe.value),
                acceptanceStatus: 'rejected',
              ),
            );
            Navigator.pop(context);
          },
          child: const Text(
            'Yes',
            style: TextStyle(),
          ),
        ),
      ],
    ),
  );
}
