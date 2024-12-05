import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/application/presentation/screens/create_task/widgets/deadline_chooser.dart';
import 'package:bizkit/module/task/application/presentation/screens/task_detail/widgets/tag_selection_task_detail.dart';
import 'package:bizkit/module/task/application/presentation/widgets/task_textfrom_fireld.dart';
import 'package:bizkit/module/task/domain/model/folders/edit_task_responce/edit_task_responce.dart';
import 'package:bizkit/module/task/domain/model/folders/edit_task_responce/next_action_date.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/shimmer/shimmer.dart';
import 'package:bizkit/utils/widgets/event_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NextActionDateSection extends StatelessWidget {
  const NextActionDateSection({
    super.key,
    required this.taskId,
  });

  final String? taskId;

  @override
  Widget build(BuildContext context) {
    final taskController = Get.find<CreateTaskController>();
    return Card(
      elevation: 0,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            (taskController.singleTask.value.nextActionDate?.isEmpty ??
                    true && (taskController.singleTask.value.isOwned ?? false))
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return NADCreateAndUpdateDialog(
                              taskId: taskId ?? '',
                              taskController: taskController,
                            );
                          },
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: kneon),
                          borderRadius: kBorderRadius10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Add Next Action Date',
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                            const Icon(Icons.add)
                          ],
                        ),
                      ),
                    ),
                  )
                : Obx(() {
                    final nextActionDate =
                        taskController.singleTask.value.nextActionDate;
                    if (taskController.isLoading.value) {
                      return SizedBox(
                        height: 30.h,
                        child: ShimmerLoader(
                          height: 30.h,
                          itemCount: 5,
                          width: 80.w,
                          scrollDirection: Axis.horizontal,
                          seprator: const SizedBox(width: 8),
                        ),
                      );
                    } else if (nextActionDate == null ||
                        nextActionDate.isEmpty) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Next Action Dates',
                                  style:
                                      Theme.of(context).textTheme.displaySmall),
                              IconButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return NADCreateAndUpdateDialog(
                                        taskId: taskId ?? '',
                                        taskController: taskController,
                                      );
                                    },
                                  );
                                },
                                icon: const Icon(Icons.add),
                              ),
                            ],
                          ),
                          adjustHieght(15.h),
                          Center(
                            child: Text('No Next action date available',
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall
                                    ?.copyWith(
                                        color: kGreyNormal, fontSize: 11)),
                          ),
                        ],
                      );
                    } else {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Next Action Dates',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall
                                      ?.copyWith(fontSize: 14)),
                              IconButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return NADCreateAndUpdateDialog(
                                        taskId: taskId ?? '',
                                        taskController: taskController,
                                      );
                                    },
                                  );
                                },
                                icon: const Icon(Icons.add),
                              ),
                            ],
                          ),
                          Wrap(
                            spacing: 8.w,
                            runSpacing: 8.w,
                            children: nextActionDate.map((tag) {
                              return GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        backgroundColor: Theme.of(context)
                                            .scaffoldBackgroundColor,
                                        title: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Next Action Date',
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Card(
                                                    elevation: 0,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              25.0),
                                                      child: Text('${tag.date}',
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .displaySmall),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Card(
                                                    elevation: 0,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              25.0),
                                                      child: Text(
                                                          '${tag.description}',
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .displaySmall),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        actions: [
                                          Center(
                                            child: EventButton(
                                                width: double.infinity,
                                                color: neonNewLinearGradient,
                                                text: 'Update Next Action Date',
                                                onTap: () {
                                                  Navigator.of(context)
                                                      .pop(context);
                                                  showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return NADCreateAndUpdateDialog(
                                                        nextActionDate: tag,
                                                        isEdit: true,
                                                        taskId: taskId ?? '',
                                                        taskController:
                                                            taskController,
                                                      );
                                                    },
                                                  );
                                                }),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: NextActionChip(label: tag),
                              );
                            }).toList(),
                          ),
                        ],
                      );
                    }
                  })
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class NADCreateAndUpdateDialog extends StatelessWidget {
  NADCreateAndUpdateDialog(
      {super.key,
      required this.taskController,
      this.nextActionDate,
      this.taskId,
      this.isEdit = false});

  final CreateTaskController taskController;

  final bool? isEdit;
  final String? taskId;
  NextActionDate? nextActionDate;

  @override
  Widget build(BuildContext context) {
    if (isEdit == true) {
      taskController.nexActiondateDescriptionController.text =
          nextActionDate?.description ?? '';
    }
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
            nextActionDate: nextActionDate,
            nextActionFromEdit: isEdit,
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
                  width: double.infinity,
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
