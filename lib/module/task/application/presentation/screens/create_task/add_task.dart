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
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/widgets/event_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class ScreenAddTask extends StatelessWidget {
  ScreenAddTask({
    super.key,
    this.edit = false,
  });

  final bool edit;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController taskHeadController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // final taskCalenarcontroller = Get.find<TaskCalenderViewController>();
    final controller = Get.find<CreateTaskController>();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // controller.searchParticipants();
    });

    return Scaffold(
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
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  GoRouter.of(context).pop(context);
                                  controller.tags.clear();
                                  controller.subTasks.clear();
                                  controller.clearSelectedFiles();
                                  titleController.clear();
                                  controller.deadlineDateForTaskCreation.value =
                                      '';
                                  descriptionController.clear();
                                  controller.userslistNew.clear();
                                },
                                child: CircleAvatar(
                                  backgroundColor:
                                      Theme.of(context).colorScheme.onPrimary,
                                  child: Icon(
                                    Icons.arrow_back_ios_new,
                                    size: 18.sp,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onTertiary,
                                  ),
                                ),
                              ),
                              adjustWidth(20.w),
                              Text(
                                'Create Task',
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                              )
                            ],
                          ),
                          adjustHieght(20.h),
                          Text('Title',
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  )),
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
                          Text('Description',
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  )),
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
                          Text('Task Type',
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  )),
                          adjustHieght(5.h),
                          const TaskTypeRadioButtons(),
                          adjustHieght(10.h),
                          const PriorityRecurringDropDownItems(),
                          adjustHieght(10.h),
                          adjustHieght(10.h),
                          controller.createTaskTupe.value == TaskType.personal
                              ? kempty
                              : Text('Assign to',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall
                                      ?.copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      )),
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
                                      constraints: BoxConstraints(
                                          maxHeight: khieght * 0.8),
                                      enableDrag: true,
                                      isDismissible: true,
                                      isScrollControlled: true,
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
                                        side: const BorderSide(color: kneon),
                                        label: Text(
                                          participant.name ?? 'name',
                                          style: Theme.of(context)
                                              .textTheme
                                              .displaySmall,
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
                              color: neonNewLinearGradient,
                              width: 300.w,
                              text: edit ? 'Edit Task' : 'Create Task',
                              onTap: () {
                                createNewTask(controller, context);
                              },
                            ),
                          ),
                          adjustHieght(50.h),
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
