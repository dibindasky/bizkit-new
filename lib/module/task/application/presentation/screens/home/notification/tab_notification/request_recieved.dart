import 'package:bizkit/module/task/application/presentation/screens/home/notification/tab_notification/widget/request_notification_card.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabNotificationItemBuilder extends StatelessWidget {
  const TabNotificationItemBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.h, right: 15.h, top: 10.h),
      child: ListView.separated(
        itemBuilder: (context, index) {
          return const NotificationRequestCard();
        },
        separatorBuilder: (context, index) => adjustHieght(10.h),
        itemCount: 10,
      ),
    );
  }
}
