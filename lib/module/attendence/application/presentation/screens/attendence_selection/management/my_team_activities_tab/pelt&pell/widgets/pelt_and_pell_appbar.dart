import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AttendenceMsPeltAndPellAppbar extends StatelessWidget {
  final String title;
  const AttendenceMsPeltAndPellAppbar({super.key, required this.title});

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
            Text(
              title,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
        Row(
          children: [
            const CircleAvatar(
              radius: 25,
              backgroundColor: klightDarkGrey,
              child: Icon(
                Icons.search,
                color: neonShade,
              ),
            ),
            adjustWidth(10.w),
            CircleAvatar(
                radius: 25,
                backgroundColor: klightDarkGrey,
                child: PopupMenuButton(
                  color: klightDarkGrey,
                  iconColor: kwhite,
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                        child: TextButton(
                          onPressed: () async {},
                          child: const Text(
                            "Change PELT",
                            style: TextStyle(color: kwhite),
                          ),
                        ),
                      ),
                      PopupMenuItem(
                        child: TextButton(
                          onPressed: () async {},
                          child: const Text(
                            "Select Employee",
                            style: TextStyle(color: kwhite),
                          ),
                        ),
                      ),
                      PopupMenuItem(
                        child: TextButton(
                          onPressed: () async {},
                          child: const Text(
                            "Archived",
                            style: TextStyle(color: kwhite),
                          ),
                        ),
                      ),
                    ];
                  },
                )),
          ],
        )
      ],
    );
  }
}
