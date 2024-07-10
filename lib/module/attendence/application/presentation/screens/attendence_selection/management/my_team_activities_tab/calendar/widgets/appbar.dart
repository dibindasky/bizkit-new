import 'package:bizkit/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../../../utils/constants/colors.dart';

class AttendenceMsCalendarAppbar extends StatelessWidget {
  const AttendenceMsCalendarAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () {
                Get.back(id: 2);
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
            const Text(
              'Calendar',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: GestureDetector(
            onTap: () {
              Get.toNamed(Routes.attendenceMsAddNewHoliday, id: 2);
            },
            child: const CircleAvatar(
              radius: 25,
              backgroundColor: Colors.grey,
              child: CircleAvatar(
                backgroundColor: klightDarkGrey,
                radius: 17,
                child: Icon(
                  Icons.add,
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
