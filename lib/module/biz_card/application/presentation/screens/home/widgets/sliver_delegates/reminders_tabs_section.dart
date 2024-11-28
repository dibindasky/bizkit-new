import 'package:bizkit/module/biz_card/application/presentation/screens/home/widgets/scroll_to_top_button.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/reminder/reminders_tabs/all_reminders_tab.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/reminder/reminders_tabs/history_reminders_tab.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/reminder/reminders_tabs/upcoming_reminders_tab.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/reminder/widgets/reminders_tab.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RemindersTabsSectionSliverHeaderDelegate
    extends SliverPersistentHeaderDelegate {
  RemindersTabsSectionSliverHeaderDelegate(
      this.tabController, this.scrollController);

  final TabController tabController;
  final ScrollController scrollController;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Column(
      children: [
        adjustHieght(10.h),
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
                  kHeight40
                ],
              ),
            ),
          ],
        )),
      ],
    );
  }

  @override
  double get maxExtent => khieght;

  @override
  double get minExtent => khieght * 0.5;
  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
