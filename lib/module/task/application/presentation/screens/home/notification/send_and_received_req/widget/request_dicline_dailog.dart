import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/domain/model/requests/accept_or_reject_model/accept_or_reject_model.dart';
import 'package:bizkit/utils/show_dialogue/dailog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<dynamic> requestDiclineShowDailog(
  BuildContext context, {
  String? taskId,
  String? isAccepted,
}) {
  final taskController = Get.find<CreateTaskController>();

  return showConfirmationDialog(
    context,
    heading: 'Are you sure do you want to decline this task',
    actionButton: 'Reject',
    onPressed: () {
      taskController.acceptOrReject(
        context: context,
        isAccept: false,
        acceptOrReject: AcceptOrRejectModel(
          taskId: taskId,
          acceptanceStatus: 'rejected',
        ),
      );
      // Navigator.pop(context);
    },
  );
}
