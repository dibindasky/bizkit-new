import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AttendenceMsTeamTimesheetAppbar extends StatelessWidget {
  const AttendenceMsTeamTimesheetAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () {
                Get.back(id: 22);
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
            const Text(
              'Team TimeSheet',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ],
    );
  }
}
