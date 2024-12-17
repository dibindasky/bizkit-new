import 'dart:developer';

import 'package:animate_do/animate_do.dart';
import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/module_manager/application/controller/access/access_controller.dart';
import 'package:bizkit/module/module_manager/application/controller/internet_controller.dart';
import 'package:bizkit/module/task/application/controller/caleder_view/calender_view.dart';
import 'package:bizkit/module/task/application/controller/folder/folder_controller.dart';
import 'package:bizkit/module/task/application/controller/hierarchy/hierarchy_controller.dart';
import 'package:bizkit/module/task/application/presentation/screens/calender_view/folder/folder.dart';
import 'package:bizkit/module/task/application/presentation/screens/calender_view/heirarchy/hierarchy_tile.dart';
import 'package:bizkit/module/task/application/presentation/screens/calender_view/widgets/tasks_list_view.dart';
import 'package:bizkit/module/task/domain/model/dashboard/progres_bar_success_responce/counts.dart';
import 'package:bizkit/module/task/domain/model/folders/filter_folder_by_deadline_model/filter_folder_by_deadline_model.dart';
import 'package:bizkit/module/task/domain/model/folders/get_task_inside_a_folder_params_model/get_task_inside_a_folder_params_model.dart';
import 'package:bizkit/module/task/domain/model/folders/inner_folder/filter_inner_folder_modle/filter_inner_folder_modle.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/refresh_indicator/refresh_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class HeirarchyTaskFolderDataRow extends StatelessWidget {
  HeirarchyTaskFolderDataRow({super.key});

  final controller = Get.find<TaskCalenderViewController>();
  final taskFolderController = Get.find<TaskFolderController>();
  final hierarchyController = Get.find<HierarchyController>();
  final internetConnectinController = Get.find<InternetConnectionController>();
  final accessController = Get.find<AccessController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        // heirarchy list
        if (controller.taskTabChangeIndex.value == 0) {
          if (hierarchyController.empolyeesListLoading.value) {
            return const Expanded(
              child: Center(
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                ),
              ),
            );
          } else if (!internetConnectinController.isConnectedToInternet.value &&
              hierarchyController.employees.isEmpty) {
            return Expanded(
                child: SizedBox(
                    width: 300.w,
                    child: InternetConnectionLostWidget(
                      onTap: () {
                        if (accessController.userRole.value == 'employee') {
                          hierarchyController.fetchEmployeesList();
                        }
                      },
                    )));
          } else if (hierarchyController.heirarchyErrorMsg.isNotEmpty) {
            return Expanded(
              child: ErrorRefreshIndicator(
                onRefresh: () {
                  hierarchyController.fetchEmployeesList();
                },
                showTryAgain: false,
                image: emptyNodata2,
                errorMessage: hierarchyController.heirarchyErrorMsg.value,
              ),
            );
          } else if (hierarchyController.employees.isEmpty) {
            return Expanded(
              child: ErrorRefreshIndicator(
                onRefresh: () {
                  hierarchyController.fetchEmployeesList();
                },
                image: emptyNodata2,
                errorMessage: 'No users found',
              ),
            );
          } else {
            return Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  if (accessController.userRole.value == 'employee') {
                    hierarchyController.fetchEmployeesList();
                  }
                },
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 14.0.h),
                  itemCount: hierarchyController.employees.length,
                  itemBuilder: (context, index) {
                    return Obx(() => HierarchyListtile(
                          tasksCounts:
                              hierarchyController.tasksCountsLoading.value
                                  ? Counts()
                                  : hierarchyController.tasksCounts[
                                          hierarchyController
                                                  .employees[index].userId ??
                                              ''] ??
                                      Counts(),
                          employee: hierarchyController.employees[index],
                        ));
                  },
                ),
              ),
            );
          }
        }
        // tasks list sorting
        if (controller.taskTabChangeIndex.value == 1) {
          return const Expanded(child: TaskListView());
        }
        // folder list
        else {
          if (taskFolderController.getFoldersLoading.value) {
            return const Expanded(
              child: Center(
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                ),
              ),
            );
          } else if (!internetConnectinController.isConnectedToInternet.value &&
              taskFolderController.filteredFoldersByDeadline.isEmpty) {
            return Expanded(
                child: SizedBox(
                    width: 300.w,
                    child: InternetConnectionLostWidget(
                      onTap: () {
                        taskFolderController.filterFoldersByDeadline(
                            filterFolder: FilterFolderByDeadlineModel(
                          filterDate: taskFolderController.deadlineDate.value,
                        ));
                      },
                    )));
          } else if (taskFolderController.filteredFoldersByDeadline.isEmpty) {
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ErrorRefreshIndicator(
                  shrinkWrap: true,
                  image: emptyNodata2,
                  errorMessage: 'No folders available yet!',
                  onRefresh: () {
                    taskFolderController.filterFoldersByDeadline(
                        filterFolder: FilterFolderByDeadlineModel(
                      filterDate: taskFolderController.deadlineDate.value,
                    ));
                  },
                ),
              ),
            );
          } else {
            return Expanded(
              child: ListView.builder(
                itemCount:
                    taskFolderController.filteredFoldersByDeadline.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onLongPress: () {
                      controller.longPress(index);
                      taskFolderController.toggleFolderSelection(
                        taskFolderController
                                .filteredFoldersByDeadline[index].folderId ??
                            '',
                      );
                    },
                    onTap: () {
                      if (controller.selectedFolderContainer.value) {
                        controller.longPress(index);
                        taskFolderController.toggleFolderSelection(
                          taskFolderController
                                  .filteredFoldersByDeadline[index].folderId ??
                              '',
                        );
                      } else {
                        log('Folder ID ----===> ${taskFolderController.filteredFoldersByDeadline[index].folderId ?? ''}');

                        GoRouter.of(context)
                            .pushNamed(Routes.heirarchyUserDetail, extra: {
                          "folderId": taskFolderController
                                  .filteredFoldersByDeadline[index].folderId ??
                              '',
                          "folderName": taskFolderController
                                  .filteredFoldersByDeadline[index]
                                  .folderName ??
                              ''
                        });

                        taskFolderController.fetchTasksInsideFolder(
                            taskInsideFolder: GetTaskInsideAFolderParamsModel(
                          folderId: taskFolderController
                                  .filteredFoldersByDeadline[index].folderId ??
                              '',
                        ));

                        taskFolderController.filterInnerFolderByDeadline(
                            filterInnerFolder: FilterInnerFolderModel(
                                folderId: taskFolderController
                                        .filteredFoldersByDeadline[index]
                                        .folderId ??
                                    '',
                                filterDate:
                                    taskFolderController.deadlineDate.value));
                      }
                    },
                    child: FadeIn(
                      animate: true,
                      child: TaskFolderSection(
                        folderId: taskFolderController
                                .filteredFoldersByDeadline[index].folderId ??
                            '',
                        name: taskFolderController
                                .filteredFoldersByDeadline[index].folderName ??
                            '',
                        index: index,
                      ),
                    ),
                  );
                },
              ),
            );
          }
        }
      },
    );
  }
}
