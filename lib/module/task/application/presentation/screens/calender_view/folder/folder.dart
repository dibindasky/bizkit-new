import 'dart:developer';

import 'package:bizkit/module/task/application/controller/caleder_view/calender_view.dart';
import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/application/presentation/screens/calender_view/folder/create_new_folder.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TaskFolderSection extends StatelessWidget {
  TaskFolderSection(
      {super.key,
      required this.name,
      required this.index,
      required this.folderId});
  final int index;
  final String name;
  final String folderId;
  final controller = Get.find<TaskCalenderViewController>();
  final taskcontroller = Get.find<CreateTaskController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListTile(
        tileColor:
            controller.selectedIndices.contains(index) ? lightColr : knill,
        leading: controller.selectedIndices.contains(index)
            ? Stack(
                children: [
                  SizedBox(
                    width: 60.w,
                    height: 60.h,
                    child: Image.asset(taskFolderImage),
                  ),
                  const Positioned(
                    top: 13,
                    left: 0,
                    right: 0,
                    child: CircleAvatar(
                      backgroundColor: neonShade,
                      radius: 15,
                      child: Icon(
                        Icons.check,
                        color: kblack,
                      ),
                    ),
                  ),
                ],
              )
            : SizedBox(
                width: 60.w,
                height: 60.h,
                child: Image.asset(taskFolderImage),
              ),
        title: Row(
          children: [
            SizedBox(
              width: 100,
              child: Text(name),
            ),
            adjustWidth(50),
            Text(
              '12/4',
              style: TextStyle(
                fontSize: 13.sp,
                color: klightgrey,
              ),
            ),
          ],
        ),
        trailing: PopupMenuButton<String>(
          onSelected: (value) {
            if (value == 'Add New Task to Folder') {
              showTaskSelectionBottomSheet(context, folderId);
            } else if (value == 'Edit folder name') {
              showCreateFolderDialog(context,
                  folderName: name, folderId: folderId);
            }
          },
          color: kwhite,
          icon: const Icon(Icons.more_vert, color: kwhite),
          itemBuilder: (context) {
            return [
              const PopupMenuItem<String>(
                value: 'Collapse Folder',
                child: Text(
                  'Collapse Folder',
                  style: TextStyle(color: kblack),
                ),
              ),
              const PopupMenuItem<String>(
                value: 'Add New Task to Folder',
                child: Text(
                  'Add New Task to Folder',
                  style: TextStyle(color: kblack),
                ),
              ),
              const PopupMenuItem<String>(
                value: 'Edit folder name',
                child: Text(
                  'Edit folder name',
                  style: TextStyle(color: kblack),
                ),
              ),
              const PopupMenuItem<String>(
                value: 'Merge Folders',
                child: Text(
                  'Merge Folders',
                  style: TextStyle(color: kblack),
                ),
              ),
            ];
          },
        ),
      ),
    );
  }
}

void showTaskSelectionBottomSheet(BuildContext context, String folderId) {
  final taskcontroller = Get.find<CreateTaskController>();
  final TextEditingController searchController = TextEditingController();
  // final controller = Get.find<TaskCalenderViewController>();
  showBottomSheet(
    enableDrag: true,
    context: context,
    builder: (context) {
      return Container(
        height: 550.h,
        color: kblack,
        padding: EdgeInsets.all(10.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            adjustHieght(10.h),
            Text(
              'Select Tasks to Add',
              style: TextStyle(fontSize: 18.sp, color: kwhite),
            ),
            adjustHieght(10.h),
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Search Tasks',
                hintStyle: const TextStyle(color: klightgrey),
                prefixIcon: const Icon(Icons.search, color: kwhite),
                filled: true,
                fillColor: knill,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
              style: const TextStyle(color: kwhite),
              onChanged: (value) {
                if (value.isNotEmpty) {
                  taskcontroller.searchTasks(searchItem: value);
                }
              },
            ),
            adjustHieght(10.h),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: taskcontroller.tasksSearch.length,
                  itemBuilder: (context, index) {
                    final task = taskcontroller.tasksSearch[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text(
                          task.task?.title ?? 'Title',
                          style: const TextStyle(color: kwhite),
                        ),
                        trailing: Obx(() => Checkbox(
                              checkColor: kblack,
                              activeColor: neonShade,
                              value:
                                  taskcontroller.selectedTasks.contains(task),
                              onChanged: (bool? value) {
                                if (value == true) {
                                  taskcontroller.selectedTasks.add(task);
                                } else {
                                  taskcontroller.selectedTasks.remove(task);
                                }
                              },
                            )),
                      ),
                    );
                  },
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                log('${taskcontroller.selectedTasks}');
                if (taskcontroller.selectedTasks.isNotEmpty) {
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('No tasks selected'),
                      behavior: SnackBarBehavior.floating,
                      duration: Duration(seconds: 2),
                    ),
                  );
                }
              },
              child: const Text('Add Tasks'),
            ),
          ],
        ),
      );
    },
  );
}
