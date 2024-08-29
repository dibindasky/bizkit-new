import 'dart:developer';

import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/application/presentation/screens/create_task/pop_up/sub_task_creation.dart';
import 'package:bizkit/module/task/application/presentation/screens/create_task/pop_up/sub_task_detail_view.dart';
import 'package:bizkit/module/task/domain/model/task/sub_task/completed_sub_task/completed_sub_task.dart';
import 'package:bizkit/module/task/domain/model/task/sub_task/delete_sub_task_model/delete_sub_task_model.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/utils/shimmer/shimmer.dart';
import 'package:bizkit/utils/show_dialogue/confirmation_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TaskDetailSubtasksSection extends StatelessWidget {
  const TaskDetailSubtasksSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CreateTaskController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Subtasks',
              style: textHeadStyle1.copyWith(fontSize: 13.sp),
            ),
            const Spacer(),
            controller.singleTask.value.isOwned == true
                ? GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => SubTaskCreationCustomDialog(
                          taskId: controller.singleTask.value.id,
                          afterTaskCreation: true,
                        ),
                      );
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 3.h, horizontal: 10.w),
                      decoration: BoxDecoration(
                          color: neonShade, borderRadius: kBorderRadius5),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.add,
                            color: kwhite,
                            size: 15,
                          ),
                          adjustWidth(5.w),
                          Text(
                            'Add Sub Task',
                            style: textThinStyle1.copyWith(fontSize: 13.sp),
                          )
                        ],
                      ),
                    ),
                  )
                : kempty,
          ],
        ),
        adjustHieght(5.h),
        Obx(
          () {
            if (controller.isLoading.value) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: ShimmerLoader(
                  height: 30.h,
                  itemCount: controller.singleTask.value.subTask?.length ?? 2,
                  width: 80.w,
                  seprator: const SizedBox(
                    height: 10,
                  ),
                ),
              );
            } else if (controller.singleTask.value.subTask?.isEmpty ?? true) {
              return Center(
                child: Column(
                  children: [
                    adjustHieght(20.h),
                    Text(
                      'No Subtasks available',
                      style: textThinStyle1.copyWith(
                          color: klightgrey, fontSize: 12.sp),
                    ),
                  ],
                ),
              );
            } else {
              return Obx(
                () => ListView.builder(
                  itemCount: controller.singleTask.value.subTask?.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final subTask = controller.singleTask.value.subTask?[index];
                    return GestureDetector(
                      onTap: () {},
                      child: SubTaskTileDetailPage(
                          taskId: controller.singleTask.value.id,
                          subTaskTitle: subTask?.title ?? '',
                          subTaskDes: subTask?.description ?? '',
                          subTaskId: subTask?.id ?? '',
                          isCompleted: subTask?.isCompleted ?? false,
                          duration: subTask?.duration ?? '',
                          isOwned:
                              controller.singleTask.value.isOwned ?? false),
                    );
                  },
                ),
              );
            }
          },
        ),
      ],
    );
  }
}

class SubTaskTileDetailPage extends StatelessWidget {
  const SubTaskTileDetailPage(
      {super.key,
      this.subTaskTitle,
      this.subTaskDes,
      this.subTaskId,
      this.taskId,
      this.isCompleted,
      this.duration,
      this.isOwned});

  final String? subTaskTitle;
  final String? subTaskDes;
  final String? subTaskId;
  final String? taskId;
  final bool? isCompleted;
  final String? duration;
  final bool? isOwned;

  @override
  Widget build(BuildContext context) {
    log('isOwned  = $isOwned');
    String formatDateTimeWithTimeZone(DateTime dateTime) {
      final DateFormat formatter = DateFormat("yyyy-MM-ddTHH:mm:ss.SSS");
      final String formattedDate = formatter.format(dateTime);
      const String timeZoneOffset = "+00:00";
      return "$formattedDate$timeZoneOffset";
    }

    final taskController = Get.find<CreateTaskController>();
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => SubTaskDetailView(
            duration: duration,
            subTaskDes: subTaskDes,
            subTaskTitle: subTaskTitle,
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.w),
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          color: klightDarkGrey,
          borderRadius: kBorderRadius10,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      // Image.asset('asset/images/icon/Vector.png', scale: 2),
                      adjustWidth(4.w),
                      Text(
                        subTaskTitle ?? 'Subtask Title',
                        style: textHeadStyle1.copyWith(
                            fontSize: 13.sp, color: neonShade),
                      ),
                    ],
                  ),
                  adjustHieght(8.h),
                  Text(
                    subTaskDes ?? 'Subtask Description',
                    style: textThinStyle1,
                  ),
                  adjustHieght(5.h),
                ],
              ),
            ),
            adjustWidth(20.w),
            isCompleted == true || isOwned == false
                ? kempty
                : PopupMenuButton(
                    color: kwhite,
                    icon: const Icon(Icons.more_vert_outlined, color: kwhite),
                    itemBuilder: (context) {
                      List<PopupMenuItem<String>> items = [
                        PopupMenuItem<String>(
                          value: 'Edit subtask',
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => SubTaskCreationCustomDialog(
                                taskId: taskId,
                                subtaskId: subTaskId,
                                subtaskTitile: subTaskTitle,
                                subtaskDescription: subTaskDes,
                                afterTaskCreation: true,
                                isEdit: true,
                              ),
                            );
                          },
                          child: const Text(
                            'Edit subtask',
                            style: TextStyle(color: kblack),
                          ),
                        ),
                        PopupMenuItem<String>(
                          value: 'Delete subtask',
                          onTap: () {
                            showCustomConfirmationDialogue(
                              description:
                                  'Are you sure you want to delete this subtask ?',
                              buttonText: 'Delete',
                              context: context,
                              onTap: () {
                                taskController.deleteSubTask(
                                    context: context,
                                    deletesubtask: DeleteSubTaskModel(
                                        subTaskId: subTaskId ?? '',
                                        taskId: taskId ?? ''),
                                    taskId: taskId ?? '');
                              },
                              title: 'Delete Subtask',
                              buttonColor: neonShade,
                            );
                          },
                          child: const Text(
                            'Delete subtask',
                            style: TextStyle(color: kblack),
                          ),
                        ),
                        PopupMenuItem<String>(
                          value: 'Complete subtask',
                          onTap: () {
                            showCustomConfirmationDialogue(
                              description:
                                  'Are you sure you want to complete this subtask ?',
                              buttonText: 'Complete',
                              context: context,
                              onTap: () {
                                taskController.completedSubTask(
                                    completedSubTask: CompletedSubTask(
                                      isCompleted: true,
                                      subTaskId: subTaskId ?? '',
                                      taskId: taskId ?? '',
                                      totalTimeTaken:
                                          formatDateTimeWithTimeZone(
                                              DateTime.now()),
                                    ),
                                    context: context,
                                    taskId: taskId ?? '');
                              },
                              title: 'Complete Subtask',
                              buttonColor: neonShade,
                            );
                          },
                          child: const Text(
                            'Complete subtask',
                            style: TextStyle(color: kblack),
                          ),
                        ),
                      ];

                      return items;
                    },
                  )
          ],
        ),
      ),
    );
  }
}
