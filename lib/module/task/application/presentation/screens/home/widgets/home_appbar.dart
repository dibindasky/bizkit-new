import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/task/application/presentation/widgets/circle_avatar.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskHomeAppBar extends StatelessWidget {
  const TaskHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Welcome\nGuest',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          children: [
            CircleAvatar(
              backgroundColor: lightGrey,
              child: IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () => Get.toNamed(Routes.taskNotification, id: 1),
              ),
            ),
            adjustWidth(10),
            const CustomStackOnlineDotCircleAvatar(
              image: taskHomeNNOtificationAsset,
              dotColor: kOrange,
            ),
          ],
        ),
      ],
    );
  }
}
