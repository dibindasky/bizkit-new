import 'dart:developer';
import 'package:bizkit/module/task/application/controller/caleder_view/calender_view.dart';
import 'package:bizkit/module/task/application/controller/folder/folder_controller.dart';
// import 'package:bizkit/module/task/application/controller/home_controller/home_controller.dart';
import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/application/presentation/screens/create_task/pop_up/sub_task_creation.dart';
import 'package:bizkit/module/task/domain/model/folders/get_task_inside_a_folder_params_model/get_task_inside_a_folder_params_model.dart';
import 'package:bizkit/module/task/domain/model/folders/get_tasks_inside_folder_success_responce/task.dart';
import 'package:bizkit/module/task/domain/model/folders/inner_folder/get_all_tasks_inner_folder_responce/inner_folder_task.dart';
import 'package:bizkit/module/task/domain/model/folders/inner_folder/inner_folder_tasks_get_params_model/inner_folder_tasks_get_params_model.dart';
import 'package:bizkit/module/task/domain/model/folders/inner_folder/task_add_or_delete_inner_folder_model/task_add_or_delete_inner_folder_model.dart';
import 'package:bizkit/module/task/domain/model/folders/task_add_to_folder_model/task_add_to_folder_model.dart';
// import 'package:bizkit/module/task/domain/model/task/filter_by_deadline_model/filter_by_deadline_model.dart';
// import 'package:bizkit/module/task/domain/model/task/filter_by_type_model/filter_by_type_model.dart';
import 'package:bizkit/module/task/domain/model/task/pinned_task/pinned_a_task_model/pinned_a_task_model.dart';
import 'package:bizkit/module/task/domain/model/task/pinned_task/unpin_a_task_model/unpin_a_task_model.dart';
import 'package:bizkit/module/task/domain/model/task/self_to_others_type_responce/task.dart';
import 'package:bizkit/module/task/domain/model/task/spot_light_task/spot_light_task.dart';
import 'package:bizkit/utils/animations/custom_shrinking_animation.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/utils/intl/intl_date_formater.dart';
import 'package:bizkit/utils/show_dialogue/confirmation_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskContainer extends StatelessWidget {
  TaskContainer(
      {super.key,
      required this.index,
      this.tabIndex,
      this.typeTask,
      this.tasksInsideFolder,
      this.tasksInsideInnerFolder,
      this.isInnerFolderTask = false,
      this.folderId,
      this.innerFolderId,
      this.fromFolders = false,
      this.tasksFromInnerFolder = false,
      this.tasksFromFoldrs = false,
      this.fromInnerfolder = false});

  final int index;
  final int? tabIndex;
  final Task? typeTask;
  final String? folderId;
  final String? innerFolderId;
  final InnerFolderTask? tasksInsideInnerFolder;
  final InsideAFolderTasks? tasksInsideFolder;
  final bool? isInnerFolderTask;
  final bool? fromFolders;
  final bool? fromInnerfolder;
  final bool? tasksFromFoldrs;
  final bool? tasksFromInnerFolder;

  final controller = Get.find<TaskCalenderViewController>();
  final taskController = Get.find<CreateTaskController>();
  final taskFolderController = Get.find<TaskFolderController>();

  @override
  Widget build(BuildContext context) {
    String? created, deadline;
    bool? spotlightOn;
    if (typeTask != null) {
      created = typeTask?.createdAt;
      deadline = typeTask?.deadLine;
      spotlightOn = typeTask?.spotlightOn;
    } else if (tasksInsideFolder != null) {
      created = tasksInsideFolder?.createdAt;
      deadline = tasksInsideFolder?.deadLine;
      spotlightOn = tasksInsideFolder?.spotlightOn;
    } else if (tasksInsideInnerFolder != null) {
      created = tasksInsideInnerFolder?.createdAt;
      deadline = tasksInsideInnerFolder?.deadLine;
      spotlightOn = tasksInsideInnerFolder?.spotlightOn;
    }

    final color = getSpotLightColor(created, deadline);
    return AnimatedGrowShrinkContainer(
      animate: spotlightOn ?? false,
      begin: 0.95,
      end: 0.99,
      backgroundColor: klightGreyClr,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: kBorderRadius15,
          boxShadow: spotlightOn ?? false
              ? [
                  BoxShadow(
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 1),
                      color: color.withOpacity(0.4))
                ]
              : null,
        ),
        child: Obx(
          () => Stack(
            children: [
              Card(
                color: !controller.selectedIndices.contains(index)
                    ? kblack
                    : kwhite.withOpacity(.2),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 2,
                    color: spotlightOn ?? false
                        ? color
                        : controller.selectedIndices.contains(index)
                            ? neonShade
                            : kwhite,
                  ),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              controller.selectedIndices.contains(index)
                                  ? Container(
                                      padding: const EdgeInsets.all(6),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: neonShade),
                                        borderRadius: kBorderRadius25,
                                        color: neonShade,
                                      ),
                                      child: const Icon(
                                        Icons.done,
                                        color: kwhite,
                                        size: 16,
                                      ),
                                    )
                                  : kempty,
                              adjustWidth(10),
                              Text(
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                                typeTask?.title ??
                                    tasksInsideFolder?.title ??
                                    tasksInsideInnerFolder?.title ??
                                    'Title',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: neonShade,
                                ),
                              ),
                              adjustWidth(15),
                              Card(
                                color: lightGrey,
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  child: Text(
                                    'status',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: neonShade,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          PopupMenuButton<String>(
                            color: kwhite,
                            icon: const Icon(Icons.more_vert_outlined,
                                color: kwhite),
                            onSelected: (value) {
                              if (value == 'Move task') {
                                log('Move task');
                              } else if (value == 'delete') {}
                            },
                            itemBuilder: (BuildContext context) {
                              List<PopupMenuItem<String>> items = [
                                if (typeTask?.isOwned == true ||
                                    tasksInsideFolder?.isOwned == true ||
                                    tasksInsideInnerFolder?.isOwned == true)
                                  PopupMenuItem<String>(
                                    value: typeTask?.spotlightOn == true ||
                                            tasksInsideInnerFolder
                                                    ?.spotlightOn ==
                                                true ||
                                            tasksInsideFolder?.spotlightOn ==
                                                true
                                        ? 'Spot light Task Off'
                                        : 'Spot light Task On',
                                    child: Text(
                                      typeTask?.spotlightOn == true ||
                                              tasksInsideInnerFolder
                                                      ?.spotlightOn ==
                                                  true ||
                                              tasksInsideFolder?.spotlightOn ==
                                                  true
                                          ? 'Spot light Task Off'
                                          : 'Spot light Task On',
                                      style: const TextStyle(color: kblack),
                                    ),
                                    onTap: () {
                                      taskController.spotLightTask(
                                        spotLightTask: SpotLightTask(
                                          spotLightStatus: tasksFromFoldrs ==
                                                      true &&
                                                  tasksInsideFolder
                                                          ?.spotlightOn ==
                                                      true
                                              ? false
                                              : tasksFromInnerFolder == true &&
                                                      tasksInsideInnerFolder
                                                              ?.spotlightOn ==
                                                          true
                                                  ? false
                                                  : typeTask?.spotlightOn ==
                                                          true
                                                      ? false
                                                      : true,
                                          taskId: tasksFromFoldrs == true
                                              ? tasksInsideFolder?.taskId
                                              : tasksFromInnerFolder == true
                                                  ? tasksInsideInnerFolder
                                                      ?.taskId
                                                  : typeTask?.id,
                                        ),
                                      );
                                    },
                                  ),
                                if (typeTask?.isPinned == false)
                                  PopupMenuItem<String>(
                                    value: 'Pin the task',
                                    onTap: () {
                                      taskController.pinnedATask(
                                        context: context,
                                        pinnedATask: PinnedATaskModel(
                                          isPinned: true,
                                          taskId: typeTask?.id ?? '',
                                        ),
                                      );
                                    },
                                    child: const Text(
                                      'Pin the task',
                                      style: TextStyle(color: kblack),
                                    ),
                                  ),
                                if (typeTask?.isPinned == true)
                                  PopupMenuItem<String>(
                                    value: 'Unpin the task',
                                    onTap: () {
                                      taskController.unpinATask(
                                        context: context,
                                        unpinATask: UnpinATaskModel(
                                          taskId: typeTask?.id ?? '',
                                          isPinned: false,
                                        ),
                                      );
                                    },
                                    child: const Text(
                                      'Unpin the task',
                                      style: TextStyle(color: kblack),
                                    ),
                                  ),
                                PopupMenuItem<String>(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) =>
                                          SubTaskCreationCustomDialog(
                                        afterTaskCreation: true,
                                        taskId: typeTask?.id ?? '',
                                      ),
                                    );
                                  },
                                  value: 'Add Sub Task',
                                  child: const Text(
                                    'Add Sub Task',
                                    style: TextStyle(color: kblack),
                                  ),
                                ),
                                if (tabIndex != 1 &&
                                    tabIndex != 2 &&
                                    tabIndex != 3 &&
                                    fromFolders == true)
                                  PopupMenuItem<String>(
                                    onTap: () {
                                      showCustomConfirmationDialogue(
                                        description:
                                            'Are you sure you want to remove this task?',
                                        buttonText: 'Remove',
                                        context: context,
                                        onTap: () {
                                          log('task id from dialog => ${tasksInsideFolder?.taskId}');
                                          log('Folder Id from dialog => $folderId');
                                          if (isInnerFolderTask == true ||
                                              fromInnerfolder == true) {
                                            taskFolderController
                                                .taskAddOrDeleteInnerFolder(
                                                    context: context,
                                                    addOrDelete: false,
                                                    taskAddOrDelete:
                                                        TaskAddOrDeleteInnerFolderModel(
                                                            folderId: folderId,
                                                            innerFolderId:
                                                                innerFolderId,
                                                            innerFolderTasks: [
                                                          tasksInsideInnerFolder
                                                                  ?.taskId ??
                                                              ''
                                                        ]));
                                            taskFolderController
                                                .fetchAllTasksInsideAInnerFolder(
                                                    InnerFolderTasksGetParamsModel(
                                                        folderId:
                                                            folderId ?? '',
                                                        innerFolderId:
                                                            innerFolderId ??
                                                                ''));
                                          } else {
                                            taskFolderController
                                                .tasksAddToFolder(
                                              addOrDelete: false,
                                              context: context,
                                              taskAddToFolder:
                                                  TaskAddToFolderModel(
                                                      folderId: folderId,
                                                      tasks: [
                                                    tasksInsideFolder?.taskId ??
                                                        ''
                                                  ]),
                                            );

                                            taskFolderController
                                                .fetchTasksInsideFolder(
                                                    taskInsideFolder:
                                                        GetTaskInsideAFolderParamsModel(
                                                            folderId:
                                                                folderId ??
                                                                    ''));
                                          }
                                        },
                                        title: 'Remove task',
                                        buttonColor: neonShade,
                                      );
                                    },
                                    value: 'Remove task',
                                    child: isInnerFolderTask == true
                                        ? const Text(
                                            'Remove task from inner folder',
                                            style: TextStyle(color: kblack),
                                          )
                                        : const Text(
                                            'Remove task from folder',
                                            style: TextStyle(color: kblack),
                                          ),
                                  ),
                              ];

                              return items;
                            },
                          ),
                          // adjustWidth(30.w),s
                        ],
                      ),
                      Text(
                        maxLines: 1,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        typeTask?.isOwned == true ||
                                tasksInsideFolder?.isOwned == true ||
                                tasksInsideInnerFolder?.isOwned == true
                            ? 'Created by you'
                            : 'Assigned by ${typeTask?.createdBy?.name ?? tasksInsideFolder?.createdBy?.name ?? tasksInsideInnerFolder?.createdBy?.name ?? ''}',
                        style: textThinStyle1.copyWith(fontSize: 8),
                      ),
                      adjustHieght(10),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 40,
                bottom: 40,
                left: 0,
                child: Container(
                  color: klightgrey,
                  width: 4,
                  height: 5,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // Color getSpotLightColor(String? date1, String? date2) {
  //   if (date1 == null || date2 == null) return kwhite;
  //   final int first = DateTimeFormater.calculateDifferenceInHours(date1, date2);
  //   final int second = DateTimeFormater.calculateDifferenceInHours(
  //       date1, DateTime.now().toString());
  //   if (first < second) return kred;
  //   final int part = (first / 3).round();
  //   if ((part * 2) <= second) {
  //     return leaveBorderClr;
  //   } else if (part <= second) {
  //     return neonShade;
  //   } else {
  //     return kblue;
  //   }
  // }

  Color getSpotLightColor(String? date1, String? date2) {
    if (date1 == null || date2 == null) {
      log('Invalid date(s): date1=$date1, date2=$date2', name: 'TaskContainer');
      return kwhite;
    }

    try {
      final int first =
          DateTimeFormater.calculateDifferenceInHours(date1, date2);
      final int second = DateTimeFormater.calculateDifferenceInHours(
          date1, DateTime.now().toString());

      if (first < second) return kred;
      final int part = (first / 3).round();
      if ((part * 2) <= second) {
        return leaveBorderClr;
      } else if (part <= second) {
        return neonShade;
      } else {
        return kblue;
      }
    } catch (e) {
      log('Error calculating difference in hours: $e', name: 'TaskContainer');
      return kwhite;
    }
  }
}
