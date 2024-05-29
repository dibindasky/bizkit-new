import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/task/application/controller/caleder_view/calender_view.dart';
import 'package:bizkit/module/task/application/presentation/widgets/circle_avatar.dart';
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
              // Get.toNamed(Routes.addTask, id: 2);
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
  TaskLongPressAppBarItems({super.key});

  final controller = Get.find<TaskCalenderViewController>();

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
            },
            icon: const Icon(Icons.close, color: neonShade),
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              if (controller.taskTabChangeIndex.value == 0) {
              } else if (controller.taskTabChangeIndex.value == 1) {
              } else if (controller.taskTabChangeIndex.value == 2) {}
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
              if (controller.taskTabChangeIndex.value == 0) {
              } else if (controller.taskTabChangeIndex.value == 1) {
              } else if (controller.taskTabChangeIndex.value == 2) {}
            },
            child: SizedBox(
              height: 25.h,
              width: 25.w,
              child: Image.asset(taskFolderLongPressSelectAllImage),
            ),
          ),
          adjustWidth(10.w),
          IconButton(
            onPressed: () {
              if (controller.taskTabChangeIndex.value == 0) {
              } else if (controller.taskTabChangeIndex.value == 1) {
              } else if (controller.taskTabChangeIndex.value == 2) {}
            },
            icon: const Icon(
              Icons.more_horiz,
              color: neonShade,
            ),
          ),
          adjustWidth(10.w),
        ],
      ),
    );
  }
}
