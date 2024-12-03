import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';

class QuickTasksTabBar extends StatelessWidget {
  const QuickTasksTabBar({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
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
        controller: tabController,
        indicator: BoxDecoration(
          color: kneon,
          borderRadius: kBorderRadius20,
        ),
        labelStyle: textThinStyle1.copyWith(color: kwhite),
        labelColor: kwhite,
        tabs: [
          Tab(
            child: Text(
              'Active Tasks ',
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
          Tab(
            child: Text(
              'Completed Tasks',
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
        ],
      ),
    );
  }
}
