import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/application/presentation/screens/create_task/widgets/deadline_chooser.dart';
import 'package:bizkit/module/task/application/presentation/screens/task_detail/widgets/attachments_task_detail.dart';
import 'package:bizkit/module/task/application/presentation/screens/task_detail/widgets/description_task_detail.dart';
import 'package:bizkit/module/task/application/presentation/screens/task_detail/widgets/sub_task_list.dart';
import 'package:bizkit/module/task/application/presentation/screens/task_detail/widgets/tag_selection_task_detail.dart';
import 'package:bizkit/module/task/application/presentation/screens/task_detail/widgets/task_detail_header_section.dart';
import 'package:bizkit/module/task/application/presentation/screens/task_detail/widgets/task_participants_details.dart';
import 'package:bizkit/module/task/application/presentation/widgets/task_textfrom_fireld.dart';
import 'package:bizkit/module/task/domain/model/folders/edit_task_responce/edit_task_responce.dart';
import 'package:bizkit/module/task/domain/model/folders/edit_task_responce/next_action_date.dart';
import 'package:bizkit/module/task/domain/model/task/get_single_task_model/get_single_task_model.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/shimmer/shimmer.dart';
import 'package:bizkit/utils/widgets/event_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ScreenTaskDetailPage extends StatelessWidget {
  ScreenTaskDetailPage({
    super.key,
    this.taskId,
  });

  final String? taskId;

  @override
  Widget build(BuildContext context) {
    final taskController = Get.find<CreateTaskController>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: RefreshIndicator(
            onRefresh: () async {
              taskController.fetchSingleTask(
                  singleTaskModel: GetSingleTaskModel(taskId: taskId ?? ''));
            },
            child: Obx(
              () {
                if (taskController.fetchSingleTaskError.value &&
                    taskController.singleTask.value.title == null) {
                  return GestureDetector(
                    onTap: () {
                      taskController.fetchSingleTask(
                          singleTaskModel:
                              GetSingleTaskModel(taskId: taskId ?? ''));
                    },
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.refresh,
                            color: neonShade,
                          ),
                          Text(
                            'Tap to retry',
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall
                                ?.copyWith(fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  );
                }
                return Stack(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const TaskDetailHeaderSection(),
                          adjustHieght(15.h),
                          const TaskDetailUserInfoSection(),
                          adjustHieght(15.h),
                          Card(
                            elevation: 0,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.w, vertical: 5.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  (taskController.singleTask.value
                                              .nextActionDate?.isEmpty ??
                                          true &&
                                              (taskController.singleTask.value
                                                      .isOwned ??
                                                  false))
                                      ? Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: CupertinoTextField(
                                            placeholder: 'Add next action date',
                                            placeholderStyle: Theme.of(context)
                                                .textTheme
                                                .displaySmall,
                                            suffix: GestureDetector(
                                              onTap: () {
                                                showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return NADCreateAndUpdateDialog(
                                                      taskId: taskId ?? '',
                                                      taskController:
                                                          taskController,
                                                    );
                                                  },
                                                );
                                              },
                                              child: const Padding(
                                                padding: EdgeInsets.only(
                                                    right: 10.0),
                                                child: Icon(Icons.add,
                                                    color: kneon),
                                              ),
                                            ),
                                            style: Theme.of(context)
                                                .textTheme
                                                .displaySmall,
                                            padding: const EdgeInsets.all(10.0),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              border: Border.all(
                                                color: kneon,
                                                width: 1.0,
                                              ),
                                            ),
                                          ),
                                        )
                                      : Obx(() {
                                          final nextActionDate = taskController
                                              .singleTask.value.nextActionDate;
                                          if (taskController.isLoading.value) {
                                            return SizedBox(
                                              height: 30.h,
                                              child: ShimmerLoader(
                                                height: 30.h,
                                                itemCount: 5,
                                                width: 80.w,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                seprator:
                                                    const SizedBox(width: 8),
                                              ),
                                            );
                                          } else if (nextActionDate == null ||
                                              nextActionDate.isEmpty) {
                                            return Column(
                                              children: [
                                                Text('Next Action Dates',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .displaySmall),
                                                adjustHieght(5.h),
                                                Center(
                                                  child: Text(
                                                      'No Next action date available',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .displaySmall
                                                          ?.copyWith(
                                                              color:
                                                                  kGreyNormal,
                                                              fontSize: 11)),
                                                ),
                                              ],
                                            );
                                          } else {
                                            return Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text('Next Action Dates',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .displaySmall
                                                            ?.copyWith(
                                                                fontSize: 14)),
                                                    IconButton(
                                                      onPressed: () {
                                                        showDialog(
                                                          context: context,
                                                          builder: (BuildContext
                                                              context) {
                                                            return NADCreateAndUpdateDialog(
                                                              taskId:
                                                                  taskId ?? '',
                                                              taskController:
                                                                  taskController,
                                                            );
                                                          },
                                                        );
                                                      },
                                                      icon:
                                                          const Icon(Icons.add),
                                                    ),
                                                  ],
                                                ),
                                                Wrap(
                                                  spacing: 8.w,
                                                  runSpacing: 8.w,
                                                  children:
                                                      nextActionDate.map((tag) {
                                                    return NextActionChip(
                                                        label: tag);
                                                  }).toList(),
                                                ),
                                              ],
                                            );
                                          }
                                        })
                                ],
                              ),
                            ),
                          ),
                          adjustHieght(15.h),
                          const TaskDetailDescriptionSection(),
                          adjustHieght(15.h),
                          const TaskDetailAttachmentsSection(),
                          adjustHieght(15.h),
                          const TaskDetailTagsSection(),
                          adjustHieght(15.h),
                          const TaskDetailSubtasksSection(),
                          adjustHieght(150.h),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class NADCreateAndUpdateDialog extends StatelessWidget {
  const NADCreateAndUpdateDialog(
      {super.key,
      required this.taskController,
      this.taskId,
      this.isEdit = false});

  final CreateTaskController taskController;

  final bool? isEdit;
  final String? taskId;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            isEdit == true ? 'Update Next Action Date' : 'New Next Action Date',
            style: Theme.of(context)
                .textTheme
                .displaySmall
                ?.copyWith(fontSize: 14),
          ),
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DeadlineChooserNextActionDate(
            onPressed: (date) {
              taskController.nextActionDate.value = date;
              FocusScope.of(context).unfocus();
            },
          ),
          adjustHieght(10.h),
          TaskTextField(
            maxLines: 5,
            hintText: 'Description',
            textCapitalization: TextCapitalization.sentences,
            controller: taskController.nexActiondateDescriptionController,
            onTapOutside: () => FocusScope.of(context).unfocus(),
          ),
          adjustHieght(15.h),
          Center(
              child: EventButton(
                  showGradiant: false,
                  color: neonNewLinearGradient,
                  text: isEdit == true ? 'Update' : 'Create',
                  onTap: () {
                    if (isEdit == true) {
                    } else {
                      var list =
                          taskController.singleTask.value.nextActionDate ?? [];
                      list.add(NextActionDate(
                        date: taskController.nextActionDate.value,
                        description: taskController
                            .nexActiondateDescriptionController.text,
                      ));
                      taskController.createNewNextActionDate(
                        context: context,
                        createNadModel: EditTaskModel(
                          isNextActionDate: true,
                          taskId: taskId,
                          nextActionDate: list,
                        ),
                      );
                    }
                  })),
        ],
      ),
    );
  }
}
