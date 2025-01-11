import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/task/application/controller/chat/message_count_controller.dart';
import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/domain/model/requests/send_requests_responce/assigned_user.dart';
import 'package:bizkit/module/task/domain/model/task/get_single_task_model/get_single_task_model.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/intl/intl_date_formater.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    super.key,
    this.title,
    this.message,
    this.assignedUsers,
    this.createdAt,
    this.taskId,
    this.notificationId,
    this.taskTitle,
  });

  final String? title;
  final String? taskId;
  final String? message;
  final List<AssignedUser>? assignedUsers;
  final String? createdAt;
  final String? notificationId;
  final String? taskTitle;

  @override
  Widget build(BuildContext context) {
    final taskController = Get.find<CreateTaskController>();
    final taskNotification = Get.find<MessageCountController>();

    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: GestureDetector(
        onTap: () {
          taskController.fetchSingleTask(
            singleTaskModel: GetSingleTaskModel(taskId: taskId),
          );

          GoRouter.of(context).pushNamed(
            Routes.taskDeail,
            pathParameters: {"taskId": '$taskId'},
          );
          taskNotification.clearNotification([notificationId]);
        },
        child: Dismissible(
          key: Key(notificationId!),
          onDismissed: (direction) {
            taskNotification.clearNotification([notificationId]);
          },
          child: Card(
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const CircleAvatar(
                              backgroundColor: kblue,
                              radius: 6.0,
                            ),
                            adjustWidth(8),
                            Expanded(
                              child: Text(
                                taskTitle ?? title ?? '',
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall
                                    ?.copyWith(fontSize: 14),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            // Text(
                            //   DateTimeFormater.timeAgoString(
                            //     createdAt,
                            //   ),
                            //   style: Theme.of(context)
                            //       .textTheme
                            //       .displaySmall
                            //       ?.copyWith(color: kGreyNormal),
                            // ),
                          ],
                        ),
                        adjustHieght(5),
                        Text(message ?? '',
                            maxLines: 2,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall
                                ?.copyWith(fontSize: 11)),
                        adjustHieght(4),
                        Text(
                          'Click to get more information',
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(color: kGreyNormal, fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
