import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../utils/refresh_indicator/refresh_custom.dart';

class CompletedTasksListView extends StatelessWidget {
  const CompletedTasksListView({super.key});

  @override
  Widget build(BuildContext context) {
    final taskController = Get.find<CreateTaskController>();
    return Obx(
      () {
        if (taskController.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (taskController.completedTasks.isEmpty) {
          return ErrorRefreshIndicator(
            image: emptyNodata2,
            errorMessage: 'No Tasks',
            onRefresh: () {},
          );
        } else {
          return RefreshIndicator(
            onRefresh: () async {},
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              itemCount: taskController.completedTasks.length,
              itemBuilder: (context, index) {
                final typeTask = taskController.completedTasks[index];

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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                );
              },
            ),
          );
        }
      },
    );
  }
}
