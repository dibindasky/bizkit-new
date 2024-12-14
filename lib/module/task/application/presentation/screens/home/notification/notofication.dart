import 'package:bizkit/module/task/application/presentation/screens/home/notification/widget/notification_container.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/widgets/popup_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../../controller/chat/message_count_controller.dart';

class NotoficationBuilder extends StatelessWidget {
  const NotoficationBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final notificationController = Get.find<MessageCountController>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      GoRouter.of(context).pop(context);
                    },
                    child: CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.onPrimary,
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        size: 18.sp,
                        color: Theme.of(context).colorScheme.onTertiary,
                      ),
                    ),
                  ),
                  adjustWidth(20.w),
                  Text(
                    'Notifications',
                    style: Theme.of(context).textTheme.displayMedium,
                  )
                ],
              ),
              adjustHieght(10.h),
              Expanded(
                child: Obx(() {
                  return ListView.separated(
                    separatorBuilder: (context, index) => adjustHieght(10),
                    itemCount: notificationController.taskNotification.length,
                    itemBuilder: (context, index) {
                      return NotificationCard(
                        title: notificationController
                            .taskNotification[index].taskTitle,
                        description: notificationController
                            .taskNotification[index].message,
                        createdAt: notificationController
                            .taskNotification[index].createdAt,
                        taskId: notificationController
                            .taskNotification[index].taskId,
                        notificationId:
                            notificationController.taskNotification[index].id,
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: notificationController.taskNotification.isNotEmpty
          ? FloatingActionButton(
              child: const Icon(Icons.close),
              onPressed: () {
                final ids = notificationController.taskNotification
                    .map((datas) => datas.id)
                    .toList();
                notificationController.clearNotification(ids);
              })
          : null,
      // body: SafeArea(
      //   child: Column(
      //     children: [
      //       Row(
      //         children: [
      //           PopupBackButton(),
      //           Text('Notification',style: Theme.of(context).textTheme.titleLarge,)
      //         ],
      //       ),

      //       Expanded(
      //         child: Padding(
      //           padding: const EdgeInsets.symmetric(horizontal: 15),
      //           child: Obx(() => ListView.separated(
      //                 separatorBuilder: (context, index) => adjustHieght(10),
      //                 itemCount: notificationController.taskNotification.length,
      //                 itemBuilder: (context, index) {
      //                   return NotificationCard(
      //                     title: notificationController
      //                         .taskNotification[index].taskTitle,
      //                     description:
      //                         notificationController.taskNotification[index].message,
      //                     createdAt: notificationController
      //                         .taskNotification[index].createdAt,
      //                     taskId:
      //                         notificationController.taskNotification[index].taskId,
      //                     notificationId:
      //                         notificationController.taskNotification[index].id,
      //                   );
      //                 },
      //               )),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
