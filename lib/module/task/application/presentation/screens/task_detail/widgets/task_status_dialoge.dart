import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/utils/event_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class TaskStatusChangeDialog extends StatelessWidget {
  const TaskStatusChangeDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      width: 200.h,
      child: Stack(
        children: [
          Positioned(
            top: 50.h,
            right: 70.w,
            child: Container(
              // height: 200.h,
              width: 200.h,
              decoration:
                  BoxDecoration(borderRadius: kBorderRadius20, color: kblack),
              padding: EdgeInsets.all(10.w),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                kHeight10,
                EventButton(
                    text: 'Edit Task',
                    onTap: () {
                      GoRouter.of(context).pushReplacementNamed(Routes.addTask,
                          pathParameters: {'edit': "true"});
                    },
                    wdth: double.infinity),
                kHeight10,
                EventButton(
                    text: 'Kill Task', onTap: () {}, wdth: double.infinity),
                kHeight10,
                EventButton(
                    text: 'Complete Task', onTap: () {}, wdth: double.infinity),
                kHeight10
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
