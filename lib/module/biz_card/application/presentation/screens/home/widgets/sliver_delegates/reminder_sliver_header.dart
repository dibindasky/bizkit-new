// import 'package:bizkit/module/biz_card/application/controller/reminder/reminder_controller.dart';
// import 'package:bizkit/utils/constants/constant.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';

// class RemindersSliverHeaderDelegate extends SliverPersistentHeaderDelegate {
//   final reminderController = Get.find<ReminderController>();
//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return Obx(() {
//       if (reminderController.allReminders.isEmpty &&
//           reminderController.historyReminders.isEmpty &&
//           reminderController.upcomingReminders.isEmpty &&
//           reminderController.todaysReminders.isEmpty) {
//         return const SizedBox.shrink();
//       }
//       return Container(
//         color: Theme.of(context).scaffoldBackgroundColor,
//         padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Obx(() => Text(
//                   reminderController.todaysReminders.isEmpty
//                       ? "Reminders"
//                       : "Today's Reminders",
//                   style: Theme.of(context).textTheme.displayMedium,
//                 )),
//             IconButton(
//               icon: Icon(
//                 Icons.close,
//                 size: 24.sp,
//                 color: Theme.of(context).scaffoldBackgroundColor,
//               ),
//               onPressed: () {},
//             ),
//           ],
//         ),
//       );
//     });
//   }

//   @override
//   double get maxExtent => reminderController.allReminders.isEmpty &&
//           reminderController.historyReminders.isEmpty &&
//           reminderController.upcomingReminders.isEmpty &&
//           reminderController.todaysReminders.isEmpty
//       ? 0.0
//       : 40.h;

//   @override
//   double get minExtent => reminderController.allReminders.isEmpty &&
//           reminderController.historyReminders.isEmpty &&
//           reminderController.upcomingReminders.isEmpty &&
//           reminderController.todaysReminders.isEmpty
//       ? 0.0
//       : 40.h;

//   @override
//   bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
//     return false;
//   }
// }

import 'package:bizkit/module/biz_card/application/controller/reminder/reminder_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RemindersSliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  RemindersSliverHeaderDelegate();

  final reminderController = Get.find<ReminderController>();

  bool get _isEmpty =>
      reminderController.allReminders.isEmpty &&
      reminderController.historyReminders.isEmpty &&
      reminderController.upcomingReminders.isEmpty &&
      reminderController.todaysReminders.isEmpty;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Obx(() {
      if (_isEmpty) {
        return const SizedBox.shrink();
      }

      return Container(
        height: maxExtent,
        color: Theme.of(context).scaffoldBackgroundColor,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Obx(() => Text(
                    reminderController.todaysReminders.isEmpty
                        ? "Reminders"
                        : "Today's Reminders",
                    style: Theme.of(context).textTheme.displayMedium,
                    overflow: TextOverflow.ellipsis,
                  )),
            ),
            SizedBox(
              width: 40.w,
              height: 40.h,
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: Icon(
                  Icons.close,
                  size: 24.sp,
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      );
    });
  }

  @override
  double get maxExtent => _isEmpty ? 0.0 : 50.h;

  @override
  double get minExtent => maxExtent;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true; // Changed to true to ensure proper rebuilding
  }
}
