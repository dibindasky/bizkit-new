import 'dart:developer';
import 'package:bizkit/module/task/application/controller/caleder_view/calender_view.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskContainer extends StatelessWidget {
  TaskContainer({
    super.key,
    required this.task,
    required this.index,
  });

  final int index;

  final Map<String, String> task;
  final controller = Get.find<TaskCalenderViewController>();

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
                    : Color(int.parse(task['color']!)),
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
                                        color: kblack,
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
                                task['title']!,
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
                        task['description']!,
                        style: const TextStyle(color: kwhite, fontSize: 12),
                      ),
                      adjustHieght(10),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          task['date']!,
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
