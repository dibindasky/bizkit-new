import 'dart:developer';
import 'package:bizkit/module/task/application/controller/caleder_view/calender_view.dart';
import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/domain/model/task/all_tasks_responce/all_tasks_responce.dart';
import 'package:bizkit/module/task/domain/model/task/pinned_task/pinned_a_task_model/pinned_a_task_model.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskContainer extends StatelessWidget {
  TaskContainer({
    super.key,
    required this.index,
    required this.task,
  });

  final int index;

  final Tasks task;
  final controller = Get.find<TaskCalenderViewController>();
  final taskController = Get.find<CreateTaskController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          Card(
            color: !controller.selectedIndices.contains(index)
                ? lightColr
                : kwhite.withOpacity(.2),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 2,
                color: controller.selectedIndices.contains(index)
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
                                  : Image.asset(
                                      'asset/images/icon/Vector.png',
                                      scale: 2,
                                    ),
                              adjustWidth(10),
                              Text(
                                // task['title']!,
                                '${task.title}',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: kwhite,
                                ),
                              ),
                            ],
                          ),
                          PopupMenuButton<String>(
                            color: kwhite,
                            icon: const Icon(Icons.more_horiz, color: kwhite),
                            onSelected: (value) {
                              if (value == 'Move task') {
                                log('Move task');
                              } else if (value == 'delete') {}
                            },
                            itemBuilder: (BuildContext context) {
                              return [
                                const PopupMenuItem<String>(
                                  value: 'Move task',
                                  child: Text(
                                    'Move task',
                                    style: TextStyle(color: kblack),
                                  ),
                                ),
                                const PopupMenuItem<String>(
                                  value: 'Spot light Task',
                                  child: Text(
                                    'Spot light Task',
                                    style: TextStyle(color: kblack),
                                  ),
                                ),
                                PopupMenuItem<String>(
                                  value: 'Pin the ask',
                                  onTap: () {
                                    taskController.pinnedATask(
                                        pinnedATask: PinnedATaskModel(
                                      isPinned: true,
                                      taskId: task.id,
                                    ));
                                  },
                                  child: const Text(
                                    'Pin the task',
                                    style: TextStyle(color: kblack),
                                  ),
                                ),
                                const PopupMenuItem<String>(
                                  value: 'Add Sub Task',
                                  child: Text(
                                    'Add Sub Task',
                                    style: TextStyle(color: kblack),
                                  ),
                                ),
                              ];
                            },
                          ),
                        ],
                      ),
                      Text(
                        // task['description']!,
                        '${task.description}',
                        style: const TextStyle(color: kwhite, fontSize: 12),
                      ),
                      adjustHieght(10),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '${task.deadLine}',
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
    );
  }
}
