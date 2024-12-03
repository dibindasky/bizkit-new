import 'dart:ui';

import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/application/presentation/screens/create_task/pop_up/add_participant_pop_up.dart';
import 'package:bizkit/module/task/application/presentation/screens/create_task/widgets/container_textfield_dummy.dart';
import 'package:bizkit/module/task/application/presentation/widgets/task_textfrom_fireld.dart';
import 'package:bizkit/module/task/domain/model/quick_task/create_quick_task/create_quick_task.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/widgets/event_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class QuickTaskCreateUpdateScreen extends StatelessWidget {
  QuickTaskCreateUpdateScreen({super.key, this.edit = false});

  final bool? edit;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final taskController = Get.find<CreateTaskController>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      taskController.searchParticipants();
    });

    return Scaffold(
      body: SafeArea(
        child: Obx(
          () {
            return Stack(
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
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
                                  titleController.clear();
                                  descriptionController.clear();
                                  taskController.userslistNew.clear();
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
                                edit == true
                                    ? 'Edit Quick Task'
                                    : 'Create Quick Task',
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                              )
                            ],
                          ),
                          adjustHieght(30.h),
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
                          adjustHieght(10.h),
                          taskController.createTaskTupe.value ==
                                  TaskType.personal
                              ? kempty
                              : Text('Assign to',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall
                                      ?.copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      )),
                          taskController.createTaskTupe.value ==
                                  TaskType.personal
                              ? kempty
                              : adjustHieght(3.h),
                          taskController.createTaskTupe.value ==
                                  TaskType.personal
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
                          taskController.createTaskTupe.value ==
                                  TaskType.personal
                              ? kempty
                              : adjustHieght(10.h),
                          Obx(() {
                            final participants = taskController.userslistNew;
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
                                          taskController
                                              .removeParticipant(participant);
                                        },
                                      ))
                                  .toList(),
                            );
                          }),
                          adjustHieght(50.h),
                          Center(
                            child: EventButton(
                              color: neonNewLinearGradient,
                              width: 300.w,
                              text: edit == true
                                  ? 'Edit Quick Task'
                                  : 'Create Quick Task',
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  if (edit == true) {
                                  } else {
                                    taskController.createQuickTask(
                                      context: context,
                                      createQuickTask: CreateQuickTask(
                                        title: titleController.text,
                                        description: descriptionController.text,
                                        assignedTo: [],
                                      ),
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
                if (taskController.loadingForQuickTask.value)
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
