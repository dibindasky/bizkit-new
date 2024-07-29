import 'package:bizkit/module/task/application/controller/caleder_view/calender_view.dart';
import 'package:bizkit/module/task/application/controller/folder/folder_controller.dart';
import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/application/presentation/screens/calender_view/folder/create_new_folder.dart';
import 'package:bizkit/module/task/application/presentation/widgets/task_textfrom_fireld.dart';
import 'package:bizkit/module/task/domain/model/folders/delete_folder_model/delete_folder_model.dart';
import 'package:bizkit/module/task/domain/model/folders/inner_folder/task_add_or_delete_inner_folder_model/task_add_or_delete_inner_folder_model.dart';

import 'package:bizkit/module/task/domain/model/folders/task_add_to_folder_model/task_add_to_folder_model.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/utils/event_button.dart';
import 'package:bizkit/utils/refresh_indicator/refresh_custom.dart';
import 'package:bizkit/utils/show_dialogue/confirmation_dialog.dart';
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

  final folderController = Get.find<TaskFolderController>();
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
            // Text(
            //   '12/4',
            //   style: TextStyle(
            //     fontSize: 13.sp,
            //     color: klightgrey,
            //   ),
            // ),
          ],
        ),
        trailing: PopupMenuButton<String>(
          onSelected: (value) {
            if (value == 'Add New Task to Folder') {
              taskcontroller.searchTasks(searchItem: '');
              showTaskSelectionBottomSheet(context, folderId, '', false);
            } else if (value == 'Edit folder name') {
              showCreateFolderDialog(context,
                  folderName: name, folderId: folderId);
            }
          },
          color: kwhite,
          icon: const Icon(Icons.more_vert, color: kwhite),
          itemBuilder: (context) {
            return [
              // const PopupMenuItem<String>(
              //   value: 'Collapse Folder',
              //   child: Text(
              //     'Collapse Folder',
              //     style: TextStyle(color: kblack),
              //   ),
              // ),
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
              PopupMenuItem<String>(
                value: 'Delete Folder',
                child: const Text(
                  'Delete Folder',
                  style: TextStyle(color: kblack),
                ),
                onTap: () {
                  showCustomConfirmationDialogue(
                    description:
                        'Are you sure you want to delete this folder ?',
                    buttonText: 'Delete',
                    context: context,
                    onTap: () {
                      folderController.deleteFolder(
                        deleteFolder: DeleteFolderModel(
                          folderId: folderId,
                        ),
                      );
                    },
                    title: 'Delete Folder',
                    buttonColor: neonShade,
                  );
                },
              ),
              // const PopupMenuItem<String>(
              //   value: 'Merge Folders',
              //   child: Text(
              //     'Merge Folders',
              //     style: TextStyle(color: kblack),
              //   ),
              // ),
            ];
          },
        ),
      ),
    );
  }
}

void showTaskSelectionBottomSheet(
  BuildContext context,
  String folderId,
  String? innerFoldrId,
  bool? isFromInner,
) {
  final taskController = Get.find<CreateTaskController>();
  final TextEditingController searchController = TextEditingController();
  final folderController = Get.find<TaskFolderController>();

  taskController.selectedTasks.clear();

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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TaskTextField(
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    taskController.searchTasks(searchItem: value);
                  } else {
                    taskController.searchTasks(searchItem: value);
                  }
                },
                controller: searchController,
                hintText: 'Search Tasks',
                showBorder: true,
                fillColor: textFieldFillColr,
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search, color: neonShade),
                ),
              ),
            ),
            adjustHieght(10.h),
            Expanded(
              child: Obx(
                () {
                  if (taskController.isLoading.value) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (taskController.tasksSearch.isEmpty) {
                    return ErrorRefreshIndicator(
                      image: emptyNodata2,
                      errorMessage: 'No Tasks',
                      onRefresh: () {},
                    );
                  } else {
                    return ListView.builder(
                      itemCount: taskController.tasksSearch.length,
                      itemBuilder: (context, index) {
                        final task = taskController.tasksSearch[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            surfaceTintColor: neonShade,
                            color: lightColr,
                            child: ListTile(
                              title: Text(
                                task.title ?? 'Title',
                                style: const TextStyle(color: kwhite),
                              ),
                              trailing: Obx(
                                () => Checkbox(
                                  checkColor: kblack,
                                  activeColor: neonShade,
                                  value: taskController.selectedTasks
                                      .contains(task),
                                  onChanged: (bool? value) {
                                    if (value == true) {
                                      taskController.selectedTasks.add(task);
                                    } else {
                                      taskController.selectedTasks.remove(task);
                                    }
                                  },
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
            EventButton(
              wdth: 320.w,
              onTap: () async {
                if (isFromInner == true) {
                  if (taskController.selectedTasks.isNotEmpty) {
                    List<String> selectedTaskIds = taskController.selectedTasks
                        .map((task) => task.id!)
                        .toList();
                    TaskAddOrDeleteInnerFolderModel
                        addOrDeleteInnerFolderModel =
                        TaskAddOrDeleteInnerFolderModel(
                      folderId: folderId,
                      innerFolderId: innerFoldrId,
                      innerFolderTasks: selectedTaskIds,
                    );

                    folderController.taskAddOrDeleteInnerFolder(
                        taskAddOrDelete: addOrDeleteInnerFolderModel);
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
                } else {
                  if (taskController.selectedTasks.isNotEmpty) {
                    List<String> selectedTaskIds = taskController.selectedTasks
                        .map((task) => task.id!)
                        .toList();

                    TaskAddToFolderModel taskAddToFolder = TaskAddToFolderModel(
                      folderId: folderId,
                      tasks: selectedTaskIds,
                    );

                    folderController.tasksAddToFolder(
                        taskAddToFolder: taskAddToFolder);

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
                }
              },
              color: neonShadeLinearGradient,
              text: 'Add Tasks',
            ),
            adjustHieght(10.h),
          ],
        ),
      );
    },
  );
}
