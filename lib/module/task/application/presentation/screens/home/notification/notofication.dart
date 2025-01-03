import 'package:bizkit/module/task/application/presentation/screens/home/notification/widget/notification_container.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/refresh_indicator/refresh_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../controller/chat/message_count_controller.dart';

class NotoficationBuilder extends StatelessWidget {
  const NotoficationBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final notificationController = Get.find<MessageCountController>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
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
              notificationController.taskNotification.isEmpty?
              Column(
                children: [
                  SizedBox( child: Image.asset(emptyNodata2)),
                  Text('No notifications available\n at the moment',style: Theme.of(context).textTheme.titleSmall,textAlign: TextAlign.center,)
                ],
              ):
              Expanded(
                child: Obx(() {
                  return ListView.builder(
                    itemCount: notificationController.taskNotification.length,
                    itemBuilder: (context, index) {
                      return NotificationCard(
                        taskTitle:notificationController
                            .taskNotification[index].taskTitle ,
                        title: notificationController.taskNotification[index].title,
                        message: notificationController
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
              backgroundColor: Get.isDarkMode ? kwhite : kblack,
              child: Icon(Iconsax.close_square,
                  color: Get.isDarkMode ? kblack : kwhite),
              onPressed: () {
                final ids = notificationController.taskNotification
                    .map((datas) => datas.id)
                    .toList();
                notificationController.clearNotification(ids);
                
              })
          : null,
    );
  }
}
