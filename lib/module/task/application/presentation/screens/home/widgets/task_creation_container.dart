import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/event_button.dart';
import 'package:flutter/material.dart';
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
        const Text(
          'Task Stats',
          style: TextStyle(
            fontSize: 17,
            // fontWeight: FontWeight.bold,
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
