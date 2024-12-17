import 'package:bizkit/module/module_manager/application/controller/internet_controller.dart';
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
    final internetConnectinController =
        Get.find<InternetConnectionController>();
    return Obx(
      () {
        if (taskController.filterByTypeLoading.value) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
            child: ShimmerLoaderTaskContainer(
              height: 50.h,
              itemCount: 10,
              width: double.infinity,
            ),
          );
        } else if (!internetConnectinController.isConnectedToInternet.value &&
            taskController.killedTasks.isEmpty) {
          return Expanded(
              child: SizedBox(
                  width: 300.w,
                  child: InternetConnectionLostWidget(
                    onTap: () {
                      taskController.fetchAllKilledTasks();
                    },
                  )));
        } else if (taskController.killedTasks.isEmpty) {
          return ErrorRefreshIndicator(
            image: emptyNodata2,
            errorMessage: 'No killed tasks',
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
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
              itemCount: taskController.killedTasks.length,
              itemBuilder: (context, index) {
                final typeTask = taskController.killedTasks[index];

                return GestureDetector(
                  onTap: () {},
                  child: Card(
                    elevation: 1,
                    margin: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  adjustWidth(10),
                                  Text(
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: true,
                                    typeTask.taskTitle ?? '',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall
                                        ?.copyWith(fontSize: 14),
                                  ),
                                  adjustWidth(15),
                                ],
                              ),

                              PopupMenuButton<String>(
                                icon: const Icon(
                                  Icons.more_vert_outlined,
                                ),
                                position: PopupMenuPosition.under,
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
                                              taskId: typeTask.taskId ?? ''),
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
                          Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  typeTask.deadLine ?? '',
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall
                                      ?.copyWith(fontSize: 10),
                                ),
                                Text(
                                    maxLines: 1,
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                    typeTask.isOwned == true
                                        ? 'Created by  ${typeTask.createdBy?.name ?? 'no name'}'
                                        : 'Assigned by ${typeTask.createdBy?.name ?? 'no name'}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall
                                        ?.copyWith(fontSize: 9)),
                              ],
                            ),
                          ),
                          adjustHieght(10),
                        ],
                      ),
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
