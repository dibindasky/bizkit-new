import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/application/presentation/screens/create_task/pop_up/sub_task_creation.dart';
import 'package:bizkit/module/task/application/presentation/screens/create_task/pop_up/sub_task_detail_view.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
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
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w400,
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
                        builder: (context) => const SubTaskCreationCustomDialog(
                              afterTaskCreation: false,
                            ));
                  },
                  child: Card(
                    elevation: 0,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(borderRadius: kBorderRadius10),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.h, horizontal: 15.h),
                        child: Text(
                          'Create new subtask',
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                        ),
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
                    padding: const EdgeInsets.symmetric(vertical: 3),
                    child: InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => SubTaskDetailView(
                            subTaskDes: controller.subTasks[index].description,
                            subTaskTitle: controller.subTasks[index].title,
                          ),
                        );
                      },
                      child: Card(
                        elevation: 0,
                        child: Container(
                          decoration:
                              BoxDecoration(borderRadius: kBorderRadius10),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 12.h, horizontal: 15.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  controller.subTasks[index].title ??
                                      'SubTask Title',
                                  style:
                                      Theme.of(context).textTheme.displaySmall,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    controller.subTasks.removeAt(index);
                                  },
                                  child: const CircleAvatar(
                                    backgroundColor: kblack,
                                    radius: 12,
                                    child: Icon(
                                      Icons.close,
                                      color: kwhite,
                                      size: 12,
                                    ),
                                  ),
                                )
                              ],
                            ),
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
                  builder: (context) => const SubTaskCreationCustomDialog(
                        afterTaskCreation: false,
                      ));
            },
            child: ClipRRect(
              borderRadius: kBorderRadius5,
              child: ColoredBox(
                color: kneon,
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
