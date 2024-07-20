import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/application/presentation/screens/home/notification/tab_notification/widget/request_notification_card.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TabNotificationItemBuilder extends StatelessWidget {
  const TabNotificationItemBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final taskController = Get.find<CreateTaskController>();

    return Padding(
      padding: EdgeInsets.only(left: 15.h, right: 15.h, top: 10.h),
      child: Obx(
        () {
          if (taskController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          if (taskController.receivedRequests.isEmpty) {
            return const Center(child: Text('No new requests available'));
          }

          return RefreshIndicator(
            onRefresh: () async {
              taskController.fetchReceivedRequests();
            },
            child: ListView.separated(
              itemBuilder: (context, index) {
                return NotificationRequestCard(
                  isAccepted: taskController
                      .receivedRequests[index].assignedTo?[index].isAccepted,
                  acceptanceStatus: '',
                  taskId: '${taskController.receivedRequests[index].id}',
                  title: '${taskController.receivedRequests[index].title}',
                  priorityLevel:
                      '${taskController.receivedRequests[index].priorityLevel}',
                );
              },
              separatorBuilder: (context, index) => adjustHieght(10.h),
              itemCount: taskController.receivedRequests.length,
            ),
          );
        },
      ),
    );
  }
}
