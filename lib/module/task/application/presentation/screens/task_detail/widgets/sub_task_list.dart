import 'dart:developer';

import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/application/presentation/screens/create_task/pop_up/sub_task_creation.dart';
import 'package:bizkit/module/task/application/presentation/screens/create_task/widgets/container_textfield_dummy.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/utils/event_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TaskDetailSubtasksSection extends StatelessWidget {
  const TaskDetailSubtasksSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CreateTaskController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Subtasks',
              style: textHeadStyle1,
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => SubTaskCreationCustomDialog(
                    taskId: controller.singleTask.value.id,
                    afterTaskCreation: true,
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 10.w),
                decoration: BoxDecoration(
                    color: neonShade, borderRadius: kBorderRadius5),
                child: Row(
                  children: [
                    const Icon(Icons.add, color: kwhite),
                    adjustWidth(5.w),
                    const Text('Add Sub Task')
                  ],
                ),
              ),
            )
          ],
        ),
        adjustHieght(5.h),
        Obx(
          () => controller.singleTask.value.subTask?.isEmpty ?? true
              ? Center(
                  child: Column(
                    children: [
                      adjustHieght(20.h),
                      Text(
                        'No Subtasks available',
                        style: textThinStyle1,
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  itemCount: controller.singleTask.value.subTask?.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final subTask =
                        controller.singleTask.value.subTask?.first[index];
                    // log('${controller.singleTask.value.subTask?.first[index]}');
                    return SubTaskTileDetailPage(
                      subTaskTitle: subTask?.title,
                      subTaskDes: subTask?.description,
                    );
                  },
                ),
        )
      ],
    );
  }
}

class SubTaskTileDetailPage extends StatelessWidget {
  const SubTaskTileDetailPage({super.key, this.subTaskTitle, this.subTaskDes});

  final String? subTaskTitle;
  final String? subTaskDes;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // showDialog(
        //   context: context,
        //   builder: (context) => Dialog(
        //     backgroundColor: kblack,
        //     child: Container(
        //       padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
        //       child: Column(
        //         mainAxisSize: MainAxisSize.min,
        //         children: [
        //           Text(subTaskTitle ?? 'Subtask Title', style: textHeadStyle1),
        //           adjustHieght(10.h),
        //           const ContainerTextFieldDummy(
        //             text: 'Task Start Date',
        //             suffixIcon: Icons.calendar_month_outlined,
        //           ),
        //           adjustHieght(10.h),
        //           const ContainerTextFieldDummy(
        //             text: 'Total Time Taken',
        //             suffixIcon: Icons.alarm_sharp,
        //           ),
        //           adjustHieght(30.h),
        //           EventButton(
        //             text: 'Complete',
        //             onTap: () {},
        //             wdth: double.infinity,
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),
        // );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.w),
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          color: kGrayLight,
          borderRadius: kBorderRadius10,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset('asset/images/icon/Vector.png', scale: 2),
                      adjustWidth(10.w),
                      Text(
                        subTaskTitle ?? 'Subtask Title',
                        style: textHeadStyle1.copyWith(color: neonShade),
                      ),
                    ],
                  ),
                  adjustHieght(8.h),
                  Text(
                    subTaskDes ?? 'Subtask Description',
                    style: textThinStyle1,
                  ),
                  adjustHieght(5.h),
                ],
              ),
            ),
            adjustWidth(20.w),
            Container(
              height: 27.w,
              width: 27.w,
              decoration: BoxDecoration(
                  border: Border.all(color: neonShade, width: 2.w),
                  borderRadius: kBorderRadius5),
            ),
          ],
        ),
      ),
    );
  }
}
