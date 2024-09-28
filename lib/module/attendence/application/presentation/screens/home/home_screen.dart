import 'package:bizkit/module/attendence/application/presentation/widgets/attendence_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../utils/constants/colors.dart';
import 'widgets/activity_container_widget.dart';
import 'widgets/home_middle_section.dart';

class AttendenceHomeScreen extends StatelessWidget {
  const AttendenceHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 14.0, right: 14.0, top: 24),
          child: ListView(
            children: [
              const AttendenceAppBar(
                title: 'Welcome\nGuest',
              ),
              adjustHieght(18.h),
              AttendenceHomeMiddleSection(),
              adjustHieght(29.h),
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
                color: lightColr,
                icon: Icons.logout,
                title: 'Clock-Out',
                subTitle: '31 Septermber 2023',
                trailingStatus: 'On-time',
                trailingTime: '7 : 30',
              ),
              adjustHieght(13.h),
              AttendenceActivityContainerWidget(
                color: lightColr,
                icon: Icons.coffee,
                title: 'Coffee Break',
                subTitle: '31 Septermber 2023',
                trailingStatus: 'Break',
                trailingTime: '4 : 00',
              ),
              adjustHieght(13.h),
              AttendenceActivityContainerWidget(
                color: lightColr,
                icon: Icons.logout,
                title: 'Clock-Out',
                subTitle: '31 Septermber 2023',
                trailingStatus: 'On-time',
                trailingTime: '7 : 00',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
