import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../../../core/routes/routes.dart';

class AttendenceMsLeavesAppbar extends StatelessWidget {
  final String title;
  const AttendenceMsLeavesAppbar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () {
                Get.toNamed(Routes.attendenceSelectionManagementSide, id: 2);
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ],
    );
  }
}
