import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/application/presentation/widgets/task_textfrom_fireld.dart';
import 'package:bizkit/module/task/domain/model/task/sub_task/edit_sub_task_model/edit_sub_task_model.dart';
import 'package:bizkit/module/task/domain/model/task/sub_task/sub_task_add_model/sub_task.dart';
import 'package:bizkit/module/task/domain/model/task/sub_task/sub_task_add_model/sub_task_add_model.dart';
import 'package:bizkit/module/task/domain/model/task/task_model/sub_task.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/widgets/event_button.dart';
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
    this.isEdit = false,
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

    final titleController = TextEditingController(text: subtaskTitile);
    final descriptionController =
        TextEditingController(text: subtaskDescription);

    final _formKey = GlobalKey<FormState>(); // GlobalKey for Form

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        width: 300,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Center(
                    child: Text(isEdit ? 'Edit Sub Task' : 'Sub Task',
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(fontSize: 15, color: kneon)),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.close,
                      color: kneon,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              SizedBox(height: 9.h),
              TaskTextField(
                hintText: 'Add Subtask Title here',
                controller: titleController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Subtask title is required';
                  }
                  if (value.length < 3) {
                    return 'Subtask title must have at least 4 characters';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10.h),
              TaskTextField(
                textCapitalization: TextCapitalization.sentences,
                hintText: 'Description',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Subtask Description is required';
                  }
                  if (value.length < 4) {
                    return 'Subtask description must have at least 4 characters';
                  }
                  return null;
                },
                controller: descriptionController,
              ),
              SizedBox(height: 10.h),
              SizedBox(height: 20.h),
              SizedBox(
                width: double.infinity,
                child: EventButton(
                  color: const LinearGradient(colors: [kneon, kneon]),
                  text: isEdit ? 'Edit Sub Task' : 'Create Sub Task',
                  onTap: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      if (isEdit) {
                        // Edit existing subtask
                        final editsubtask = EditSubTaskModel(
                          taskId: taskId ?? '',
                          subTaskId: subtaskId ?? '',
                          title: titleController.text,
                          description: descriptionController.text,
                        );
                        controller.editSubTask(
                            context: context,
                            editsubtask: editsubtask,
                            taskId: taskId ?? '');
                      } else {
                        // Create new subtask
                        final subtasks = SubTasks(
                          title: titleController.text,
                          description: descriptionController.text,
                          isCompleted: false,
                        );

                        if (afterTaskCreation == true) {
                          controller.addSubTask(
                              context: context,
                              newsubtask: SubTaskAddModel(
                                taskId: taskId,
                                subTask: subtasks,
                              ),
                              taskId: taskId ?? '');
                        } else {
                          controller.createSubtaskBeforeTaskCreation(
                            subTask: SubTask(
                              title: titleController.text,
                              description: descriptionController.text,
                              isCompleted: false,
                            ),
                          );
                          GoRouter.of(context).pop();
                        }
                      }
                      // GoRouter.of(context).pop();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
