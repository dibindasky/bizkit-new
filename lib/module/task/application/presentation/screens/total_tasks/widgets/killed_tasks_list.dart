import 'package:bizkit/module/task/application/controller/home_controller/home_controller.dart';
import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/domain/model/task/kill_a_task_model/kill_a_task_model.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../../utils/refresh_indicator/refresh_custom.dart';

class KilledTasksListView extends StatelessWidget {
  const KilledTasksListView({super.key});

  @override
  Widget build(BuildContext context) {
    final taskController = Get.find<CreateTaskController>();
    final homeController = Get.find<TaskHomeScreenController>();
    return Obx(
      () {
        if (taskController.filterByTypeLoading.value) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
            child: ShimmerLoaderTaskContainer(
              height: 50.h,
              itemCount: 10,
              width: double.infinity,
            ),
          );
        } else if (taskController.killedTasks.isEmpty) {
          return ErrorRefreshIndicator(
            image: emptyNodata2,
            errorMessage: 'No Tasks',
            onRefresh: () {
              taskController.fetchAllKilledTasks();
            },
          );
        } else {
          return RefreshIndicator(
            onRefresh: () async {
              taskController.fetchAllKilledTasks();
            },
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              itemCount: taskController.killedTasks.length,
              itemBuilder: (context, index) {
                final typeTask = taskController.killedTasks[index];

                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: kBorderRadius15, border: Border.all()),
                    child: Stack(
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              width: 2,
                              color: kwhite,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        adjustWidth(10),
                                        Text(
                                          overflow: TextOverflow.ellipsis,
                                          softWrap: true,
                                          typeTask.taskTitle ?? 'Title',
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
                                      onSelected: (value) {},
                                      itemBuilder: (BuildContext context) {
                                        List<PopupMenuItem<String>> items = [
                                          PopupMenuItem<String>(
                                            value: 'Restore the task',
                                            child: const Text(
                                              'Restore the task',
                                              style: TextStyle(color: kblack),
                                            ),
                                            onTap: () {
                                              taskController.restoreKilledTask(
                                                context: context,
                                                restoreTask: KillATaskModel(
                                                    isKilled: false,
                                                    taskId:
                                                        typeTask.taskId ?? ''),
                                              );
                                              homeController.progresBar();
                                              taskController
                                                  .getTasksCountWithoutDate();
                                            },
                                          )
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
                                  typeTask.isOwned == true
                                      ? 'Created by  ${typeTask.createdBy?.name ?? 'no name'}'
                                      : 'Assigned by ${typeTask.createdBy?.name ?? 'no name'}',
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
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
