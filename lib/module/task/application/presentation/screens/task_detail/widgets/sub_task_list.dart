import 'package:bizkit/module/module_manager/application/controller/internet_controller.dart';
import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/application/presentation/screens/create_task/pop_up/sub_task_creation.dart';
import 'package:bizkit/module/task/application/presentation/screens/create_task/pop_up/sub_task_detail_view.dart';
import 'package:bizkit/module/task/domain/model/task/sub_task/completed_sub_task/completed_sub_task.dart';
import 'package:bizkit/module/task/domain/model/task/sub_task/delete_sub_task_model/delete_sub_task_model.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/shimmer/shimmer.dart';
import 'package:bizkit/utils/show_dialogue/confirmation_dialog.dart';
import 'package:bizkit/utils/snackbar/flutter_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TaskDetailSubtasksSection extends StatelessWidget {
  const TaskDetailSubtasksSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CreateTaskController>();
    final internetConnectinController =
        Get.find<InternetConnectionController>();
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Subtasks',
                style: Theme.of(context)
                    .textTheme
                    .displaySmall
                    ?.copyWith(fontSize: 14),
              ),
              const Spacer(),
              Obx(
                () {
                  if ((controller.singleTask.value.isCompleted != true &&
                          controller.singleTask.value.isKilled != true) &&
                      controller.singleTask.value.isOwned == true) {
                    return GestureDetector(
                      onTap: () {
                        if (internetConnectinController
                            .isConnectedToInternet.value) {
                          showDialog(
                            context: context,
                            builder: (context) => SubTaskCreationCustomDialog(
                              taskId: controller.singleTask.value.id,
                              afterTaskCreation: true,
                            ),
                          );
                        } else {
                          showCustomToast(
                            message:
                                'You must be online to create a new subtask. Please check your internet connection.',
                            backgroundColor: kred,
                          );
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 7.h, horizontal: 10.w),
                        decoration: BoxDecoration(
                            color: kneon, borderRadius: kBorderRadius5),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.add,
                              size: 15,
                              color: kwhite,
                            ),
                            adjustWidth(5.w),
                            Text(
                              'Add Sub Task',
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.copyWith(color: kwhite),
                            )
                          ],
                        ),
                      ),
                    );
                  } else {
                    return kempty;
                  }
                },
              ),
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
                    itemCount: 3,
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
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall
                            ?.copyWith(fontSize: 11, color: kGreyNormal),
                      ),
                      adjustHieght(150.h)
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
                      final subTask =
                          controller.singleTask.value.subTask?[index];
                      return GestureDetector(
                        onTap: () {},
                        child: SubTaskTileDetailPage(
                            isKilled:
                                controller.singleTask.value.isKilled ?? false,
                            taskId: controller.singleTask.value.id,
                            subTaskTitle: subTask?.title ?? '',
                            subTaskDes: subTask?.description ?? '',
                            subTaskId: subTask?.id ?? '',
                            isCompleted:
                                controller.singleTask.value.isCompleted ??
                                    false,
                            isSubTaskCompleted: subTask?.isCompleted,
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
      ),
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
      this.isKilled,
      this.isSubTaskCompleted,
      this.isOwned});

  final String? subTaskTitle;
  final String? subTaskDes;
  final String? subTaskId;
  final String? taskId;
  final bool? isCompleted;
  final String? duration;
  final bool? isOwned;
  final bool? isKilled;
  final bool? isSubTaskCompleted;

  @override
  Widget build(BuildContext context) {
    // log('isOwned  ===> $isOwned');
    // log('isCompleted  ===> $isCompleted');
    // log('isKilled  ===> $isKilled');
    String formatDateTimeWithTimeZone(DateTime dateTime) {
      final DateFormat formatter = DateFormat("yyyy-MM-ddTHH:mm:ss.SSS");
      final String formattedDate = formatter.format(dateTime);
      const String timeZoneOffset = "+00:00";
      return "$formattedDate$timeZoneOffset";
    }

    final taskController = Get.find<CreateTaskController>();
    final internetConnectinController =
        Get.find<InternetConnectionController>();
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
      child: Card(
        elevation: 0,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10.w),
          padding: EdgeInsets.all(10.w),
          decoration: BoxDecoration(
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
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                color: kneonDark,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ],
                    ),
                    adjustHieght(8.h),
                    Text(
                      subTaskDes ?? 'Subtask Description',
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            color: kGreyNormal,
                            fontSize: 11,
                          ),
                    ),
                    adjustHieght(5.h),
                  ],
                ),
              ),
              adjustWidth(20.w),
              if (isCompleted == true)
                const Icon(
                  Icons.check_box_outlined,
                  color: kwhite,
                )
              else if (isCompleted == true ||
                  isKilled == true ||
                  isSubTaskCompleted == true)
                kempty
              else if (isOwned == false)
                kempty
              else
                Obx(() => PopupMenuButton(
                      position: PopupMenuPosition.under,
                      enabled: internetConnectinController
                          .isConnectedToInternet.value,
                      color: kwhite,
                      icon: const Icon(
                        Icons.more_vert_outlined,
                      ),
                      itemBuilder: (context) {
                        List<PopupMenuItem<String>> items = [
                          PopupMenuItem<String>(
                            value: 'Edit subtask',
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) =>
                                    SubTaskCreationCustomDialog(
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
                                  );
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
                    ))
            ],
          ),
        ),
      ),
    );
  }
}
