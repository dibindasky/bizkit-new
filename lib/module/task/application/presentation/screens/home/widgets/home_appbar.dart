import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/task/application/presentation/widgets/circle_avatar.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TaskHomeAppBar extends StatelessWidget {
  const TaskHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Welcome\nGuest',
          style: TextStyle(
            fontSize: 17.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          children: [
            CustomCircleAvatar(
              backgroundColor: lightGrey,
              onTap: () {
                Get.toNamed(Routes.taskNotification, id: 1);
              },
              backgroundColorInner: neonShade,
            ),
            adjustWidth(12.w),
            CustomStackOnlineDotCircleAvatar(
              onTap: () => Get.toNamed(Routes.taskTabNotification, id: 1),
              image: taskHomeNNOtificationAsset,
              dotColor: kOrange,
            ),
            adjustWidth(3.w),
          ],
        ),
      ],
    );
  }
}
