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
import 'package:bizkit/core/model/userSearch/user_search_model/user_search_model.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/widgets/event_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
      controller.searchParticipants();
    });

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back(id: navigationId);
            controller.tags.clear();
            controller.subTasks.clear();
            controller.clearSelectedFiles();
            titleController.clear();
            controller.deadlineDateForTaskCreation.value = '';
            descriptionController.clear();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        backgroundColor: knill,
        title: Text(edit ? 'Edit Task' : 'New Task'),
      ),
      body: SafeArea(
        child: Obx(
          () {
            final isLoading = controller.taskCreationLoading.value;
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
                            onTapOutside: () =>
                                FocusScope.of(context).unfocus(),
                            hintText: 'Title',
                            controller: titleController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Title is required';
                              }
                              if (value.length < 4) {
                                return 'Title have minimum 4 charecters';
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
                            textCapitalization: TextCapitalization.sentences,
                            controller: descriptionController,
                            onTapOutside: () =>
                                FocusScope.of(context).unfocus(),
                          ),
                          adjustHieght(3.h),
                          Text('Task Type', style: style),
                          adjustHieght(5.h),
                          const TaskTypeRadioButtons(),
                          adjustHieght(10.h),
                          const PriorityRecurringDropDownItems(),
                          adjustHieght(10.h),
                          adjustHieght(10.h),
                          controller.createTaskTupe.value == TaskType.personal
                              ? kempty
                              : Text('Assign to', style: style),
                          controller.createTaskTupe.value == TaskType.personal
                              ? kempty
                              : adjustHieght(3.h),
                          controller.createTaskTupe.value == TaskType.personal
                              ? kempty
                              : ContainerTextFieldDummy(
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
                          controller.createTaskTupe.value == TaskType.personal
                              ? kempty
                              : adjustHieght(10.h),
                          Obx(() {
                            final participants = controller.userslistNew;
                            return Wrap(
                              spacing: 10.w,
                              runSpacing: 10.h,
                              children: participants
                                  .map((participant) => Chip(
                                        deleteIconColor: kred,
                                        side:
                                            const BorderSide(color: neonShade),
                                        label: Text(
                                          participant.name ?? 'name',
                                        ),
                                        onDeleted: () {
                                          controller
                                              .removeParticipant(participant);
                                        },
                                      ))
                                  .toList(),
                            );
                          }),
                          DeadlineChooserCreateTask(
                            showTitle: true,
                            onPressed: (date) {
                              controller.deadlineDateForTaskCreation.value =
                                  date;
                              FocusScope.of(context).unfocus();
                            },
                          ),
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
        navigationId: navigationId,
        context: context,
        task: TaskModel(
          title: titleController.text,
          description: descriptionController.text,
          deadLine: controller.deadlineDateForTaskCreation.value.isNotEmpty
              ? controller.deadlineDateForTaskCreation.value
              : '',
          assignedTo: [],
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
      controller.deadlineDate.value = '';
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
