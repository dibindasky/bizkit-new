// import 'package:bizkit/module/biz_card/application/controller/reminder/reminder_controller.dart';
// import 'package:bizkit/module/biz_card/application/presentation/screens/home/widgets/scroll_to_top_button.dart';
// import 'package:bizkit/module/biz_card/application/presentation/screens/reminder/reminders_tabs/all_reminders_tab.dart';
// import 'package:bizkit/module/biz_card/application/presentation/screens/reminder/reminders_tabs/history_reminders_tab.dart';
// import 'package:bizkit/module/biz_card/application/presentation/screens/reminder/reminders_tabs/upcoming_reminders_tab.dart';
// import 'package:bizkit/module/biz_card/application/presentation/screens/reminder/widgets/reminders_tab.dart';
// import 'package:bizkit/utils/constants/colors.dart';
// import 'package:bizkit/utils/constants/constant.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';

// class RemindersTabsSectionSliverHeaderDelegate
//     extends SliverPersistentHeaderDelegate {
//   RemindersTabsSectionSliverHeaderDelegate(
//       this.tabController, this.scrollController);

//   final TabController tabController;
//   final ScrollController scrollController;
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
//       return Column(
//         children: [
//           adjustHieght(10.h),
//           RemindersTabs(tabController: tabController),
//           Expanded(
//               child: Stack(
//             children: [
//               TabBarView(
//                 controller: tabController,
//                 children: const [
//                   HistoryRemindersTab(),
//                   AllRemindersTab(),
//                   UpcomingRemindersTab(),
//                 ],
//               ),
//               Align(
//                 alignment: Alignment.bottomRight,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     ScrollToTopButton(scrollController: scrollController),
//                     kHeight40
//                   ],
//                 ),
//               ),
//             ],
//           )),
//         ],
//       );
//     });
//   }

//   @override
//   double get maxExtent => reminderController.allReminders.isEmpty &&
//           reminderController.historyReminders.isEmpty &&
//           reminderController.upcomingReminders.isEmpty &&
//           reminderController.todaysReminders.isEmpty
//       ? 80.0
//       : khieght;

//   @override
//   double get minExtent => reminderController.allReminders.isEmpty &&
//           reminderController.historyReminders.isEmpty &&
//           reminderController.upcomingReminders.isEmpty &&
//           reminderController.todaysReminders.isEmpty
//       ? 80.0
//       : khieght * 0.5;
//   @override
//   bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
//     return false;
//   }
// }

import 'package:bizkit/module/biz_card/application/controller/reminder/reminder_controller.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/home/widgets/scroll_to_top_button.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/reminder/reminders_tabs/all_reminders_tab.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/reminder/reminders_tabs/history_reminders_tab.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/reminder/reminders_tabs/upcoming_reminders_tab.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/reminder/widgets/reminders_tab.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RemindersTabsSectionSliverHeaderDelegate
    extends SliverPersistentHeaderDelegate {
  RemindersTabsSectionSliverHeaderDelegate(
      this.tabController, this.scrollController);

  final TabController tabController;
  final ScrollController scrollController;
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
        return const SizedBox(height: 80.0);
      }

      return SizedBox(
        height: maxExtent - shrinkOffset,
        child: Column(
          children: [
            SizedBox(height: 10.h),
            RemindersTabs(tabController: tabController),
            Expanded(
              child: Stack(
                children: [
                  TabBarView(
                    controller: tabController,
                    children: const [
                      HistoryRemindersTab(),
                      AllRemindersTab(),
                      UpcomingRemindersTab(),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ScrollToTopButton(scrollController: scrollController),
                        kHeight50
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  @override
  double get maxExtent => _isEmpty ? 80.0 : khieght;

  @override
  double get minExtent => _isEmpty ? 80.0 : khieght * 0.5;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true; // Changed to true to properly rebuild when needed
  }
}
