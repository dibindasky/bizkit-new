import 'dart:developer';

import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/module_manager/application/controller/internet_controller.dart';
import 'package:bizkit/module/task/application/controller/folder/folder_controller.dart';
import 'package:bizkit/module/task/application/controller/hierarchy/hierarchy_controller.dart';
import 'package:bizkit/module/task/application/controller/home_controller/home_controller.dart';
import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/application/presentation/screens/calender_view/folder/folder.dart';
import 'package:bizkit/module/task/application/presentation/screens/calender_view/widgets/calender_view_appbar.dart';
import 'package:bizkit/module/task/application/presentation/widgets/circle_avatar.dart';
import 'package:bizkit/module/task/application/presentation/widgets/task_container.dart';
import 'package:bizkit/module/task/application/presentation/widgets/task_textfrom_fireld.dart';
import 'package:bizkit/module/task/domain/model/dashboard/progres_bar_success_responce/counts.dart';
import 'package:bizkit/module/task/domain/model/folders/get_task_inside_a_folder_params_model/get_task_inside_a_folder_params_model.dart';
import 'package:bizkit/module/task/domain/model/folders/inner_folder/create_folder_inside_a_folder/create_folder_inside_a_folder.dart';
import 'package:bizkit/module/task/domain/model/folders/inner_folder/delete_inner_folder_model/delete_inner_folder_model.dart';
import 'package:bizkit/module/task/domain/model/folders/inner_folder/edit_inner_folder_model/edit_inner_folder_model.dart';
import 'package:bizkit/module/task/domain/model/folders/inner_folder/filter_inner_folder_modle/filter_inner_folder_modle.dart';
import 'package:bizkit/module/task/domain/model/folders/inner_folder/inner_folder_tasks_get_params_model/inner_folder_tasks_get_params_model.dart';
import 'package:bizkit/module/task/domain/model/hierarchy/employees_list_responce/employee.dart';
import 'package:bizkit/module/task/domain/model/task/get_single_task_model/get_single_task_model.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/images/network_image_with_loader.dart';
import 'package:bizkit/utils/intl/intl_date_formater.dart';
import 'package:bizkit/utils/refresh_indicator/refresh_custom.dart';
import 'package:bizkit/utils/show_dialogue/confirmation_dialog.dart';
import 'package:bizkit/utils/snackbar/snackbar.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

class HierarchyListtile extends StatelessWidget {
  final Employee employee;
  final Counts tasksCounts;
  const HierarchyListtile({
    super.key,
    required this.employee,
    required this.tasksCounts,
  });

  int _calculateTotalTasks() {
    // Safely calculate total tasks, handling potential null values
    int selfToOthersCount = tasksCounts.selfToOthers?.all ?? 0;
    int selfToSelfCount = tasksCounts.selfToSelf?.all ?? 0;
    int othersToSelfCount = tasksCounts.othersToSelf?.all ?? 0;

    return selfToOthersCount + selfToSelfCount + othersToSelfCount;
  }

