import 'package:flutter/material.dart';

import '../../../../../../../../utils/constants/constant.dart';
import '../../user/widgets/attendence_grid_view.dart';

class GridViewSection extends StatelessWidget {
  final TabController tabController;
  const GridViewSection({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        controller: tabController,
        children: [
          AttendenceSelectionGridView(
            images: myActivitiesImageUrls,
            onTaps: myActivitiesOnTaps,
            titles: myActivitiesTitles,
          ),
          AttendenceSelectionGridView(
            images: myTeamActivitiesImageUrls,
            onTaps: myTeamActivitiesOnTaps,
            titles: myTeamActivitiesTitles,
          ),
        ],
      ),
    );
  }
}
