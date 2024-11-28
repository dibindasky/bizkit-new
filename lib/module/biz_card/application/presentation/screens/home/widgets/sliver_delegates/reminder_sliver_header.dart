import 'package:bizkit/module/biz_card/application/controller/reminder/reminder_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RemindersSliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final reminderController = Get.find<ReminderController>();
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Obx(() => Text(
                reminderController.todaysReminders.isEmpty
                    ? "Reminders"
                    : "Today's Reminders",
                style: Theme.of(context).textTheme.displayMedium,
              )),
          IconButton(
            icon: Icon(
              Icons.close,
              size: 24.sp,
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 40.h;

  @override
  double get minExtent => 40.h;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
