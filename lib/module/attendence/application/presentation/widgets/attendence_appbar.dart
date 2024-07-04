import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/routes/routes.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../task/application/presentation/widgets/circle_avatar.dart';

class AttendenceAppBar extends StatelessWidget {
  final String title;
  const AttendenceAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 17.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        CustomCircleAvatar(
          backgroundColor: lightGrey,
          onTap: () {
            Get.toNamed(Routes.attendencNotification, id: 1);
          },
          backgroundColorInner: kneonShade,
        ),
      ],
    );
  }
}
