import 'dart:async';
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
import 'package:bizkit/module/task/domain/model/userSearch/user_search_model/user_search_model.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/event_button.dart';
import 'package:bizkit/utils/snackbar/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class ScreenAddTask extends StatelessWidget {
  ScreenAddTask({super.key, this.edit = false, required this.navigationId});

  final bool edit;
  final int navigationId;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController taskHeadController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // final taskCalenarcontroller = Get.find<TaskCalenderViewController>();
    final controller = Get.find<CreateTaskController>();
    final style = TextStyle(
      fontSize: 15.sp,
      color: neonShade,
    );

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.searchParticipants(
        user: UserSearchModel(searchTerm: ''),
      );
    });

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            if (edit) {
              GoRouter.of(context).pop();
            } else {
              Get.back(id: navigationId);
              controller.tags.clear();
              controller.subTasks.clear();
              controller.participants.clear();
              controller.clearSelectedFiles();
              titleController.clear();

              descriptionController.clear();
            }
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        backgroundColor: knill,
        title: Text(edit ? 'Edit Task' : 'New Task'),
      ),
      body: SafeArea(
        child: Obx(
          () {
            final isLoading = controller.isLoading.value;
            return Stack(
              children: [
                SingleChildScrollView(
                  controller: controller.scrollController,
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
                              if (value.length < 8) {
                                return 'Title have minimum 8 charecters';
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
                          ),
                          adjustHieght(3.h),
                          Text('Task Type', style: style),
                          adjustHieght(5.h),
                          const TaskTypeRadioButtons(),
                          adjustHieght(10.h),
                          const PriorityRecurringDropDownItems(),
                          adjustHieght(10.h),
                          adjustHieght(10.h),
                          Text('Assign to', style: style),
                          adjustHieght(3.h),
                          ContainerTextFieldDummy(
                              text: 'Assign to',
                              suffixIcon: Icons.arrow_right,
                              onTap: () {
                                showModalBottomSheet(
                                  enableDrag: true,
                                  context: context,
                                  builder: (context) =>
                                      const AddParticipentBottomSheet(),
                                );
                              }),
                          adjustHieght(10.h),
                          Obx(() {
                            final participants = controller.participants;
                            return Wrap(
                              spacing: 10.w,
                              runSpacing: 10.h,
                              children: participants
                                  .map((participant) => Chip(
                                        deleteIconColor: kred,
                                        side:
                                            const BorderSide(color: neonShade),
                                        label: Text(
                                          participant.user ?? 'name',
                                        ),
                                        onDeleted: () {
                                          controller
                                              .removeParticipant(participant);
                                        },
                                      ))
                                  .toList(),
                            );
                          }),
                          DeadlineChooserCreateTask(onPressed: (date) {
                            controller.deadlineDate.value = date;
                          }),
                          adjustHieght(10.h),
                          TagsContainer(),
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
                              text: edit ? 'Edit Task' : 'Create Task',
                              onTap: () {
                                createNewTask(controller, context);
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

  void createNewTask(CreateTaskController controller, BuildContext context) {
    if (_formKey.currentState!.validate()) {
      var attachments =
          controller.convertFilesToAttachments(controller.selectedFiles);

      controller.createNewTask(
        task: TaskModel(
          title: titleController.text,
          description: descriptionController.text,
          deadLine: controller.deadlineDate.value.isNotEmpty
              ? controller.deadlineDate.value
              : '',
          assignedTo:
              controller.participants.isNotEmpty ? controller.participants : [],
          attachments: attachments.isNotEmpty ? attachments : [],
          isCompleted: false,
          isKilled: false,
          priorityLevel: controller
              .priorityLevelEnumToString(controller.createPriorityLevel.value),
          recurrentTask: controller.createRecurring.value,
          subTask: controller.subTasks.isNotEmpty ? controller.subTasks : [],
          tags: controller.tags.isNotEmpty ? controller.tags : [],
          taskType:
              controller.taskTypeEnumToString(controller.createTaskTupe.value),
        ),
      );

      controller.userslist.clear();
      controller.tags.clear();
      controller.tags.clear();

      Future.delayed(
        const Duration(seconds: 2),
        () {
          Get.back(
            id: navigationId,
          );
          showSnackbar(
            context,
            message: 'Task created successfully',
            backgroundColor: neonShade,
            textColor: kblack,
            duration: 4,
          );
        },
      );
    } else {
      Timer(
        const Duration(milliseconds: 300),
        () => controller.scrollController.animateTo(
            controller.scrollController.position.minScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.bounceIn),
      );
    }
  }
}
