import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/utils/event_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TaskCreationContainer extends StatelessWidget {
  const TaskCreationContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            'Task Stats',
            style: textThinStyle1.copyWith(fontSize: 15.sp),
          ),
        ),
        EventButton(
          hieght: 32,
          wdth: 100,
          text: '+ Add Task',
          onTap: () {
            Get.toNamed(Routes.addTask, id: 1, arguments: 1);
            //  GoRouter.of(context).pushNamed(Routes.addTask);
          },
          color: const LinearGradient(colors: [neonShade, neonShade]),
        ),
      ],
    );
  }
}
