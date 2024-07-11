import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({super.key, this.title = '', this.description = ''});

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          color: lightGrey,
          borderRadius: kBorderRadius15,
        ),
        child: Row(
          children: [
            SizedBox(
              width: kwidth * .7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                            backgroundColor: kred,
                            radius: 6.0,
                          ),
                          adjustWidth(8),
                          Text(
                            // 'Task',
                            title,
                            style: const TextStyle(color: kwhite),
                          ),
                        ],
                      ),
                      const Text(
                        '25m ago',
                        style: TextStyle(color: klightgrey, fontSize: 12.0),
                      ),
                    ],
                  ),
                  adjustHieght(8),
                  const Text(
                    'Click to get more information',
                    style: TextStyle(color: klightgrey, fontSize: 12.0),
                  ),
                  adjustHieght(4),
                  Text(
                    // 'New project task assigned to imran',
                    description, maxLines: 1, overflow: TextOverflow.clip,

                    style: const TextStyle(
                      color: kwhite,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  adjustHieght(4),
                  const Text(
                    'meeting about the new movie details',
                    style: TextStyle(color: klightgrey, fontSize: 12.0),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                adjustHieght(8),
                // const CustomStackOnlineDotCircleAvatar(
                //   isChild: false,
                //   backgroundColor: knill,
                //   image: dummyPersonImage,
                // ),
              ],
            ),
            adjustHieght(8),
          ],
        ),
      ),
    );
  }
}
