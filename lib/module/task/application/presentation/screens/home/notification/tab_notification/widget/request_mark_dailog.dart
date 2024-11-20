import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/domain/model/requests/accept_or_reject_model/accept_or_reject_model.dart';
import 'package:bizkit/utils/show_dialogue/dailog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<dynamic> requestMarkingDailog(
  BuildContext context, {
  String? taskId,
}) {
  final taskController = Get.find<CreateTaskController>();

  return showConfirmationDialog(
    context,
    heading: 'Do you want to accept this task?',
    actionButton: 'Accept',
    onPressed: () {
      taskController.acceptOrReject(
        context: context,
        isAccept: true,
        acceptOrReject: AcceptOrRejectModel(
          taskId: taskId,
          acceptanceStatus: 'accepted',
        ),
      );
      Navigator.pop(context);
    },
  );
}
