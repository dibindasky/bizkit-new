import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/task/application/controller/home_controller/home_controller.dart';
import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/application/presentation/screens/home/widgets/recent_task_container.dart';
import 'package:bizkit/module/task/domain/model/task/filter_by_type_model/filter_by_type_model.dart';
import 'package:bizkit/module/task/domain/model/task/filter_pinned_task_by_type_model/filter_pinned_task_by_type_model.dart';
import 'package:bizkit/module/task/domain/model/task/get_single_task_model/get_single_task_model.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/utils/shimmier/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class TasksListsWidget extends StatelessWidget {
  const TasksListsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final taskController = Get.find<CreateTaskController>();
    final homeController = Get.find<TaskHomeScreenController>();
    return SizedBox(
      height: 270.h,
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
                    child: Obx(
                      () {
                        if (homeController.loadingForRecentTasks.value) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ShimmerLoader(
                              seprator: kWidth10,
                              scrollDirection: Axis.horizontal,
                              itemCount: 5,
                              height: 40.h,
                              width: 130.w,
                            ),
                          );
                        } else if (homeController.toMeTasks.isEmpty ||
                            homeController.toOthersTasks.isEmpty ||
                            homeController.selfieTasks.isEmpty) {
                          return Center(
                            child: Text(
                              'No recent tasks ',
                              style: textThinStyle1.copyWith(fontSize: 12.sp),
                            ),
                          );
                        } else {
                          return ListView.builder(
                            itemCount: index == 0
                                ? homeController.toMeTasks.length + 1
                                : index == 1
                                    ? homeController.toOthersTasks.length + 1
                                    : homeController.selfieTasks.length + 1,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, inx) {
                              if (inx ==
                                  (index == 0
                                      ? homeController.toMeTasks.length
                                      : index == 1
                                          ? homeController.toOthersTasks.length
                                          : homeController
                                              .selfieTasks.length)) {
                                return GestureDetector(
                                  onTap: () {
                                    if (index == 0) {
                                      homeController.changeSelectedTaskCategory(
                                          'Others to self');
                                      taskController.filterByType(
                                          filterByType: FilterByTypeModel(
                                              taskType: 'others_to_self'));
                                      taskController.filterPinnedTasksByType(
                                          filterPinnedTask:
                                              FilterPinnedTaskByTypeModel(
                                        taskType: 'others_to_self',
                                        isPinned: true,
                                      ));
                                      Get.toNamed(Routes.taskLists, id: 1);
                                    } else if (index == 1) {
                                      homeController.changeSelectedTaskCategory(
                                          'Self to others');
                                      taskController.filterByType(
                                          filterByType: FilterByTypeModel(
                                              taskType: 'self_to_others'));
                                      taskController.filterPinnedTasksByType(
                                          filterPinnedTask:
                                              FilterPinnedTaskByTypeModel(
                                        taskType: 'self_to_others',
                                        isPinned: true,
                                      ));
                                      Get.toNamed(Routes.taskLists, id: 1);
                                    } else {
                                      homeController.changeSelectedTaskCategory(
                                          'Self to self');
                                      taskController.filterByType(
                                          filterByType: FilterByTypeModel(
                                              taskType: 'self_to_self'));
                                      taskController.filterPinnedTasksByType(
                                          filterPinnedTask:
                                              FilterPinnedTaskByTypeModel(
                                        taskType: 'self_to_self',
                                        isPinned: true,
                                      ));
                                      Get.toNamed(Routes.taskLists, id: 1);
                                    }
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.all(7.0),
                                    child: Icon(
                                      Icons.arrow_circle_right_sharp,
                                      size: 25,
                                      color: neonShade,
                                    ),
                                  ),
                                );
                              }

                              return GestureDetector(
                                onTap: () {
                                  taskController.fetchSingleTask(
                                    singleTaskModel: GetSingleTaskModel(
                                        taskId: index == 0
                                            ? homeController
                                                .toMeTasks[inx].taskId
                                            : index == 1
                                                ? homeController
                                                    .toOthersTasks[inx].taskId
                                                : homeController
                                                    .selfieTasks[inx].taskId),
                                  );
                                  GoRouter.of(context).pushNamed(
                                    Routes.taskDeail,
                                    pathParameters: {
                                      "taskId":
                                          '${index == 0 ? homeController.toMeTasks[inx].taskId : index == 1 ? homeController.toOthersTasks[inx].taskId : homeController.selfieTasks[inx].taskId}'
                                    },
                                  );
                                },
                                child: RecentTaskContainer(
                                  taskTitle:
                                      '${index == 0 ? homeController.toMeTasks[inx].taskTitle : index == 1 ? homeController.toOthersTasks[inx].taskTitle : homeController.selfieTasks[inx].taskTitle ?? 'task title'}',
                                  taskDeadline:
                                      '${index == 0 ? homeController.toMeTasks[inx].deadLine : index == 1 ? homeController.toOthersTasks[inx].deadLine : homeController.selfieTasks[inx].deadLine ?? 'task deadline'}',
                                ),
                              );
                            },
                          );
                        }
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
