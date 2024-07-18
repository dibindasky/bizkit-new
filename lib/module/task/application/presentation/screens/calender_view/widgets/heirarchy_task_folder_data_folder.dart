import 'dart:developer';

import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/task/application/controller/caleder_view/calender_view.dart';
import 'package:bizkit/module/task/application/controller/folder/folder_controller.dart';
import 'package:bizkit/module/task/application/presentation/screens/calender_view/folder/folder.dart';
import 'package:bizkit/module/task/application/presentation/screens/calender_view/heirarchy/hierarchy_tile.dart';
import 'package:bizkit/module/task/application/presentation/screens/calender_view/widgets/tasks_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HeirarchyTaskFolderDataRow extends StatelessWidget {
  HeirarchyTaskFolderDataRow({super.key});

  final controller = Get.find<TaskCalenderViewController>();
  final taskFolderController = Get.find<TaskFolderController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (controller.taskTabChangeIndex.value == 0) {
          return Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 14.0.h),
              itemCount: 10,
              itemBuilder: (context, index) {
                return const HierarchyListtile();
              },
            ),
          );
        }
        if (controller.taskTabChangeIndex.value == 1) {
          return Expanded(child: TaskListView());
        } else {
          if (taskFolderController.isLoading.value) {
            return const Expanded(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (taskFolderController.allFolders.isEmpty) {
            return const Expanded(
              child: Center(
                child: Text('No folders available'),
              ),
            );
          } else {
            return Expanded(
              child: ListView.builder(
                itemCount: taskFolderController.allFolders.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onLongPress: () {
                      bool isSelected =
                          !controller.selectedIndices.contains(index);
                      controller.longPress(isSelected, index);
                      taskFolderController.toggleFolderSelection(
                          taskFolderController.allFolders[index].id.toString());
                    },
                    onTap: () {
                      if (controller.selectedFolderContainer.value) {
                        bool isSelected =
                            !controller.selectedIndices.contains(index);
                        controller.longPress(isSelected, index);

                        taskFolderController.toggleFolderSelection(
                            taskFolderController.allFolders[index].id
                                .toString());
                      } else {
                        Get.toNamed(Routes.heirarchyUserDetail, id: 2);
                        // taskFolderController.fetchAllTasksInsideAFolder(
                        //   folderId: taskFolderController.allFolders[index].id
                        //       .toString(),
                        // );
                        log('Id : => ${taskFolderController.allFolders[index].id}');
                      }
                    },
                    child: TaskFolderSection(
                      folderId:
                          taskFolderController.allFolders[index].id.toString(),
                      name: taskFolderController.allFolders[index].folderName
                          .toString(),
                      index: index,
                    ),
                  );
                },
              ),
            );
          }
        }
      },
    );
  }
}
