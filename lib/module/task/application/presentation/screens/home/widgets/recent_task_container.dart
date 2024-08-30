import 'package:bizkit/module/task/application/controller/chat/message_count_controller.dart';
import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/utils/animations/custom_shrinking_animation.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RecentTaskContainer extends StatelessWidget {
  const RecentTaskContainer({
    super.key,
    required this.taskTitle,
    required this.taskDeadline,
    required this.taskId,
  });

  final String taskTitle;
  final String taskDeadline;
  final String taskId;

  @override
  Widget build(BuildContext context) {
    final messageCountController = Get.find<MessageCountController>();

    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: Container(
        width: 130.w,
        height: 40.h,
        decoration: BoxDecoration(
          borderRadius: kBorderRadius10,
          color: lightGrey,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(() {
              final count = messageCountController.unreadCounts[taskId];
              if (count == null || count.value == 0) return kempty;
              return Align(
                alignment: Alignment.topRight,
                child: AnimatedGrowShrinkContainer(
                  animate: true,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: CircleAvatar(
                      radius: 5.w,
                      backgroundColor: kneonShade,
                    ),
                  ),
                ),
              );
            }),
            Text(
              taskTitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: textThinStyle1.copyWith(
                color: neonShade,
                fontSize: 14,
              ),
            ),
            Text(
              taskDeadline,
              style: textThinStyle1.copyWith(fontSize: 10),
            ),
          ],
        ),
        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   children: [
        //     Text(
        //       taskTitle,
        //       maxLines: 1,
        //       overflow: TextOverflow.ellipsis,
        //       style: textThinStyle1.copyWith(
        //         color: neonShade,
        //         fontSize: 14,
        //       ),
        //     ),
        //     Text(
        //       taskDeadline,
        //       style: textThinStyle1.copyWith(fontSize: 10),
        //     ),
        //     Obx(() {
        //       final count = messageCountController.unreadCounts[taskId ?? ''];
        //       if (count == null || count.value == 0) return kempty;
        //       return Positioned(
        //         right: 0,
        //         top: 0,
        //         child: AnimatedGrowShrinkContainer(
        //           animate: true,
        //           child: CircleAvatar(
        //             radius: 5.w,
        //             backgroundColor: kneonShade,
        //           ),
        //         ),
        //       );
        //     })
        //   ],
        // ),
      ),
    );
  }
}
