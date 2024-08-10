// ignore_for_file: unnecessary_null_comparison

import 'package:bizkit/module/task/application/controller/folder/folder_controller.dart';
import 'package:bizkit/module/task/domain/model/folders/get_task_inside_a_folder_params_model/get_task_inside_a_folder_params_model.dart';
import 'package:bizkit/module/task/domain/model/folders/inner_folder/create_folder_inside_a_folder/create_folder_inside_a_folder.dart';
import 'package:bizkit/module/task/domain/model/folders/inner_folder/edit_inner_folder_model/edit_inner_folder_model.dart';
import 'package:bizkit/module/task/domain/model/folders/inner_folder/filter_inner_folder_modle/filter_inner_folder_modle.dart';
import 'package:flutter/material.dart';

void showInnerFolderDialogWidget(
    {String? initialName,
    String? innerFolderId,
    required TaskFolderController controller,
    String? folderId,
    required BuildContext context}) {
  TextEditingController folderNameController = TextEditingController(
    text: initialName,
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(innerFolderId == null
            ? 'Create Inner Folder'
            : 'Edit Inner Folder'),
        content: TextField(
          controller: folderNameController,
          decoration: const InputDecoration(hintText: "Enter folder name"),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text(innerFolderId == null ? 'Create' : 'Update'),
            onPressed: () {
              String innerFolderName = folderNameController.text;
              if (innerFolderName.isNotEmpty) {
                if (innerFolderId == null) {
                  controller.createNewFolderInsideFolder(
                    context: context,
                    folderId: folderId ?? '',
                    createNewFolderInsideFolder: CreateFolderInsideAFolder(
                      folderId: folderId ?? '',
                      innerFolderName: innerFolderName,
                      innerFolderTasks: [],
                    ),
                  );
                  // log('After inner folder creation ====> ${controller.deadlineDate.value} // $folderId');
                  controller.filterInnerFolderByDeadline(
                      filterInnerFolder: FilterInnerFolderModel(
                    filterDate: controller.deadlineDate.value,
                    folderId: folderId,
                  ));
                } else {
                  controller.editInnerFolderName(
                      context: context,
                      folderId: folderId ?? '',
                      editInnerFolderName: EditInnerFolderModel(
                        folderId: folderId ?? '',
                        innerFolderId: innerFolderId,
                        innerFolderName: innerFolderName,
                      ));
                  controller.filterInnerFolderByDeadline(
                      filterInnerFolder: FilterInnerFolderModel(
                    filterDate: controller.deadlineDate.value,
                    folderId: folderId,
                  ));
                }

                controller.fetchTasksInsideFolder(
                    taskInsideFolder: GetTaskInsideAFolderParamsModel(
                  folderId: folderId,
                ));

                Navigator.of(context).pop();
              }
            },
          ),
        ],
      );
    },
  );
}
