import 'dart:developer';
import 'dart:ui';
import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/task/application/controller/caleder_view/calender_view.dart';
import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/application/presentation/screens/create_task/pop_up/add_participant_pop_up.dart';
import 'package:bizkit/module/task/application/presentation/screens/create_task/widgets/attachments_chooser.dart';
import 'package:bizkit/module/task/application/presentation/screens/create_task/widgets/container_textfield_dummy.dart';
import 'package:bizkit/module/task/application/presentation/screens/create_task/widgets/deadline_chooser.dart';
import 'package:bizkit/module/task/application/presentation/screens/create_task/widgets/priority_recurring_dropdown_items.dart';
import 'package:bizkit/module/task/application/presentation/screens/create_task/widgets/sub_task_bulder.dart';
import 'package:bizkit/module/task/application/presentation/screens/create_task/widgets/tag_contaner.dart';
import 'package:bizkit/module/task/application/presentation/screens/create_task/widgets/task_type_radio_button.dart';
import 'package:bizkit/module/task/application/presentation/widgets/task_textfrom_fireld.dart';
import 'package:bizkit/module/task/domain/model/task/task_model/task_model.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/event_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class ScreenAddTask extends StatelessWidget {
  ScreenAddTask({super.key, this.edit = false});

  final bool edit;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // final taskCalenarcontroller = Get.find<TaskCalenderViewController>();
    final controller = Get.find<CreateTaskController>();
    final style = TextStyle(
      fontSize: 15.sp,
      color: neonShade,
    );
    final calendarController = Get.find<TaskCalenderViewController>();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            if (edit) {
              GoRouter.of(context).pop();
            } else if (calendarController.taskTabChangeIndex.value == 1) {
              Get.back(id: 2);
            } else {
              Get.back(id: 1);
            }
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        backgroundColor: knill,
        title: const Text('New Task'),
      ),
      body: SafeArea(
        child: Obx(
          () {
            final isLoading = controller.isLoading.value;

            return Stack(
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Title', style: style),
                          adjustHieght(3.h),
                          TaskTextField(
                            hintText: 'Title',
                            controller: titleController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Title is required';
                              }
                              return null;
                            },
                          ),
                          adjustHieght(10.h),
                          Text('Description', style: style),
                          adjustHieght(3.h),
                          TaskTextField(
                            maxLines: 5,
                            hintText: 'Description',
                            controller: descriptionController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Description is required';
                              }
                              return null;
                            },
                          ),
                          adjustHieght(3.h),
                          Text('Task Type', style: style),
                          adjustHieght(5.h),
                          const TaskTypeRadioButtons(),
                          adjustHieght(10.h),
                          const PriorityRecurringDropDownItems(),
                          adjustHieght(10.h),
                          Text('Task Head', style: style),
                          adjustHieght(3.h),
                          const TaskTextField(hintText: 'Task Head'),
                          adjustHieght(10.h),
                          Text('Assign to', style: style),
                          adjustHieght(3.h),
                          ContainerTextFieldDummy(
                            text: 'Assign to',
                            suffixIcon: Icons.arrow_right,
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) =>
                                    const AddParticipentBottomSheet(),
                              );
                            },
                          ),
                          DeadlineChooserCreateTask(
                            onPressed: (date) {
                              controller.deadlineDate.value = date;
                            },
                          ),
                          adjustHieght(10.h),
                          const TagsContainer(),
                          adjustHieght(10.h),
                          const AttachmentChooserTaskCreation(),
                          adjustHieght(10.h),
                          SubTaskBuilder(),
                          adjustHieght(10.h),
                          Center(
                            child: EventButton(
                              color: const LinearGradient(
                                  colors: [neonShade, neonShade]),
                              wdth: 300.w,
                              text: 'Create Task',
                              onTap: () {
                                if (_formKey.currentState!.validate() &&
                                    controller.participants.isNotEmpty &&
                                    controller.deadlineDate.value.isNotEmpty) {
                                  log("DeadLine => ${controller.deadlineDate.value}");

                                  controller.createNewTask(
                                    task: TaskModel(
                                      title: titleController.text,
                                      description: descriptionController.text,
                                      deadLine: controller.deadlineDate.value,
                                      assignedTo: controller.participants,
                                      attachments: [],
                                      isCompleted: false,
                                      isKilled: false,
                                      priorityLevel: controller
                                          .createPriorityLevel.value
                                          .toString(),
                                      recurrentTask:
                                          controller.createRecurring.value,
                                      subTask: [],
                                      tags: [],
                                      taskType: controller.createTaskTupe.value
                                          .toString(),
                                    ),
                                  );

                                  Future.delayed(
                                    const Duration(seconds: 2),
                                    () {
                                      Get.back(id: 1);
                                    },
                                  );
                                } else {
                                  if (controller.participants.isEmpty) {
                                    _showErrorDialog(
                                      context,
                                      'Assign to at least one participant',
                                    );
                                  }
                                  if (controller.deadlineDate.value.isEmpty) {
                                    _showErrorDialog(
                                      context,
                                      'Deadline is required',
                                    );
                                  }
                                }
                              },
                            ),
                          ),
                          adjustHieght(10.h),
                        ],
                      ),
                    ),
                  ),
                ),
                if (isLoading)
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
