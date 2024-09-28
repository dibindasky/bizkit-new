import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';

import 'upcoming_leaves_card.dart';

class AttedenceMsLeavesAndRequestsTabsViewsSection extends StatelessWidget {
  final TabController tabController;
  const AttedenceMsLeavesAndRequestsTabsViewsSection(
      {super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        controller: tabController,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return const UpcomingLeavesCard(
                  imageUrl: personDemoImg,
                  appliedDays: '09',
                  date: 'June 15th 2024 - June 25th 2024',
                  employeeName: 'Jane Cooper',
                  lastLeave: 'Jan 1st 2024',
                  leaveBalance: '15',
                  reason: 'Travelling to hometown after a long time',
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, inx) {
                return const UpcomingLeavesCard(
                  imageUrl: personDemoImg,
                  appliedDays: '03',
                  date: 'June 15th 2024 - June 25th 2024',
                  employeeName: 'Jane Cooper',
                  lastLeave: 'Jan 1st 2024',
                  leaveBalance: '15',
                  reason: 'Travelling to hometown after a long time',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
