import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/application/presentation/screens/create_task/pop_up/sub_task_creation.dart';
import 'package:bizkit/module/task/application/presentation/screens/create_task/pop_up/sub_task_detail_view.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SubTaskBuilder extends StatelessWidget {
  SubTaskBuilder({super.key});

  final List<String> subtasks = [
    'Client meeting',
    'Refrence checking',
    'New party'
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CreateTaskController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Subtasks',
          style: TextStyle(
            fontSize: 15.sp,
            color: neonShade,
          ),
        ),
        Obx(
          () {
            if (controller.subTasks.isEmpty) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 7),
                child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => const SubTaskDetailView(),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: lightGrey, borderRadius: kBorderRadius10),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.h, horizontal: 15.h),
                      child: const Text(
                        'Create new subtask',
                        style: TextStyle(color: kwhite),
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: controller.subTasks.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 7),
                    child: InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => const SubTaskDetailView(),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: lightGrey, borderRadius: kBorderRadius10),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10.h, horizontal: 15.h),
                          child: Text(
                            controller.subTasks[index].title ?? 'SubTask Title',
                            style: const TextStyle(color: kwhite),
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
        adjustHieght(5.h),
        Align(
          alignment: Alignment.bottomRight,
          child: InkWell(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) => const SubTaskCreationCustomDialog());
            },
            child: ClipRRect(
              borderRadius: kBorderRadius5,
              child: ColoredBox(
                color: neonShade,
                child: Padding(
                  padding: EdgeInsets.all(5.0.w),
                  child: const Icon(
                    Icons.add,
                    color: kblack,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
