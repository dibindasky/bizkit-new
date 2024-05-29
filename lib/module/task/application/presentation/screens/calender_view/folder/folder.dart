import 'dart:developer';

import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/task/application/controller/caleder_view/calender_view.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskFolderSection extends StatelessWidget {
  TaskFolderSection({super.key, required this.name});

  final String name;
  final controller = Get.find<TaskCalenderViewController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        log('message');
        controller.folderLongPress(!controller.selectedFolderContainer.value);
      },
      onTap: () => Get.toNamed(Routes.heirarchyUserDetail, id: 2),
      child: ListTile(
        leading: SizedBox(
          width: 60,
          height: 60,
          child: Image.asset(taskFolderImage),
        ),
        title: Row(
          children: [
            SizedBox(
              width: 100,
              child: Text(name),
            ),
            adjustWidth(50),
            const Text(
              '12/4',
              style: TextStyle(
                color: klightgrey,
              ),
            ),
          ],
        ),
        trailing: PopupMenuButton<String>(
          onSelected: (value) {},
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
