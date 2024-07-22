import 'dart:developer';
import 'package:bizkit/module/task/application/controller/caleder_view/calender_view.dart';
import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/application/presentation/screens/create_task/pop_up/sub_task_creation.dart';
import 'package:bizkit/module/task/domain/model/folders/get_tasks_inside_folder_success_responce/task.dart';
import 'package:bizkit/module/task/domain/model/folders/inner_folder/get_all_tasks_inner_folder_responce/inner_folder_task.dart';
import 'package:bizkit/module/task/domain/model/task/pinned_task/pinned_a_task_model/pinned_a_task_model.dart';
import 'package:bizkit/module/task/domain/model/task/pinned_task/unpin_a_task_model/unpin_a_task_model.dart';
import 'package:bizkit/module/task/domain/model/task/self_to_others_type_responce/task.dart';
import 'package:bizkit/module/task/domain/model/task/spot_light_task/spot_light_task.dart';
import 'package:bizkit/utils/animations/custom_shrinking_animation.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/utils/intl/intl_date_formater.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskContainer extends StatelessWidget {
  TaskContainer({
    super.key,
    required this.index,
    this.tabIndex,
    this.typeTask,
    this.tasksInsideFolder,
    this.tasksInsideInnerFolder,
  });

  final int index;
  final int? tabIndex;
  final Task? typeTask;
  final InnerFolderTask? tasksInsideInnerFolder;
  final InsideAFolderTasks? tasksInsideFolder;

  final controller = Get.find<TaskCalenderViewController>();
  final taskController = Get.find<CreateTaskController>();

  @override
  Widget build(BuildContext context) {
    print('task id  =>${typeTask?.id}');
    final color = getSpotLightColor(typeTask?.createdAt, typeTask?.deadLine);
    return AnimatedGrowShrinkContainer(
      animate: typeTask?.spotlightOn ?? false,
      begin: 0.95,
      end: 0.99,
      backgroundColor: klightGreyClr,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: kBorderRadius15,
            boxShadow: typeTask?.spotlightOn ?? false
                ? [
                    BoxShadow(
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 1),
                        color: color.withOpacity(0.4))
                  ]
                : null),
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
                    color: typeTask?.spotlightOn ?? false
                        ? color
                        : controller.selectedIndices.contains(index)
                            ? neonShade
                            : kwhite,
                    // : const Color(0xFF0B06FF),
                  ),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  controller.selectedIndices.contains(index)
                                      ? Container(
                                          padding: const EdgeInsets.all(6),
                                          decoration: BoxDecoration(
                                            border:
                                                Border.all(color: neonShade),
                                            borderRadius: kBorderRadius25,
                                            color: neonShade,
                                          ),
                                          child: const Icon(
                                            Icons.done,
                                            color: kwhite,
                                            size: 16,
                                          ),
                                        )
                                      : Image.asset(
                                          'asset/images/icon/Vector.png',
                                          scale: 2,
                                        ),
                                  adjustWidth(10),
                                  Text(
                                    typeTask?.title ??
                                        tasksInsideFolder?.title ??
                                        tasksInsideInnerFolder?.title ??
                                        'Tittle',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: neonShade,
                                    ),
                                  )
                                ],
                              ),
                              PopupMenuButton<String>(
                                color: kwhite,
                                icon:
                                    const Icon(Icons.more_horiz, color: kwhite),
                                onSelected: (value) {
                                  if (value == 'Move task') {
                                    log('Move task');
                                  } else if (value == 'delete') {}
                                },
                                itemBuilder: (BuildContext context) {
                                  List<PopupMenuItem<String>> items = [
                                    // const PopupMenuItem<String>(
                                    //   value: 'Move task',
                                    //   child: Text(
                                    //     'Move task',
                                    //     style: TextStyle(color: kblack),
                                    //   ),
                                    // ),
                                    PopupMenuItem<String>(
                                      value: 'Spot light Task',
                                      child: const Text(
                                        'Spot light Task',
                                        style: TextStyle(color: kblack),
                                      ),
                                      onTap: () {
                                        taskController.spotLightTask(
                                            spotLightTask: SpotLightTask(
                                                spotLightStatus: true,
                                                taskId: typeTask?.id ??
                                                    tasksInsideFolder?.taskId ??
                                                    tasksInsideInnerFolder
                                                        ?.taskId));
                                      },
                                    ),
                                    if (typeTask?.isPinned == false)
                                      PopupMenuItem<String>(
                                        value: 'Pin the task',
                                        onTap: () {
                                          taskController.pinnedATask(
                                            pinnedATask: PinnedATaskModel(
                                              isPinned: true,
                                              taskId: typeTask?.id ?? '',
                                            ),
                                          );
                                          // taskController.filterByType(
                                          //     filterByType: FilterByTypeModel(
                                          //         taskType: Get.find<
                                          //                 TaskHomeScreenController>()
                                          //             .taskCategory
                                          //             .value));
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
                                      child: Text(
                                        'Add Sub Task',
                                        style: TextStyle(color: kblack),
                                      ),
                                    ),
                                    // const PopupMenuItem<String>(
                                    //   value: 'remove task from folder',
                                    //   child: Text(
                                    //     'Remove task from folder',
                                    //     style: TextStyle(color: kblack),
                                    //   ),
                                    // ),
                                  ];

                                  return items;
                                },
                              ),
                            ],
                          ),
                          Text(
                            typeTask?.description ??
                                tasksInsideFolder?.description ??
                                tasksInsideInnerFolder?.description ??
                                'description',
                            style: const TextStyle(color: kwhite, fontSize: 12),
                          ),
                          adjustHieght(10),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              typeTask?.deadLine ??
                                  tasksInsideFolder?.deadLine ??
                                  tasksInsideInnerFolder?.deadLine ??
                                  'dead',
                              // task['date']!,
                              style: const TextStyle(
                                color: kwhite,
                              ),
                            ),
                          ),
                          adjustHieght(10),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 50,
                bottom: 50,
                left: 0,
                child: Container(
                  color: klightgrey,
                  width: 4,
                  height: 100,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Color getSpotLightColor(String? date1, String? date2) {
    if (date1 == null || date2 == null) return kwhite;
    final int first = DateTimeFormater.calculateDifferenceInHours(date1, date2);
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
  }
}
