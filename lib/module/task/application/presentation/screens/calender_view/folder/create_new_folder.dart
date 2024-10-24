import 'dart:ui';

import 'package:bizkit/module/task/application/controller/folder/folder_controller.dart';
import 'package:bizkit/module/task/application/presentation/widgets/task_textfrom_fireld.dart';
import 'package:bizkit/module/task/domain/model/folders/edit_folder_model/edit_folder_model.dart';
import 'package:bizkit/module/task/domain/model/folders/folder_model/folder_model.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/widgets/event_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TaskCreateNewFolderDialog extends StatelessWidget {
  final String? folderName;
  final String? folderId;

  const TaskCreateNewFolderDialog({super.key, this.folderName, this.folderId});

  @override
  Widget build(BuildContext context) {
    final TextEditingController folderNameController = TextEditingController();
    if (folderName != null) {
      folderNameController.text = folderName!;
    }
    final folderController = Get.find<TaskFolderController>();
    final style = TextStyle(
      fontSize: 15.sp,
      color: neonShade,
    );

    return Obx(
      () {
        final isLoading = folderController.isLoading.value;

        return Stack(
          children: [
            AlertDialog(
              backgroundColor: kblack,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    folderName != null ? 'Edit Folder' : 'New Folder',
                    style: textThinStyle1.copyWith(fontSize: 15.sp),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Folder Name',
                      style: textThinStyle1.copyWith(color: neonShade),
                    ),
                    adjustHieght(3.h),
                    TaskTextField(
                      // showBorder: true,
                      hintText: 'Folder name',
                      controller: folderNameController,
                    ),
                    adjustHieght(10.h),
                  ],
                ),
              ),
              actions: [
                Center(
                  child: EventButton(
                    color: const LinearGradient(colors: [neonShade, neonShade]),
                    wdth: 160.w,
                    text: folderName != null ? 'Save Changes' : 'Create Folder',
                    onTap: () {
                      if (folderName != null && folderId != null) {
                        folderController.editFolderName(
                            context: context,
                            editFolderName: EditFolderModel(
                                folderName: folderNameController.text,
                                folderId: folderId));
                      } else {
                        folderController.createNewFolder(
                          context: context,
                          folder: FolderModel(
                            folderName: folderNameController.text,
                            tasks: [],
                          ),
                        );
                      }
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
            if (isLoading)
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
          ],
        );
      },
    );
  }
}

void showCreateFolderDialog(BuildContext context,
    {String? folderName, String? folderId}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return TaskCreateNewFolderDialog(
        folderName: folderName,
        folderId: folderId,
      );
    },
  );
}
