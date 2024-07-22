import 'dart:ui';
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
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/utils/event_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class ScreenEditTask extends StatelessWidget {
  ScreenEditTask({
    super.key,
  });

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  // final TextEditingController taskHeadController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // final taskCalenarcontroller = Get.find<TaskCalenderViewController>();
    final controller = Get.find<CreateTaskController>();
    final style = TextStyle(
      fontSize: 15.sp,
      color: neonShade,
    );

    titleController.text = controller.singleTask.value.title ?? 'title';
    descriptionController.text =
        controller.singleTask.value.description ?? 'description';

    controller.deadlineDate.value =
        controller.singleTask.value.deadLine ?? 'deadLine';

    controller.createRecurring.value =
        controller.singleTask.value.recurrentTask ?? false;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        backgroundColor: knill,
        title: const Text('Edit Task'),
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
                            // validator: (value) {
                            //   if (value!.isEmpty) {
                            //     return 'Description is required';
                            //   }
                            //   return null;
                            // },
                          ),
                          adjustHieght(3.h),
                          Text('Task Type', style: style),
                          adjustHieght(5.h),
                          const TaskTypeRadioButtons(),
                          adjustHieght(10.h),
                          const PriorityRecurringDropDownItems(),
                          adjustHieght(10.h),
                          // Text('Task Head', style: style),
                          // adjustHieght(3.h),
                          // TaskTextField(
                          //   hintText: 'Task Head',
                          //   controller: taskHeadController,
                          // ),
                          // adjustHieght(10.h),
                          // Text('Assign to', style: style),
                          // adjustHieght(3.h),
                          // ContainerTextFieldDummy(
                          //   text: 'Assign to',
                          //   suffixIcon: Icons.arrow_right,
                          //   onTap: () {
                          //     showModalBottomSheet(
                          //       context: context,
                          //       builder: (context) =>
                          //           const AddParticipentBottomSheet(),
                          //     );
                          //   },
                          // ),
                          DeadlineChooserCreateTask(
                            onPressed: (date) {
                              controller.deadlineDate.value = date;
                            },
                          ),
                          adjustHieght(10.h),
                          TagsContainer(),
                          // adjustHieght(10.h),
                          // const AttachmentChooserTaskCreation(),
                          // adjustHieght(10.h),
                          // SubTaskBuilder(),
                          adjustHieght(15.h),
                          Center(
                            child: EventButton(
                                color: const LinearGradient(
                                    colors: [neonShade, neonShade]),
                                wdth: 300.w,
                                text: 'Edit Task',
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {
                                    // log("DeadLine => ${controller.deadlineDate.value}");
                                    // log('======> $controller.participants');
                                    // log('createPriorityLevel value : => ${controller.createPriorityLevel.value}');

                                    controller.editTask(
                                      taskModel: TaskModel(
                                        title: titleController.text,
                                        description: descriptionController.text,
                                        deadLine: controller
                                                .deadlineDate.value.isNotEmpty
                                            ? controller.deadlineDate.value
                                            : 'deadline',
                                        assignedTo: [],
                                        attachments: [],
                                        isCompleted: false,
                                        isKilled: false,
                                        priorityLevel: controller
                                            .priorityLevelEnumToString(
                                                controller
                                                    .createPriorityLevel.value),
                                        recurrentTask:
                                            controller.createRecurring.value,
                                        subTask: [],
                                        tags: [],
                                        taskType: controller
                                            .taskTypeEnumToString(controller
                                                .createTaskTupe.value),
                                      ),
                                    );

                                    Future.delayed(
                                      const Duration(seconds: 2),
                                      () {
                                        Navigator.of(context).pop();
                                      },
                                    );
                                  }
                                }),
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
}
