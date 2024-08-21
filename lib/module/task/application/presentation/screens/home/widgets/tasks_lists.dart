import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/task/application/controller/home_controller/home_controller.dart';
import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/domain/model/task/filter_by_type_model/filter_by_type_model.dart';
import 'package:bizkit/module/task/domain/model/task/filter_pinned_task_by_type_model/filter_pinned_task_by_type_model.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TasksListsWidget extends StatelessWidget {
  const TasksListsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final taskController = Get.find<CreateTaskController>();
    final homeController = Get.find<TaskHomeScreenController>();
    return SizedBox(
      height: 280.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          3,
          (index) => Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 5),
            height: 80.h,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: GestureDetector(
                    onTap: () {
                      if (index == 0) {
                        homeController
                            .changeSelectedTaskCategory('Others to self');
                        taskController.filterByType(
                            filterByType:
                                FilterByTypeModel(taskType: 'others_to_self'));
                        taskController.filterPinnedTasksByType(
                            filterPinnedTask: FilterPinnedTaskByTypeModel(
                          taskType: 'others_to_self',
                          isPinned: true,
                        ));
                        Get.toNamed(Routes.taskLists, id: 1);
                      } else if (index == 1) {
                        homeController
                            .changeSelectedTaskCategory('Self to others');
                        taskController.filterByType(
                            filterByType:
                                FilterByTypeModel(taskType: 'self_to_others'));
                        taskController.filterPinnedTasksByType(
                            filterPinnedTask: FilterPinnedTaskByTypeModel(
                          taskType: 'self_to_others',
                          isPinned: true,
                        ));
                        Get.toNamed(Routes.taskLists, id: 1);
                      } else {
                        homeController
                            .changeSelectedTaskCategory('Self to self');
                        taskController.filterByType(
                            filterByType:
                                FilterByTypeModel(taskType: 'self_to_self'));
                        taskController.filterPinnedTasksByType(
                            filterPinnedTask: FilterPinnedTaskByTypeModel(
                          taskType: 'self_to_self',
                          isPinned: true,
                        ));
                        Get.toNamed(Routes.taskLists, id: 1);
                      }
                    },
                    child: Container(
                      height: 110.h,
                      width: 90.w,
                      decoration: BoxDecoration(
                        color: klightGreyClr,
                        border: Border.all(color: neonShade),
                        borderRadius: kBorderRadius10,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 20.h,
                            width: 100.w,
                            child: Image.asset(
                              fit: BoxFit.fitHeight,
                              index == 0
                                  ? taskHomeToMeIconImage
                                  : index == 1
                                      ? taskHomeToOthersIconImage
                                      : taskHomeSelfieIconImage,
                            ),
                          ),
                          adjustHieght(5.h),
                          Text(
                            index == 0
                                ? 'To Me'
                                : index == 1
                                    ? 'To Others'
                                    : 'Selfie',
                            style: textThinStyle1,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: klightDarkGrey,
                    height: 60.h,
                    child: ListView.builder(
                      itemCount: 6,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        if (index == 5) {
                          return const Padding(
                            padding: EdgeInsets.all(7.0),
                            child: Icon(
                              Icons.arrow_circle_right_sharp,
                              size: 25,
                              color: neonShade,
                            ),
                          );
                        }
                        return Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Container(
                            width: 130.w,
                            height: 40.h,
                            decoration: BoxDecoration(
                              borderRadius: kBorderRadius10,
                              color: lightGrey,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Laravel Task',
                                  style: textThinStyle1.copyWith(
                                    color: neonShade,
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  'Feb, 21 - Mar, 12',
                                  style: textThinStyle1.copyWith(fontSize: 10),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
