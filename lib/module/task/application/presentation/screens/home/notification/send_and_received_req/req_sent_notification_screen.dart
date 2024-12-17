import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/module_manager/application/controller/internet_controller.dart';
import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/domain/model/requests/send_requests_responce/assigned_user.dart';
import 'package:bizkit/module/task/domain/model/task/get_single_task_model/get_single_task_model.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/intl/intl_date_formater.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class ReqSentNotificationScreen extends StatelessWidget {
  const ReqSentNotificationScreen(
      {super.key,
      this.title,
      this.description,
      this.assignedUsers,
      this.createdAt,
      this.taskId});

  final String? title;
  final String? taskId;
  final String? description;
  final List<AssignedUser>? assignedUsers;
  final String? createdAt;

  @override
  Widget build(BuildContext context) {
    final taskController = Get.find<CreateTaskController>();
    final internetConnectinController =
        Get.find<InternetConnectionController>();
    final DateTime? createdAtDateTime =
        createdAt != null ? DateTime.parse(createdAt!) : null;

    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: GestureDetector(
        onTap: () {
          if (internetConnectinController.isConnectedToInternet.value) {
            taskController.fetchSingleTask(
              singleTaskModel: GetSingleTaskModel(taskId: taskId),
            );

            GoRouter.of(context).pushNamed(
              Routes.taskDeail,
              pathParameters: {"taskId": '$taskId'},
            );
          } else {}
        },
        child: Card(
          elevation: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            decoration: BoxDecoration(
              borderRadius: kBorderRadius15,
            ),
            child: Row(
              children: [
                SizedBox(
                  width: kwidth * .7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CircleAvatar(
                            backgroundColor: kred,
                            radius: 6.0,
                          ),
                          adjustWidth(10),
                          Expanded(
                            child: Text(
                              title ?? '',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            createdAtDateTime != null
                                // ? DateTimeFormater.timeAgo(createdAtDateTime)
                                ? DateTimeFormater.timeAgo(createdAtDateTime)
                                : 'Unknown time',
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                        ],
                      ),
                      adjustHieght(8),
                      Text(
                        description ?? '',
                        maxLines: 2,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall
                            ?.copyWith(fontSize: 10, color: kgrey),
                      ),
                      adjustHieght(4),
                      Text(
                        assignedUsers != null && assignedUsers!.isNotEmpty
                            ? 'New project task assigned to ${assignedUsers!.map((user) => user.name).join(", ")}'
                            : 'No users assigned',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style:
                            Theme.of(context).textTheme.displaySmall?.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
