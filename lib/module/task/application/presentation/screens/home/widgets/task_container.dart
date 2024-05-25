import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class TaskContainers extends StatelessWidget {
  const TaskContainers({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TaskProgress(
          title: 'Others to self',
          progress: 78,
          onTap: () {
            Get.toNamed(Routes.taskLists);
          },
        ),
        TaskProgress(
          title: 'Self to Others',
          progress: 78,
          onTap: () {
            Get.toNamed(Routes.taskLists);
          },
        ),
        TaskProgress(
          title: 'Self to Self',
          progress: 78,
          onTap: () {
            Get.toNamed(Routes.taskLists);
          },
        ),
      ],
    );
  }
}

class TaskProgress extends StatelessWidget {
  final String title;
  final int progress;
  final VoidCallback onTap;

  const TaskProgress({
    super.key,
    required this.title,
    required this.progress,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width / 3.7,
        height: 150,
        decoration:
            BoxDecoration(borderRadius: kBorderRadius15, color: lightGrey),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                CircularProgressIndicator(
                  strokeAlign: 2,
                  value: progress / 100,
                  backgroundColor: Colors.grey[800],
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.teal),
                  strokeWidth: 6,
                ),
                Text('$progress%'),
              ],
            ),
            adjustHieght(10),
            Text(title),
          ],
        ),
      ),
    );
  }
}
