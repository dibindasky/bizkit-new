import 'package:bizkit/module/module_manager/application/controller/internet_controller.dart';
import 'package:bizkit/module/task/application/controller/caleder_view/calender_view.dart';
import 'package:bizkit/module/task/application/controller/folder/folder_controller.dart';
import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/application/presentation/screens/calender_view/folder/create_new_folder.dart';
import 'package:bizkit/module/task/application/presentation/widgets/task_textfrom_fireld.dart';
import 'package:bizkit/module/task/domain/model/folders/delete_folder_model/delete_folder_model.dart';
import 'package:bizkit/module/task/domain/model/folders/inner_folder/task_add_or_delete_inner_folder_model/task_add_or_delete_inner_folder_model.dart';

import 'package:bizkit/module/task/domain/model/folders/task_add_to_folder_model/task_add_to_folder_model.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/snackbar/flutter_toast.dart';
import 'package:bizkit/utils/widgets/event_button.dart';
import 'package:bizkit/utils/refresh_indicator/refresh_custom.dart';
import 'package:bizkit/utils/shimmer/shimmer.dart';
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
  final internetConnectinController = Get.find<InternetConnectionController>();
  final folderController = Get.find<TaskFolderController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListTile(
        tileColor:
            controller.selectedIndices.contains(index) ? klightgrey : knill,
        leading: controller.selectedIndices.contains(index)
            ? Stack(
                children: [
                  SizedBox(
                    width: 50.w,
                    height: 50.h,
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
                width: 50.w,
                height: 50.h,
                child: Image.asset(taskFolderImage),
              ),
        title: Row(
          children: [
            SizedBox(
              width: 100,
              child: Text(
                name,
                style: Theme.of(context)
                    .textTheme
                    .displaySmall
                    ?.copyWith(fontSize: 13),
              ),
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
          position: PopupMenuPosition.under,
          enabled: internetConnectinController.isConnectedToInternet.value,
          onSelected: (value) {
            if (value == 'Add New Task to Folder') {
              taskcontroller.searchTasks();
              showTaskSelectionBottomSheet(context, folderId, '', false);
            } else if (value == 'Edit folder name') {
              showCreateFolderDialog(context,
                  folderName: name, folderId: folderId);
            }
          },
          color: kwhite,
          icon: const Icon(
            Icons.more_vert,
          ),
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
                    buttonColor: kneon,
                    context: context,
                    onTap: () {
                      folderController.deleteFolder(
                        deleteFolder: DeleteFolderModel(
                          folderId: folderId,
                        ),
                      );
                    },
                    title: 'Delete Folder',
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

// ====================================================================================================================================

void showTaskSelectionBottomSheet(
  BuildContext context,
  String folderId,
  String? innerFoldrId,
  bool? isFromInner,
) {
  final taskController = Get.find<CreateTaskController>();
  final folderController = Get.find<TaskFolderController>();
  final internetConnectinController = Get.find<InternetConnectionController>();
  taskController.selectedTasks.clear();

  showModalBottomSheet(
    enableDrag: true,
    context: context,
    constraints: BoxConstraints(maxHeight: khieght * 0.8),
    isScrollControlled: true,
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    builder: (context) {
      return Container(
        height: 550.h,
        padding: EdgeInsets.all(10.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            adjustHieght(10.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Select Tasks to Add',
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall
                        ?.copyWith(fontSize: 14),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop(context);
                      },
                      icon: const Icon(Icons.close))
                ],
              ),
            ),
            adjustHieght(10.h),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TaskTextField(
                onChanged: (value) {
                  taskController.searchTasks();
                },
                controller: taskController.taskSearchController,
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
                  if (taskController.taskSearchLoading.value) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ShimmerLoader(
                        width: 100.w,
                        seprator: const SizedBox(
                          height: 13,
                        ),
                        height: 60.h,
                        itemCount: 8,
                      ),
                    );
                  } else if (!internetConnectinController
                          .isConnectedToInternet.value &&
                      taskController.tasksSearch.isEmpty) {
                    return SizedBox(
                        width: 300.w,
                        height: 90.h,
                        child: InternetConnectionLostWidget(
                          showImage: false,
                          onTap: () {
                            taskController.searchTasks();
                          },
                        ));
                  } else if (taskController.tasksSearch.isEmpty) {
                    return ErrorRefreshIndicator(
                      image: emptyNodata2,
                      errorMessage: 'No Tasks',
                      onRefresh: () {},
                    );
                  } else {
                    return ListView.builder(
                      controller: taskController.taskSearchScrollController,
                      itemCount: taskController.tasksSearch.length +
                          (taskController.taskSearchLoadMoreLoading.value
                              ? 1
                              : 0),
                      itemBuilder: (context, index) {
                        if (index == taskController.tasksSearch.length &&
                            taskController.taskSearchLoadMoreLoading.value) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ShimmerLoader(
                              width: 100.w,
                              seprator: const SizedBox(
                                height: 13,
                              ),
                              height: 60.h,
                              itemCount: 1,
                            ),
                          );
                        } else {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 2),
                            child: Card(
                              elevation: 1,
                              child: ListTile(
                                title: Text(
                                  taskController.tasksSearch[index].title ?? '',
                                  style:
                                      Theme.of(context).textTheme.displaySmall,
                                ),
                                subtitle: Text(
                                  taskController.tasksSearch[index].deadLine ??
                                      '',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall
                                      ?.copyWith(
                                        fontSize: 10,
                                        color: kGreyNormal,
                                      ),
                                ),
                                trailing: Obx(
                                  () => Checkbox(
                                    checkColor: kblack,
                                    activeColor: kneon,
                                    value: taskController.selectedTasks
                                        .contains(
                                            taskController.tasksSearch[index]),
                                    onChanged: (bool? value) {
                                      if (value == true) {
                                        taskController.selectedTasks.add(
                                            taskController.tasksSearch[index]);
                                      } else {
                                        taskController.selectedTasks.remove(
                                            taskController.tasksSearch[index]);
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ),
                          );
                        }
                      },
                    );
                  }
                },
              ),
            ),
            EventButton(
              width: 320.w,
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
                    if (internetConnectinController
                        .isConnectedToInternet.value) {
                      folderController.taskAddOrDeleteInnerFolder(
                          addOrDelete: true,
                          taskAddOrDelete: addOrDeleteInnerFolderModel);
                      Navigator.pop(context);
                    } else {
                      showCustomToast(
                          message:
                              'You must be online to add task to this folder. Please check your internet connection.',
                          backgroundColor: kred);
                      Navigator.pop(context);
                    }
                  } else {
                    showCustomToast(
                        message: 'Please select at least one task to add.',
                        backgroundColor: kred);
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

                    if (internetConnectinController
                        .isConnectedToInternet.value) {
                      folderController.tasksAddToFolder(
                          addOrDelete: true, taskAddToFolder: taskAddToFolder);
                      Navigator.pop(context);
                    } else {
                      showCustomToast(
                          message:
                              'You must be online to add task to this folder. Please check your internet connection.',
                          backgroundColor: kred);
                      Navigator.pop(context);
                    }
                  } else {
                    showCustomToast(
                        message: 'Please select at least one task to add.',
                        backgroundColor: kred);
                  }
                }
              },
              color: neonNewLinearGradient,
              text: 'Add Tasks',
              textColr: kwhite,
            ),
            adjustHieght(10.h),
          ],
        ),
      );
    },
  );
}
