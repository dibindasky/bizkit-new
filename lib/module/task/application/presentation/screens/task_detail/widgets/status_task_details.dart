import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/widgets/circle_status_percentage.dart';
import 'package:bizkit/utils/widgets/event_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class TaskDetailStatusSection extends StatelessWidget {
  const TaskDetailStatusSection({super.key});

  @override
  Widget build(BuildContext context) {
    final taskController = Get.find<CreateTaskController>();
    return Row(
      children: [
        Expanded(
          child: Card(
            elevation: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: SizedBox(
                height: 40.h,
                child: Center(
                  child: Text(
                    'Task status',
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall
                        ?.copyWith(fontSize: 14),
                  ),
                ),
              ),
            ),
          ),
        ),
        kWidth10,
        Expanded(
          child: GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      insetAnimationCurve: Curves.easeIn,
                      child: Padding(
                        padding: const EdgeInsets.all(13),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 15,
                                top: 5,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    (taskController
                                            .singleTask.value.status.isNotEmpty)
                                        ? "Current Status ${taskController.singleTask.value.status}%"
                                        : 'Current Status 0%',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall
                                        ?.copyWith(fontSize: 14),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        GoRouter.of(context).pop();
                                      },
                                      icon: const Icon(Icons.close))
                                ],
                              ),
                            ),
                            kHeight10,
                            Obx(() => SizedBox(
                                  width: double.infinity,
                                  child: CircularSlider(
                                    isOwned: taskController
                                            .singleTask.value.isOwned ??
                                        false,
                                    statusUpdate: true,
                                    initialValue: (double.tryParse(
                                            taskController
                                                .singleTask.value.status) ??
                                        0.0),
                                    onChanged: (value) {
                                      taskController.statusValueChanged(
                                          value: value);
                                    },
                                  ),
                                )),
                            kHeight20,
                            if (taskController.singleTask.value.isOwned == true)
                              Center(
                                child: EventButton(
                                  // width: double.infinity,
                                  borderRadius: 10,
                                  color: const LinearGradient(
                                      colors: [kneon, kneon]),
                                  // showGradiant: false,
                                  text: 'Update',
                                  onTap: () {
                                    taskController.statusChange(
                                        context: context,
                                        taskId: taskController
                                                .singleTask.value.id ??
                                            '');
                                    GoRouter.of(context).pop();
                                  },
                                ),
                              ),
                            kHeight15
                          ],
                        ),
                      ),
                    );
                  });
            },
            child: Card(
              elevation: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SizedBox(
                  height: 40.h,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    // child: CircularSlider(
                    //   statusUpdate: false,
                    //   initialValue: (double.tryParse(
                    //           taskController.singleTask.value.status == '0'
                    //               ? '0'
                    //               : taskController.singleTask.value.status) ??
                    //       0.0),
                    //   onChanged: (value) {},
                    // ),
                    child: CircleAvatar(
                      backgroundColor: kneon,
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: CircleAvatar(
                          backgroundColor: kwhite,
                          child: Obx(() => Text(
                                '${taskController.singleTask.value.status}%',
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(fontSize: 10),
                              )),
                        ),
                      ),
                    ),
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
