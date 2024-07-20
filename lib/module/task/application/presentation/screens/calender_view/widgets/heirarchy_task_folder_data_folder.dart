import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/task/application/controller/caleder_view/calender_view.dart';
import 'package:bizkit/module/task/application/controller/folder/folder_controller.dart';
import 'package:bizkit/module/task/application/presentation/screens/calender_view/folder/folder.dart';
import 'package:bizkit/module/task/application/presentation/screens/calender_view/heirarchy/hierarchy_tile.dart';
import 'package:bizkit/module/task/application/presentation/screens/calender_view/widgets/tasks_list_view.dart';
import 'package:bizkit/module/task/domain/model/folders/get_task_inside_a_folder_params_model/get_task_inside_a_folder_params_model.dart';
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
          } else if (taskFolderController.filteredFoldersByDeadline.isEmpty) {
            return const Expanded(
              child: Center(
                child: Text('No folders available'),
              ),
            );
          } else {
            return Expanded(
              child: ListView.builder(
                itemCount:
                    taskFolderController.filteredFoldersByDeadline.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onLongPress: () {
                      controller.longPress(index);
                      taskFolderController.toggleFolderSelection(
                        taskFolderController
                                .filteredFoldersByDeadline[index].folderId ??
                            '',
                      );
                    },
                    onTap: () {
                      if (controller.selectedFolderContainer.value) {
                        controller.longPress(index);
                        taskFolderController.toggleFolderSelection(
                          taskFolderController
                                  .filteredFoldersByDeadline[index].folderId ??
                              '',
                        );
                      } else {
                        Get.toNamed(Routes.heirarchyUserDetail,
                            id: 2,
                            arguments: taskFolderController
                                    .filteredFoldersByDeadline[index]
                                    .folderId ??
                                '');

                        taskFolderController.fetchTasksInsideFolder(
                            taskInsideFolder: GetTaskInsideAFolderParamsModel(
                          folderId:
                              taskFolderController.allFolders[index].id ?? '',
                        ));
                      }
                    },
                    child: TaskFolderSection(
                      folderId: taskFolderController
                              .filteredFoldersByDeadline[index].folderId ??
                          '',
                      name: taskFolderController
                              .filteredFoldersByDeadline[index].folderName ??
                          '',
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
