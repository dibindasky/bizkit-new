import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/task/application/controller/caleder_view/calender_view.dart';
import 'package:bizkit/module/task/application/presentation/screens/calender_view/folder/folder.dart';
import 'package:bizkit/module/task/application/presentation/screens/calender_view/heirarchy/hierarchy_tile.dart';
import 'package:bizkit/module/task/application/presentation/screens/calender_view/widgets/tasks_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HeirarchyTaskFolderDataRow extends StatelessWidget {
  HeirarchyTaskFolderDataRow({super.key});

  final controller = Get.find<TaskCalenderViewController>();

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
          if (controller.isLoading.value) {
            return const Expanded(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (controller.allFolders.isEmpty) {
            return const Expanded(
              child: Center(
                child: Text('No folders available'),
              ),
            );
          } else {
            return Expanded(
              child: ListView.builder(
                itemCount: controller.allFolders.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onLongPress: () {
                      bool isSelected =
                          !controller.selectedIndices.contains(index);
                      controller.longPress(isSelected, index);
                    },
                    onTap: () {
                      if (controller.selectedFolderContainer.value) {
                        bool isSelected =
                            !controller.selectedIndices.contains(index);
                        controller.longPress(isSelected, index);
                      } else {
                        Get.toNamed(Routes.heirarchyUserDetail, id: 2);
                        controller.fetchAllTasksInsideAFolder(
                            folderId:
                                controller.allFolders[index].id.toString());
                      }
                    },
                    child: TaskFolderSection(
                      folderId: controller.allFolders[index].id.toString(),
                      name: controller.allFolders[index].folderName.toString(),
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
