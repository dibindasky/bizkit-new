import 'dart:developer';
import 'dart:ui';
import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/application/presentation/screens/create_task/pop_up/add_paricipant_pop_for_edit_task.dart';
import 'package:bizkit/module/task/application/presentation/screens/create_task/widgets/container_textfield_dummy.dart';
import 'package:bizkit/module/task/application/presentation/screens/create_task/widgets/deadline_chooser.dart';
import 'package:bizkit/module/task/application/presentation/screens/create_task/widgets/tag_contaner.dart';
import 'package:bizkit/module/task/application/presentation/widgets/task_textfrom_fireld.dart';
import 'package:bizkit/module/task/domain/model/folders/edit_task_responce/edit_task_responce.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/widgets/event_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class ScreenEditTask extends StatelessWidget {
  ScreenEditTask({super.key, this.taskId});

  final String? taskId;

  final TextEditingController titleController = TextEditingController();

  final TextEditingController descriptionController = TextEditingController();

  // final TextEditingController taskHeadController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // final taskCalenarcontroller = Get.find<TaskCalenderViewController>();
    final createTaskController = Get.find<CreateTaskController>();

    // createTaskController.tagsForEdit =
    //     createTaskController.singleTask.value.tags ?? [];

    titleController.text =
        createTaskController.singleTask.value.title ?? 'title';
    descriptionController.text =
        createTaskController.singleTask.value.description ?? 'description';

    createTaskController.deadlineDateForTaskEdit.value =
        createTaskController.singleTask.value.deadLine ?? 'deadLine';

    createTaskController.createRecurring.value =
        createTaskController.singleTask.value.recurrentTask ?? false;

    return Scaffold(
      body: SafeArea(
        child: Obx(
          () {
            final isLoading = createTaskController.taskEditLoading.value;

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
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  GoRouter.of(context).pop(context);
                                  createTaskController.participantsForEditTask
                                      .clear();
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
                                'Edit Task',
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
                          adjustHieght(8.h),
                          TaskTextField(
                            maxLines: 5,
                            hintText: 'Description',
                            controller: descriptionController,
                          ),
                          adjustHieght(15.h),
                          Text('Assign to',
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  )),
                          adjustHieght(5.h),
                          ContainerTextFieldDummy(
                              text: 'Assign to',
                              suffixIcon: Icons.arrow_right,
                              onTap: () {
                                createTaskController.searchParticipants();
                                showModalBottomSheet(
                                  constraints:
                                      BoxConstraints(maxHeight: khieght * 0.8),
                                  enableDrag: true,
                                  isDismissible: true,
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (context) =>
                                      const AddParticipentForTaskEditBottomSheet(),
                                );
                              }),
                          adjustHieght(10.h),
                          Obx(() {
                            return Wrap(
                              spacing: 10.w,
                              runSpacing: 10.h,
                              children: [
                                ...createTaskController.participantsForEditTask
                                    .map((participant) => Chip(
                                          deleteIconColor: kred,
                                          side: const BorderSide(
                                              color: neonShade),
                                          label: Text(
                                            participant.name ?? 'name',
                                          ),
                                          onDeleted: () {
                                            log('particpant deleted');
                                            createTaskController
                                                .removeParticipantsForEdit(
                                                    participant);
                                          },
                                        ))
                                    .toList(),
                              ],
                            );
                          }),
                          adjustHieght(10.h),
                          DeadlineChooserCreateTask(
                            deadlineFromEdit: true,
                            showTitle: true,
                            onPressed: (date) {
                              createTaskController.singleTask.value.deadLine =
                                  date;
                              FocusScope.of(context).unfocus();
                            },
                          ),
                          adjustHieght(10.h),
                          TagsContainer(
                            tagsForEdit: true,
                          ),
                          adjustHieght(15.h),
                          Center(
                            child: EventButton(
                              color:
                                  const LinearGradient(colors: [kneon, kneon]),
                              width: 300.w,
                              text: 'Edit Task',
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  createTaskController.editTask(
                                      context: context,
                                      taskModel: EditTaskModel(
                                        isNextActionDate: false,
                                        deadLine: createTaskController
                                            .deadlineDateForTaskEdit.value,
                                        assignedTo: [],
                                        tags: [],
                                        taskId: taskId ?? '',
                                        title: titleController.text,
                                        description: descriptionController.text,
                                      ),
                                      taskId: taskId ?? '');
                                }
                              },
                            ),
                          ),
                          adjustHieght(17.h),
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
