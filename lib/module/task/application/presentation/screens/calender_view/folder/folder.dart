import 'package:bizkit/module/task/application/controller/caleder_view/calender_view.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TaskFolderSection extends StatelessWidget {
  TaskFolderSection({super.key, required this.name, required this.index});
  final int index;
  final String name;
  final controller = Get.find<TaskCalenderViewController>();

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
