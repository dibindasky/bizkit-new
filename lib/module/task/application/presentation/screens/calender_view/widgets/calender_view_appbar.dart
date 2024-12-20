import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/module_manager/application/controller/internet_controller.dart';
import 'package:bizkit/module/task/application/controller/caleder_view/calender_view.dart';
import 'package:bizkit/module/task/application/controller/folder/folder_controller.dart';
import 'package:bizkit/module/task/application/presentation/screens/calender_view/folder/create_new_folder.dart';
import 'package:bizkit/module/task/domain/model/folders/inner_folder/merge_inner_folder_model/merge_inner_folder_model.dart';
import 'package:bizkit/module/task/domain/model/folders/merge_folder_model/merge_folder_model.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/snackbar/flutter_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class TaskCalenderViewAppBar extends StatelessWidget {
  const TaskCalenderViewAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TaskCalenderViewController>();
    final internetConnectinController =
        Get.find<InternetConnectionController>();
    return Container(
      padding: EdgeInsets.only(left: 10.h),
      width: double.infinity,
      height: 80.h,
      child: Row(
        children: [
          const Icon(Icons.calendar_month, color: kneon),
          adjustWidth(10.w),
          Text('Calender view',
              style: Theme.of(context)
                  .textTheme
                  .displaySmall
                  ?.copyWith(fontSize: 16)),
          const Spacer(),
          adjustWidth(8.5.w),
          GestureDetector(
            onTap: () {
              if (controller.taskTabChangeIndex.value == 2) {
                if (internetConnectinController.isConnectedToInternet.value) {
                  showCreateFolderDialog(context);
                } else {
                  showCustomToast(
                      message:
                          'You must be online to create a new folder. Please check your internet connection.',
                      backgroundColor: kred);
                }
              } else {
                if (internetConnectinController.isConnectedToInternet.value) {
                  GoRouter.of(context).pushNamed(Routes.addTask);
                } else {
                  showCustomToast(
                      message:
                          'You must be online to create a new task. Please check your internet connection.',
                      backgroundColor: kred);
                }
              }
            },
            child: Obx(
              () => Visibility(
                visible: (controller.taskTabChangeIndex.value == 1 ||
                        controller.taskTabChangeIndex.value == 2
                    ? true
                    : false),
                child: FadeIn(
                  animate: true,
                  child: Container(
                    width: 50.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: lightGrey.withOpacity(0.6),
                          spreadRadius: 0,
                          blurRadius: 1,
                          offset: const Offset(-1, 2),
                        ),
                      ],
                      border: Border.all(color: klightgrey),
                      color: Theme.of(context).colorScheme.onTertiary,
                    ),
                    child: const Icon(
                      Iconsax.add_square,
                      size: 23,
                    ),
                  ),
                ),
              ),
            ),
          ),
          adjustWidth(14.w),
        ],
      ),
    );
  }
}

class TaskLongPressAppBarItems extends StatelessWidget {
  TaskLongPressAppBarItems(
      {super.key, this.folderId, this.mergeInnerFolder = false});

  final controller = Get.find<TaskCalenderViewController>();
  final folderController = Get.find<TaskFolderController>();
  // final taskController = Get.find<CreateTaskController>();

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
            title: Text(
              'Merge Folders',
              style: Theme.of(context)
                  .textTheme
                  .displaySmall
                  ?.copyWith(fontSize: 14),
            ),
            content: TextField(
              style: Theme.of(context).textTheme.displaySmall,
              controller: folderNameController,
              decoration: InputDecoration(
                hintText: "Enter new folder name",
                hintStyle: Theme.of(context).textTheme.displaySmall,
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text(
                  'Cancel',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text(
                  'Create',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
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
                    controller.selectedFolderContainer.value = false;
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
            title: Text(
              'Merge Inner Folders',
              style: Theme.of(context)
                  .textTheme
                  .displaySmall
                  ?.copyWith(fontSize: 14),
            ),
            content: TextField(
              style: Theme.of(context).textTheme.displaySmall,
              controller: folderNameController,
              decoration: InputDecoration(
                  hintText: "Enter new folder name",
                  hintStyle: Theme.of(context).textTheme.displaySmall),
            ),
            actions: <Widget>[
              TextButton(
                child: Text(
                  'Cancel',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text(
                  'Create',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                onPressed: () {
                  String newFolderName = folderNameController.text;
                  if (newFolderName.isNotEmpty) {
                    folderController.mergeInnerFolders(
                      folderId: folderId ?? '',
                      mergeInnerFolders: MergeInnerFolderModel(
                        folderId: folderId,
                        innerFolders: folderController.selectedInnerFolderIds,
                        newInnerFolderName: newFolderName,
                      ),
                    );

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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                if (mergeInnerFolder == true) {
                  folderController.selectedIndices.clear();
                  folderController.selectedInnerFolderIds.clear();
                  folderController.selectedFolderContainer.value = false;
                } else {
                  controller.selectedIndices.clear();
                  folderController.selectedFolderIds.clear();
                  controller.selectedFolderContainer.value = false;
                }
              },
              child: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.onPrimary,
                child: Icon(
                  Icons.close,
                  size: 18.sp,
                  color: Theme.of(context).colorScheme.onTertiary,
                ),
              ),
            ),
            const Spacer(),
            Obx(() => ((mergeInnerFolder == false &&
                        controller.selectedIndices.length > 1) ||
                    (mergeInnerFolder == true &&
                        folderController.selectedInnerFolderIds.length > 1))
                ? GestureDetector(
                    onTap: () {
                      if (mergeInnerFolder == true) {
                        _showMergeInnerFoldersDialog(context);
                      } else {
                        _showMergeFoldersDialog(context);
                      }
                    },
                    child: Container(
                      width: 45.w,
                      height: 45.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: klightgrey),
                        color: Theme.of(context).colorScheme.onTertiary,
                      ),
                      child: const Icon(Iconsax.export_3),
                    ),
                  )
                : kempty),
            // adjustWidth(22.w),
            // InkWell(
            //   onTap: () {
            //     if (controller.taskTabChangeIndex.value == 2) {}
            //   },
            //   child: SizedBox(
            //     height: 25.h,
            //     width: 25.w,
            //     child: Image.asset(taskFolderLongPressSelectAllImage),
            //   ),
            // ),
            adjustWidth(10.w),
          ],
        ),
      ),
    );
  }
}
