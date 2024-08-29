import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../../core/routes/routes.dart';
import '../../../../../../../../../utils/constants/colors.dart';

class AttendenceReportAppbar extends StatelessWidget {
  final String title;
  const AttendenceReportAppbar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () {
                Get.toNamed(Routes.attendenceSelectionManagementSide, id: 22);
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: GestureDetector(
            onTap: () {
              Get.toNamed(Routes.attendenceReportHistory, id: 22);
            },
            child: const CircleAvatar(
              radius: 25,
              backgroundColor: Colors.grey,
              child: CircleAvatar(
                backgroundColor: klightDarkGrey,
                radius: 17,
                child: Icon(
                  Icons.history,
                  color: neonShade,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
