import 'dart:developer';
import 'dart:ui';

import 'package:bizkit/module/module_manager/application/controller/internet_controller.dart';
import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/application/presentation/screens/create_task/pop_up/add_paricipant_pop_for_edit_task.dart';
import 'package:bizkit/module/task/application/presentation/screens/create_task/pop_up/add_participant_pop_up.dart';
import 'package:bizkit/module/task/application/presentation/screens/create_task/widgets/container_textfield_dummy.dart';
import 'package:bizkit/module/task/application/presentation/widgets/task_textfrom_fireld.dart';
import 'package:bizkit/module/task/domain/model/quick_task/create_quick_task/create_quick_task.dart';
import 'package:bizkit/module/task/domain/model/quick_task/update_quick_task_model/update_quick_task_model.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/snackbar/flutter_toast.dart';
import 'package:bizkit/utils/widgets/event_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class QuickTaskCreateUpdateScreen extends StatelessWidget {
  QuickTaskCreateUpdateScreen({
    super.key,
    this.edit = false,
    this.quickTaskId,
  });

  final bool? edit;
  final String? quickTaskId;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final taskController = Get.find<CreateTaskController>();
    final internetConnectinController =
        Get.find<InternetConnectionController>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      taskController.recentlySearched(searchQuery: '');
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
                                  taskController.titleController.clear();
                                  taskController.descriptionController.clear();
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
                            controller: taskController.titleController,
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
                            controller: taskController.descriptionController,
                            onTapOutside: () =>
                                FocusScope.of(context).unfocus(),
                          ),
                          adjustHieght(10.h),
                          Text('Assign to',
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  )),
                          adjustHieght(3.h),
                          ContainerTextFieldDummy(
                              text: 'Assign to',
                              suffixIcon: Icons.arrow_right,
                              onTap: () {
                                showModalBottomSheet(
                                  constraints:
                                      BoxConstraints(maxHeight: khieght * 0.8),
                                  enableDrag: true,
                                  isDismissible: true,
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (context) => edit == false
                                      ? const AddParticipentBottomSheet()
                                      : const AddParticipentForQuickTaskEditBottomSheet(),
                                );
                              }),
                          edit == true
                              ? Obx(() {
                                  return Wrap(
                                    spacing: 10.w,
                                    runSpacing: 10.h,
                                    children: [
                                      ...taskController
                                          .participantsForEditQuickTask
                                          .map((participant) => Chip(
                                                deleteIconColor: kred,
                                                side: const BorderSide(
                                                    color: neonShade),
                                                label: Text(
                                                  participant.name ?? 'name',
                                                ),
                                                onDeleted: () {
                                                  log('particpant deleted');
                                                  taskController
                                                      .removeParticipantsForEditQuckTask(
                                                          participant);
                                                },
                                              ))
                                          .toList(),
                                    ],
                                  );
                                })
                              : Obx(() {
                                  final participants =
                                      taskController.userslistNew;
                                  return Wrap(
                                    spacing: 10.w,
                                    runSpacing: 10.h,
                                    children: participants
                                        .map((participant) => Chip(
                                              deleteIconColor: kred,
                                              side: const BorderSide(
                                                  color: kneon),
                                              label: Text(
                                                participant.name ?? 'name',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .displaySmall,
                                              ),
                                              onDeleted: () {
                                                taskController
                                                    .removeParticipant(
                                                        participant);
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
                              textColr: kwhite,
                              text: edit == true
                                  ? 'Edit Quick Task'
                                  : 'Create Quick Task',
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  if (edit == true) {
                                    if (internetConnectinController
                                        .isConnectedToInternet.value) {
                                      taskController.updateQuickTask(
                                        context: context,
                                        updateQuickTask: UpdateQuickTaskModel(
                                            quickTaskId: quickTaskId,
                                            title: taskController
                                                .titleController.text,
                                            description: taskController
                                                .descriptionController.text,
                                            assignedTo: []),
                                      );
                                    } else {
                                      showCustomToast(
                                        message:
                                            'You cannot edit the quick task while offline. Please check your internet connection.',
                                        backgroundColor: kred,
                                      );
                                    }
                                  } else {
                                    if (internetConnectinController
                                        .isConnectedToInternet.value) {
                                      taskController.createQuickTask(
                                        context: context,
                                        createQuickTask: CreateQuickTask(
                                          title: taskController
                                              .titleController.text,
                                          description: taskController
                                              .descriptionController.text,
                                          assignedTo: [],
                                        ),
                                      );
                                    } else {
                                      showCustomToast(
                                        message:
                                            'You must be online to create a new quick task. Please check your internet connection.',
                                        backgroundColor: kred,
                                      );
                                      taskController.titleController.clear();
                                      taskController.descriptionController
                                          .clear();
                                      taskController.userslistNew.clear();
                                    }
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
