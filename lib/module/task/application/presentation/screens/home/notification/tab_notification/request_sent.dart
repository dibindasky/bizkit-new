import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/application/presentation/screens/home/notification/widget/notification_container.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/utils/refresh_indicator/refresh_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RequestSentBuilder extends StatelessWidget {
  RequestSentBuilder({super.key});

  final taskController = Get.find<CreateTaskController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.h, right: 15.h, top: 10.h),
      child: Obx(
        () {
          if (taskController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          if (taskController.sentRequests.isEmpty) {
            return ErrorRefreshIndicator(
              image: emptyNodata2,
              errorMessage: 'No sent requests available',
              onRefresh: () {
                taskController.fetchReceivedRequests();
              },
            );
          }
          return RefreshIndicator(
            onRefresh: () async {
              taskController.fetchSendRequests();
            },
            child: ListView.separated(
              separatorBuilder: (context, index) => adjustHieght(10),
              itemCount: taskController.sentRequests.length,
              itemBuilder: (context, index) {
                return NotificationCard(
                  title: '${taskController.sentRequests[index].title}',
                  description:
                      '${taskController.sentRequests[index].description}',
                );
              },
            ),
          );
        },
      ),
    );
  }
}
