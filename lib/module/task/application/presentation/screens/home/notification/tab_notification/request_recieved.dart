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
      child: ListView.separated(
        itemBuilder: (context, index) {
          return const NotificationRequestCard(
              // isAccepted: taskController
              //     .receivedRequests[index].tasks.first.,

              );
        },
        separatorBuilder: (context, index) => adjustHieght(10.h),
        itemCount: 5,
      ),
    );
  }

  // child: Obx(
  //   () {
  //     if (taskController.isLoading.value) {
  //       return const Center(child: CircularProgressIndicator());
  //     } else if (taskController.receivedRequests.isEmpty) {
  //       return const Center(child: Text('No new requests available'));
  //     }
  //     return RefreshIndicator(
  //       onRefresh: () async {
  //         taskController.fetchReceivedRequests();
  //       },
  //       child: ListView.separated(
  //         itemBuilder: (context, index) {
  //           return NotificationRequestCard(
  //               // isAccepted: taskController
  //               //     .receivedRequests[index].tasks.first.,

  //               );
  //         },
  //         separatorBuilder: (context, index) => adjustHieght(10.h),
  //         itemCount: 10,
  //       ),
  //     );
  //   },
  // ),
}
