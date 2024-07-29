import 'dart:developer';
import 'dart:ui';

import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/task/application/controller/caleder_view/calender_view.dart';
import 'package:bizkit/module/task/application/controller/folder/folder_controller.dart';
import 'package:bizkit/module/task/application/presentation/screens/calender_view/folder/create_new_folder.dart';
import 'package:bizkit/module/task/application/presentation/widgets/circle_avatar.dart';
import 'package:bizkit/module/task/domain/model/folders/inner_folder/merge_inner_folder_model/merge_inner_folder_model.dart';
import 'package:bizkit/module/task/domain/model/folders/merge_folder_model/merge_folder_model.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TaskCalenderViewAppBar extends StatelessWidget {
  const TaskCalenderViewAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TaskCalenderViewController>();
    return Container(
      padding: EdgeInsets.only(left: 10.h),
      width: double.infinity,
      height: 80.h,
      child: Row(
        children: [
          const Icon(Icons.calendar_month, color: neonShade),
          adjustWidth(10.w),
          Text('Calender view', style: TextStyle(fontSize: 17.sp)),
          const Spacer(),
          CustomCircleAvatar(
            backgroundColor: lightGrey,
            onTap: () {
              Get.toNamed(Routes.taskNotification, id: 2);
            },
            backgroundColorInner: neonShade,
          ),
          adjustWidth(8.5.w),
          CustomCircleAvatar(
            backgroundColor: lightGrey,
            onTap: () {
              if (controller.taskTabChangeIndex.value == 2) {
                showCreateFolderDialog(context);
              } else {
                Get.toNamed(Routes.addTask, id: 2, arguments: 2);
              }
            },
            backgroundColorInner: neonShade,
            child: const Icon(
              Icons.add,
              size: 20,
              color: neonShade,
            ),
          ),
          adjustWidth(7.w),
        ],
      ),
    );
  }
}

class TaskLongPressAppBarItems extends StatelessWidget {
  TaskLongPressAppBarItems({super.key, this.folderId, this.mergeInnerFolder});

  final controller = Get.find<TaskCalenderViewController>();
  final folderController = Get.find<TaskFolderController>();

  final String? folderId;

  final bool? mergeInnerFolder;

  void _showMergeFoldersDialog(BuildContext context) {
    TextEditingController folderNameController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        if (folderController.isLoading.value) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return AlertDialog(
            title: const Text('Merge Folders'),
            content: TextField(
              controller: folderNameController,
              decoration:
                  const InputDecoration(hintText: "Enter new folder name"),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Create'),
                onPressed: () {
                  String newFolderName = folderNameController.text;
                  if (newFolderName.isNotEmpty) {
                    folderController.mergeFolders(
                      mergeFolders: MergeFolderModel(
                        folderName: newFolderName,
                        folders: folderController.selectedFolderIds,
                      ),
                    );
                    controller.selectedIndices.clear();
                    Navigator.of(context).pop();
                  }
                },
              ),
            ],
          );
        }
      },
    );
  }

  void _showMergeInnerFoldersDialog(BuildContext context) {
    TextEditingController folderNameController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        if (folderController.isLoading.value) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return AlertDialog(
            title: const Text('Merge Inner Folders'),
            content: TextField(
              controller: folderNameController,
              decoration:
                  const InputDecoration(hintText: "Enter new folder name"),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Create'),
                onPressed: () {
                  String newFolderName = folderNameController.text;
                  if (newFolderName.isNotEmpty) {
                    folderController.mergeInnerFolders(
                        mergeInnerFolders: MergeInnerFolderModel(
                            folderId: folderId,
                            innerFolders:
                                folderController.selectedInnerFolderIds,
                            newInnerFolderName: newFolderName));
                    folderController.selectedIndices.clear();
                    Navigator.of(context).pop();
                  }
                },
              ),
            ],
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 80.h,
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              controller.selectedIndices.clear();
              controller.selectedFolderContainer.value = false;
              folderController.selectedInnerFolderIds.clear();
              folderController.selectedFolderContainer.value = false;
            },
            icon: const Icon(Icons.close, color: neonShade),
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              if (mergeInnerFolder == true) {
                _showMergeInnerFoldersDialog(context);
              } else {
                _showMergeFoldersDialog(context);
              }
              // if (controller.taskTabChangeIndex.value == 2) {
              //   log('clicked');
              //   _showMergeFoldersDialog(context);
              // } else {
              //   log('_showMergeInnerFoldersDialog ===== >clicked');
              //   _showMergeInnerFoldersDialog(context);
              // }
            },
            child: SizedBox(
              height: 20.h,
              width: 20.w,
              child: Image.asset(taskFolderLongPressMergeImage),
            ),
          ),
          adjustWidth(22.w),
          InkWell(
            onTap: () {
              if (controller.taskTabChangeIndex.value == 2) {}
            },
            child: SizedBox(
              height: 25.h,
              width: 25.w,
              child: Image.asset(taskFolderLongPressSelectAllImage),
            ),
          ),
          adjustWidth(10.w),
        ],
      ),
    );
  }
}
