import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/application/presentation/screens/create_task/widgets/deadline_chooser.dart';
import 'package:bizkit/module/task/application/presentation/widgets/task_textfrom_fireld.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/event_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../../../domain/model/task/task_model/sub_task.dart';

class SubTaskCreationCustomDialog extends StatelessWidget {
  const SubTaskCreationCustomDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CreateTaskController>();

    // Create TextEditingController instances
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();

    return Dialog(
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        width: 300,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Sub Task',
                style: TextStyle(
                    color: Colors.teal,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 3.h),
            Text('Add The Subtask and assign it to the concerned person',
                style: TextStyle(color: klightgrey, fontSize: 8.h),
                textAlign: TextAlign.center),
            SizedBox(height: 20.h),
            TaskTextField(
              hintText: 'Add Subtask Title here',
              controller: titleController,
            ),
            SizedBox(height: 10.h),
            TaskTextField(
              hintText: 'Description',
              controller: descriptionController,
            ),
            SizedBox(height: 10.h),
            // DeadlineChooserCreateTask(
            //   onPressed: (date) {
            //     controller.deadlineDate.value = date;
            //   },
            //   showTitle: false,
            // ),
            SizedBox(height: 30.h),
            SizedBox(
              width: double.infinity,
              child: EventButton(
                text: 'Create Sub Task',
                onTap: () {
                  controller.createSubtaskBeforeTaskCreation(
                    subTask: SubTask(
                        title: titleController.text,
                        deadLine: controller.deadlineDate.value,
                        description: descriptionController.text,
                        isCompleted: false,
                        totalTimeTaken: ''),
                  );
                  GoRouter.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
