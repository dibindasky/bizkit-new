import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';

class RemindersTabs extends StatelessWidget {
  const RemindersTabs({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: kneon,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(23),
          ),
        ),
        child: TabBar(
          indicatorPadding: const EdgeInsets.all(3),
          dividerColor: Colors.transparent,
          indicatorSize: TabBarIndicatorSize.tab,
          // isScrollable: true,
          // tabAlignment: TabAlignment.start,
          controller: tabController,
          indicator: BoxDecoration(
            color: kneon,
            borderRadius: kBorderRadius20,
          ),
          // labelStyle: textThinStyle1.copyWith(color: kwhite),
          labelColor: kwhite,
          tabs: [
            Tab(
              child: Text(
                'History',
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
            Tab(
              child: Text(
                'All reminders',
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
            Tab(
              child: Text(
                'Upcoming',
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
