import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/application/presentation/screens/home/notification/send_and_received_req/widget/request_notification_card.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/refresh_indicator/refresh_custom.dart';
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
          if (taskController.loadingForRecivedRequests.value) {
            return const Center(child: CircularProgressIndicator());
          } else if (taskController.receivedRequests.isEmpty) {
            return ErrorRefreshIndicator(
              image: emptyNodata2,
              errorMessage: 'No Recieved Requests',
              onRefresh: () {
                taskController.fetchReceivedRequests();
              },
            );
          }
          return RefreshIndicator(
            onRefresh: () async {
              taskController.fetchReceivedRequests();
            },
            child: ListView.separated(
              separatorBuilder: (context, index) => adjustHieght(10.h),
              itemCount: taskController.receivedRequests.length,
              itemBuilder: (context, index) {
                return NotificationRequestCard(
                  name: taskController.receivedRequests[index].createdBy?.name,
                  taskId: taskController.receivedRequests[index].taskId,
                  title: taskController.receivedRequests[index].taskTitle,
                  des: taskController.receivedRequests[index].description,
                  deadline: taskController.receivedRequests[index].deadLine,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
