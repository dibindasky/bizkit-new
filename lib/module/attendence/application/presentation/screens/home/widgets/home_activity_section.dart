import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../utils/constants/colors.dart';
import 'activity_container_widget.dart';

class AttendenceActivitySection extends StatelessWidget {
  const AttendenceActivitySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Your Activity',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            adjustHieght(5.h),
            const Text(
              'Yesterday',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
            ),
          ],
        ),
        adjustHieght(15.h),
        AttendenceActivityContainerWidget(
          color: lightGrey,
          icon: Icons.logout,
          title: 'Clock-Out',
          subTitle: '31 September 2023',
          trailingStatus: 'On-time',
          trailingTime: '7 : 30',
        ),
        adjustHieght(13.h),
        AttendenceActivityContainerWidget(
          color: lightGrey,
          icon: Icons.coffee,
          title: 'Coffee Break',
          subTitle: '31 September 2023',
          trailingStatus: 'Break',
          trailingTime: '4 : 00',
        ),
        adjustHieght(13.h),
        AttendenceActivityContainerWidget(
          color: lightGrey,
          icon: Icons.logout,
          title: 'Clock-Out',
          subTitle: '31 September 2023',
          trailingStatus: 'On-time',
          trailingTime: '7 : 00',
        ),
      ],
    );
  }
}
