import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/application/presentation/widgets/task_textfrom_fireld.dart';
import 'package:bizkit/module/task/domain/model/task/sub_task/edit_sub_task_model/edit_sub_task_model.dart';
import 'package:bizkit/module/task/domain/model/task/sub_task/sub_task_add_model/sub_task.dart';
import 'package:bizkit/module/task/domain/model/task/sub_task/sub_task_add_model/sub_task_add_model.dart';
import 'package:bizkit/module/task/domain/model/task/task_model/sub_task.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/event_button.dart';
import 'package:bizkit/utils/snackbar/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class SubTaskCreationCustomDialog extends StatelessWidget {
  const SubTaskCreationCustomDialog({
    super.key,
    this.afterTaskCreation,
    this.taskId,
    this.subtaskTitile,
    this.subtaskDescription,
    this.subtaskId,
    this.isEdit = false, // Default value is false
  });

  final bool? afterTaskCreation;
  final bool isEdit;
  final String? taskId;
  final String? subtaskTitile;
  final String? subtaskDescription;
  final String? subtaskId;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CreateTaskController>();

    // Create TextEditingController instances
    final titleController = TextEditingController(text: subtaskTitile);
    final descriptionController =
        TextEditingController(text: subtaskDescription);

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
            Center(
              child: Text(
                isEdit ? 'Edit Sub Task' : 'Sub Task',
                style: TextStyle(
                    color: Colors.teal,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 9.h),
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
            SizedBox(height: 30.h),
            SizedBox(
              width: double.infinity,
              child: EventButton(
                text: isEdit ? 'Edit Sub Task' : 'Create Sub Task',
                onTap: () {
                  if (isEdit) {
                    // Edit existing subtask
                    final editsubtask = EditSubTaskModel(
                      taskId: taskId ?? '',
                      subTaskId: subtaskId ?? '',
                      title: titleController.text,
                      description: descriptionController.text,
                    );
                    controller.editSubTask(editsubtask: editsubtask);
                    GoRouter.of(context).pop();
                  } else {
                    // Create new subtask
                    final subtasks = SubTasks(
                      title: titleController.text,
                      description: descriptionController.text,
                      isCompleted: false,
                    );

                    if (afterTaskCreation == true) {
                      controller.addSubTask(
                        newsubtask: SubTaskAddModel(
                          taskId: taskId,
                          subTask: subtasks,
                        ),
                      );
                      showSnackbar(
                        context,
                        message: 'Subtask added successfully',
                        backgroundColor: neonShade,
                        textColor: kblack,
                        duration: 4,
                      );
                      GoRouter.of(context).pop();
                    } else {
                      controller.createSubtaskBeforeTaskCreation(
                        subTask: SubTask(
                          title: titleController.text,
                          description: descriptionController.text,
                          isCompleted: false,
                        ),
                      );
                      showSnackbar(
                        context,
                        message: 'Subtask added successfully',
                        backgroundColor: neonShade,
                        textColor: kblack,
                        duration: 4,
                      );
                      GoRouter.of(context).pop();
                    }
                  }
                  // GoRouter.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