  @override
  Widget build(BuildContext context) {
    final hierarchyController = Get.find<HierarchyController>();
    final homeController = Get.find<TaskHomeScreenController>();
    final totalTasks = _calculateTotalTasks();
    return GestureDetector(
      onTap: () {
        hierarchyController.filterTasksByType(
            targetUserId: employee.userId ?? '');
        homeController.changeSelectedTaskCategory('All');
        hierarchyController.changeFilterTaskType('all');
        hierarchyController.filterTasksByType(
            targetUserId: employee.userId ?? '');
        GoRouter.of(context).pushNamed(Routes.taskLists, extra: {
          'fromHeirarachy': true,
          'targetUserId': employee.userId ?? ''
        });
      },
      child: Card(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: kblack,
              child: employee.profilePicture != null
                  ? NetworkImageWithLoader(
                      employee.profilePicture ?? '',
                      radius: 50,
                    )
                  : const Icon(Icons.person, color: kneon),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  employee.name ?? 'employee name',
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall
                      ?.copyWith(fontSize: 13),
                ),
                adjustWidth(55),
                Text(
                  '$totalTasks',
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium
                      ?.copyWith(color: kOrange, fontSize: 12),
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ScreenHeirarchyTaskUserDetails extends StatelessWidget {
  const ScreenHeirarchyTaskUserDetails(
      {super.key, this.folderId, this.folderName});

  final String? folderId;
  final String? folderName;
  @override
  Widget build(BuildContext context) {
    // log('Main Folder Id :$folderId');
    final controller = Get.find<TaskFolderController>();
    final taskController = Get.find<CreateTaskController>();
    final internetConnectinController =
        Get.find<InternetConnectionController>();
    void showInnerFolderDialog({String? initialName, String? innerFolderId}) {
      TextEditingController folderNameController = TextEditingController(
        text: initialName ?? '',
      );
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              innerFolderId == null
                  ? 'Create Inner Folder'
                  : 'Edit Inner Folder',
              style: textThinStyle1.copyWith(fontSize: 15.sp),
            ),
            content: TaskTextField(
              hintText: 'Folder name',
              controller: folderNameController,
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text(innerFolderId == null ? 'Create' : 'Update'),
                onPressed: () {
                  String innerFolderName = folderNameController.text;
                  if (innerFolderName.isNotEmpty) {
                    if (innerFolderId == null) {
                      controller.createNewFolderInsideFolder(
                        folderId: folderId ?? '',
                        createNewFolderInsideFolder: CreateFolderInsideAFolder(
                          folderId: folderId ?? '',
                          innerFolderName: innerFolderName,
                          innerFolderTasks: [],
                        ),
                      );

                      // log('After inner folder creation ====> ${controller.deadlineDate.value} // $folderId');
                      // controller.filterInnerFolderByDeadline(
                      //     filterInnerFolder: FilterInnerFolderModel(
                      //         folderId: folderId ?? '',
                      //         filterDate: controller.deadlineDate.value));
                    } else {
                      controller.editInnerFolderName(
                          folderId: folderId ?? '',
                          editInnerFolderName: EditInnerFolderModel(
                            folderId: folderId ?? '',
                            innerFolderId: innerFolderId,
                            innerFolderName: innerFolderName,
                          ));
                      // controller.filterInnerFolderByDeadline(
                      //     filterInnerFolder: FilterInnerFolderModel(
                      //         folderId: folderId ?? '',
                      //         filterDate: controller.deadlineDate.value));
                    }

                    controller.fetchTasksInsideFolder(
                        taskInsideFolder: GetTaskInsideAFolderParamsModel(
                      folderId: folderId ?? '',
                    ));

                    Navigator.of(context).pop();
                  }
                },
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Obx(
          () {
            return Column(
              children: [
                adjustHieght(10),
                controller.selectedFolderContainer.value
                    ? Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: TaskLongPressAppBarItems(
                          folderId: folderId ?? '',
                          mergeInnerFolder: true,
                        ),
                      )
                    : Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                GoRouter.of(context).pop(context);
                              },
                              child: CircleAvatar(
                                backgroundColor:
                                    Theme.of(context).colorScheme.onPrimary,
                                child: Icon(
                                  Icons.arrow_back_ios_new,
                                  size: 18.sp,
                                  color:
                                      Theme.of(context).colorScheme.onTertiary,
                                ),
                              ),
                            ),
                            adjustWidth(20.w),
                            Text(
                              folderName ?? '',
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                            const Spacer(),
                            // CustomCircleAvatar(
                            //   backgroundColor: kblack,
                            //   onTap: () {
                            //     if (internetConnectinController
                            //         .isConnectedToInternet.value) {
                            //       showInnerFolderDialog();
                            //     } else {
                            //       showSnackbar(
                            //         context,
                            //         message:
                            //             'You must be online to create a new inner folder. Please check your internet connection.',
                            //         backgroundColor: kred,
                            //         textColor: kwhite,
                            //       );
                            //     }
                            //   },
                            //   backgroundColorInner: kneon,
                            //   child: const Icon(
                            //     Icons.add,
                            //     size: 20,
                            //     color: kneon,
                            //   ),
                            // ),
                            GestureDetector(
                              onTap: () {
                                if (internetConnectinController
                                    .isConnectedToInternet.value) {
                                  showInnerFolderDialog();
                                } else {
                                  showSnackbar(
                                    context,
                                    message:
                                        'You must be online to create a new inner folder. Please check your internet connection.',
                                    backgroundColor: kred,
                                    textColor: kwhite,
                                  );
                                }
                              },
                              child: Container(
                                width: 50.w,
                                height: 50.h,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: lightGrey.withOpacity(0.6),
                                      spreadRadius: 0,
                                      blurRadius: 1,
                                      offset: const Offset(-1, 2),
                                    ),
                                  ],
                                  border: Border.all(color: klightgrey),
                                  color:
                                      Theme.of(context).colorScheme.onTertiary,
                                ),
                                child: const Icon(
                                  Iconsax.add_square,
                                  size: 23,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                adjustHieght(10),
                Obx(
                  () => controller.selectedFolderContainer.value
                      ? kempty
                      : EasyInfiniteDateTimeLine(
                          timeLineProps: const EasyTimeLineProps(
                            vPadding: 20,
                            hPadding: 5,
                          ),
                          firstDate: DateTime.now(),
                          lastDate:
                              DateTime.now().add(const Duration(days: 31)),
                          focusDate: controller.selectedDate.value,
                          showTimelineHeader: false,
                          itemBuilder: (context, date, isSelected, onTap) {
                            int taskCount = taskController
                                    .tasksCounts[
                                        DateFormat('yyyy-MM-dd').format(date)]
                                    ?.value ??
                                0;
                            return GestureDetector(
                              onTap: () {
                                onTap();
                                controller.selctDate(date);
                                controller.deadlineDate.value =
                                    DateTimeFormater.dateTimeFormat(date);
                                // log('Folder ID - folderFilterByDeadline ====> $folderId');
                                controller.filterInnerFolderByDeadline(
                                    filterInnerFolder: FilterInnerFolderModel(
                                        folderId: folderId ?? '',
                                        filterDate:
                                            controller.deadlineDate.value));
                              },
                              child: Card(
                                elevation: 1,
                                margin: const EdgeInsets.all(1),
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  decoration: BoxDecoration(
                                    borderRadius: kBorderRadius5,
                                    color: isSelected
                                        ? Theme.of(context).colorScheme.primary
                                        : Theme.of(context)
                                            .colorScheme
                                            .onTertiary,
                                  ),
                                  padding: const EdgeInsets.all(5),
                                  margin: EdgeInsets.symmetric(
                                      vertical: isSelected ? 0 : 5.h,
                                      horizontal: isSelected ? 0 : 3.w),
                                  height: 70.h,
                                  width: isSelected ? 90.w : 70.w,
                                  child: Center(
                                    child: FittedBox(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                DateTimeFormater.getMonth(
                                                    date.month),
                                                style: textThinStyle1.copyWith(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w500,
                                                  color: isSelected
                                                      ? kwhite
                                                      : kblack,
                                                ),
                                              ),
                                              adjustWidth(5.w),
                                              Text(
                                                date.day.toString(),
                                                style: textHeadStyle1.copyWith(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w600,
                                                  color: isSelected
                                                      ? kwhite
                                                      : kblack,
                                                ),
                                              ),
                                            ],
                                          ),
                                          adjustHieght(3.h),
                                          Row(
                                            children: [
                                              Text(
                                                DateTimeFormater.getWeekDay(
                                                    date.weekday),
                                                style: textHeadStyle1.copyWith(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: isSelected
                                                      ? kwhite
                                                      : kblack,
                                                ),
                                              ),
                                              adjustWidth(2.w),
                                              Text(
                                                ' ($taskCount)',
                                                style: textThinStyle1.copyWith(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w200,
                                                  color: isSelected
                                                      ? kwhite
                                                      : kblack,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          activeColor: neonShade,
                          onDateChange: (selectedDate) {},
                        ),
                ),
                adjustHieght(10),
                Obx(() => Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: controller.isLoading.value
                          ? Row(
                              children: [
                                Text('Processing',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall
                                        ?.copyWith(fontSize: 10)),
                                kWidth10,
                                const SizedBox(
                                  width: 12,
                                  height: 12,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 3,
                                  ),
                                )
                              ],
                            )
                          : const SizedBox(),
                    )),
                Obx(
                  () {
                    if (!internetConnectinController
                        .isConnectedToInternet.value) {
                      return Expanded(
                        child: SizedBox(
                          width: 300.w,
                          child: InternetConnectionLostWidget(
                            onTap: () {
                              controller.fetchTasksInsideFolder(
                                  taskInsideFolder:
                                      GetTaskInsideAFolderParamsModel(
                                folderId: folderId ?? '',
                              ));

                              controller.filterInnerFolderByDeadline(
                                  filterInnerFolder: FilterInnerFolderModel(
                                      folderId: folderId ?? '',
                                      filterDate:
                                          controller.deadlineDate.value));
                            },
                          ),
                        ),
                      );
                    } else if (controller.filteredInnerFolders.isEmpty &&
                        controller.tasksInsideFolder.isEmpty) {
                      return Expanded(
                        child: ErrorRefreshIndicator(
                          image: emptyNodata2,
                          errorMessage: 'No folders or tasks available',
                          onRefresh: () {
                            controller.fetchTasksInsideFolder(
                                taskInsideFolder:
                                    GetTaskInsideAFolderParamsModel(
                              folderId: folderId ?? '',
                            ));

                            controller.filterInnerFolderByDeadline(
                                filterInnerFolder: FilterInnerFolderModel(
                                    folderId: folderId ?? '',
                                    filterDate: controller.deadlineDate.value));
                          },
                        ),
                      );
                    } else {
                      return Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (controller.filteredInnerFolders.isNotEmpty)
                                Obx(() => ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      itemCount: controller
                                          .filteredInnerFolders.length,
                                      itemBuilder: (context, index) {
                                        final innerFolder = controller
                                            .filteredInnerFolders[index];
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 4),
                                          child: Obx(() {
                                            return GestureDetector(
                                              onLongPress: () {
                                                controller.longPress(index);
                                                controller
                                                    .toggleInnerFolderSelection(
                                                  controller
                                                          .filteredInnerFolders[
                                                              index]
                                                          .innerFolderId ??
                                                      '',
                                                );
                                              },
                                              onTap: () {
                                                if (controller
                                                    .selectedFolderContainer
                                                    .value) {
                                                  controller.longPress(index);
                                                  controller.toggleInnerFolderSelection(
                                                      controller
                                                              .filteredInnerFolders[
                                                                  index]
                                                              .innerFolderId ??
                                                          '');
                                                } else {
                                                  GoRouter.of(context).pushNamed(
                                                      Routes
                                                          .taskInsideTheInnerFolderScreen,
                                                      extra: {
                                                        'innerFolderName':
                                                            innerFolder
                                                                    .innerFolderName ??
                                                                '',
                                                        'innerFolderId': innerFolder
                                                                .innerFolderId ??
                                                            '',
                                                        'folderId':
                                                            folderId ?? ''
                                                      });
                                                  controller.innerFolders;
                                                  controller.fetchAllTasksInsideAInnerFolder(
                                                      InnerFolderTasksGetParamsModel(
                                                          folderId: folderId,
                                                          innerFolderId: controller
                                                                  .filteredInnerFolders[
                                                                      index]
                                                                  .innerFolderId ??
                                                              ''));
                                                }
                                              },
                                              child: ListTile(
                                                tileColor: controller
                                                        .selectedIndices
                                                        .contains(index)
                                                    ? klightgrey
                                                    : knill,
                                                leading: controller
                                                        .selectedIndices
                                                        .contains(index)
                                                    ? Stack(
                                                        children: [
                                                          SizedBox(
                                                            width: 50.w,
                                                            height: 50.h,
                                                            child: Image.asset(
                                                                taskFolderImage),
                                                          ),
                                                          const Positioned(
                                                            top: 13,
                                                            left: 0,
                                                            right: 0,
                                                            child: CircleAvatar(
                                                              backgroundColor:
                                                                  neonShade,
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
                                                        width: 50.w,
                                                        height: 50.h,
                                                        child: Image.asset(
                                                            taskFolderImage),
                                                      ),
                                                title: SizedBox(
                                                  width: 100,
                                                  child: Text(
                                                    innerFolder
                                                            .innerFolderName ??
                                                        '',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .displaySmall
                                                        ?.copyWith(
                                                            fontSize: 13),
                                                  ),
                                                ),
                                                trailing:
                                                    PopupMenuButton<String>(
                                                  onSelected: (value) {
                                                    if (value ==
                                                        'Add New Task to Folder') {
                                                      taskController
                                                          .searchTasks();
                                                      showTaskSelectionBottomSheet(
                                                        context,
                                                        folderId ?? '',
                                                        innerFolder
                                                                .innerFolderId ??
                                                            '',
                                                        true,
                                                      );
                                                    } else if (value ==
                                                        'Edit Inner Folder Name') {
                                                      showInnerFolderDialog(
                                                        initialName: innerFolder
                                                            .innerFolderName,
                                                        innerFolderId:
                                                            innerFolder
                                                                .innerFolderId,
                                                      );
                                                    }
                                                  },
                                                  color: kwhite,
                                                  icon: const Icon(
                                                    Icons.more_vert,
                                                  ),
                                                  itemBuilder: (context) {
                                                    return [
                                                      const PopupMenuItem<
                                                          String>(
                                                        value:
                                                            'Add New Task to Folder',
                                                        child: Text(
                                                          'Add New Task to Folder',
                                                          style: TextStyle(
                                                              color: kblack),
                                                        ),
                                                      ),
                                                      const PopupMenuItem<
                                                          String>(
                                                        value:
                                                            'Edit Inner Folder Name',
                                                        child: Text(
                                                          'Edit Inner Folder Name',
                                                          style: TextStyle(
                                                              color: kblack),
                                                        ),
                                                      ),
                                                      PopupMenuItem<String>(
                                                        value:
                                                            'Delete Inner Folder',
                                                        child: const Text(
                                                          'Delete Inner Folder',
                                                          style: TextStyle(
                                                              color: kblack),
                                                        ),
                                                        onTap: () {
                                                          showCustomConfirmationDialogue(
                                                            description:
                                                                'Are you sure you want to delete this folder ?',
                                                            buttonText:
                                                                'Delete',
                                                            context: context,
                                                            onTap: () {
                                                              controller
                                                                  .deleteInnerFolder(
                                                                folderId:
                                                                    folderId ??
                                                                        '',
                                                                deleteInnerFolder:
                                                                    DeleteInnerFolderModel(
                                                                  folderId:
                                                                      folderId,
                                                                  innerFolderId:
                                                                      controller
                                                                              .filteredInnerFolders[index]
                                                                              .innerFolderId ??
                                                                          '',
                                                                ),
                                                              );

                                                              // controller.filterInnerFolderByDeadline(
                                                              //     filterInnerFolder:
                                                              //         FilterInnerFolderModel(
                                                              //             folderId:
                                                              //                 folderId ??
                                                              //                     '',
                                                              //             filterDate: controller
                                                              //                 .deadlineDate
                                                              //                 .value));
                                                              // controller
                                                              //     .fetchTasksInsideFolder(
                                                              //   taskInsideFolder:
                                                              //       GetTaskInsideAFolderParamsModel(
                                                              //     folderId: folderId,
                                                              //   ),
                                                              // );
                                                            },
                                                            title:
                                                                'Delete Folder',
                                                            buttonColor:
                                                                neonShade,
                                                          );
                                                        },
                                                      ),
                                                      // const PopupMenuItem<String>(
                                                      //   value: 'Merge Folders',
                                                      //   child: Text(
                                                      //     'Merge Folders',
                                                      //     style: TextStyle(color: kblack),
                                                      //   ),
                                                      // ),
                                                    ];
                                                  },
                                                ),
                                              ),
                                            );
                                          }),
                                        );
                                      },
                                    )),
                              if (controller.tasksInsideFolder.isNotEmpty)
                                controller.selectedFolderContainer.value
                                    ? kempty
                                    : Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 21),
                                            child: Text(
                                              'Tasks',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displaySmall
                                                  ?.copyWith(fontSize: 15),
                                            ),
                                          ),
                                        ),
                                      ),
                              controller.selectedFolderContainer.value
                                  ? kempty
                                  : Obx(
                                      () => ListView.builder(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        itemCount:
                                            controller.tasksInsideFolder.length,
                                        itemBuilder: (context, index) {
                                          final task = controller
                                              .tasksInsideFolder[index];

                                          return GestureDetector(
                                            onTap: () {
                                              log('Main folder task id => ${controller.tasksInsideFolder[index].taskId}');

                                              taskController.fetchSingleTask(
                                                  singleTaskModel:
                                                      GetSingleTaskModel(
                                                          taskId: controller
                                                                  .tasksInsideFolder[
                                                                      index]
                                                                  .taskId ??
                                                              ''));
                                              GoRouter.of(context).pushNamed(
                                                Routes.taskDeail,
                                                pathParameters: {
                                                  "taskId": controller
                                                          .tasksInsideFolder[
                                                              index]
                                                          .taskId ??
                                                      ''
                                                },
                                              );
                                            },
                                            child: TaskContainer(
                                              tasksFromFoldrs: true,
                                              fromFolders: true,
                                              tasksFromInnerFolder: false,
                                              fromInnerfolder: false,
                                              folderId: folderId,
                                              isInnerFolderTask: false,
                                              tasksInsideFolder: task,
                                              index: index,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                            ],
                          ),
                        ),
                      );
                    }
                  },
                ),
                adjustHieght(10),
              ],
            );
          },
        ),
      ),
    );
  }
}
