import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/domain/model/requests/accept_or_reject_model/accept_or_reject_model.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Future<dynamic> requestMarkingDailog(
  BuildContext context, {
  String? taskId,
  String? isAccepted,
}) {
  final taskController = Get.find<CreateTaskController>();
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      backgroundColor: kNotificationColor,
      content: SizedBox(
        height: 170.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Mark This Task As',
              style: TextStyle(fontSize: 16.sp),
            ),
            adjustHieght(20.h),
            GestureDetector(
              onTap: () {
                taskController.acceptOrReject(
                  acceptOrReject: AcceptOrRejectModel(
                    taskId: taskId,
                    taskType: 'Official',
                    acceptanceStatus: 'accepted',
                  ),
                );
                Navigator.pop(context);
              },
              child: ClipRRect(
                borderRadius: kBorderRadius15,
                child: const ColoredBox(
                  color: neonShade,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Text('Official'),
                    ),
                  ),
                ),
              ),
            ),
            adjustHieght(5.h),
            GestureDetector(
              onTap: () {
                taskController.acceptOrReject(
                  acceptOrReject: AcceptOrRejectModel(
                    taskId: taskId,
                    taskType: 'Personl',
                    acceptanceStatus: 'accepted',
                  ),
                );
                Navigator.pop(context);
              },
              child: ClipRRect(
                borderRadius: kBorderRadius15,
                child: const ColoredBox(
                  color: neonShade,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Text('Personl'),
                    ),
                  ),
                ),
              ),
            ),
            adjustHieght(5.h),
            GestureDetector(
              onTap: () {
                taskController.acceptOrReject(
                  acceptOrReject: AcceptOrRejectModel(
                    taskId: taskId,
                    taskType: 'Others',
                    acceptanceStatus: 'accepted',
                  ),
                );
                Navigator.pop(context);
              },
              child: ClipRRect(
                borderRadius: kBorderRadius15,
                child: const ColoredBox(
                  color: neonShade,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Text('Others'),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
