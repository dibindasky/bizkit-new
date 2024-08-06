import 'dart:developer';

import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/task/application/controller/caleder_view/calender_view.dart';
import 'package:bizkit/module/task/application/controller/folder/folder_controller.dart';
import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/application/presentation/screens/calender_view/folder/folder.dart';
import 'package:bizkit/module/task/application/presentation/screens/calender_view/widgets/calender_view_appbar.dart';
import 'package:bizkit/module/task/application/presentation/widgets/circle_avatar.dart';
import 'package:bizkit/module/task/application/presentation/widgets/task_container.dart';
import 'package:bizkit/module/task/domain/model/folders/get_task_inside_a_folder_params_model/get_task_inside_a_folder_params_model.dart';
import 'package:bizkit/module/task/domain/model/folders/inner_folder/create_folder_inside_a_folder/create_folder_inside_a_folder.dart';
import 'package:bizkit/module/task/domain/model/folders/inner_folder/delete_inner_folder_model/delete_inner_folder_model.dart';
import 'package:bizkit/module/task/domain/model/folders/inner_folder/edit_inner_folder_model/edit_inner_folder_model.dart';
import 'package:bizkit/module/task/domain/model/folders/inner_folder/filter_inner_folder_modle/filter_inner_folder_modle.dart';
import 'package:bizkit/module/task/domain/model/folders/inner_folder/inner_folder_tasks_get_params_model/inner_folder_tasks_get_params_model.dart';
import 'package:bizkit/module/task/domain/model/task/get_single_task_model/get_single_task_model.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/utils/intl/intl_date_formater.dart';
import 'package:bizkit/utils/shimmier/shimmer.dart';
import 'package:bizkit/utils/show_dialogue/confirmation_dialog.dart';
import 'package:bizkit/utils/snackbar/snackbar.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class HierarchyListtile extends StatelessWidget {
  const HierarchyListtile({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.heirarchyUserDetail, id: 2);
      },
      child: ListTile(
        leading: const CustomStackOnlineDotCircleAvatar(
          image: dummyPersonImage,
          dotColor: neonShade,
          backgroundColor: knill,
        ),
        title: Row(
          children: [
            const Text('Addam Smith'),
            adjustWidth(50),
            Text(
              '12 Tasks',
              style: TextStyle(
                color: Color(int.parse('0xFFFF6006')),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ScreenHeirarchyTaskUserDetails extends StatelessWidget {
  const ScreenHeirarchyTaskUserDetails({super.key, this.folderId});

  final String? folderId;

  @override
  Widget build(BuildContext context) {
    log('Main Folder Id :$folderId');
    final controller = Get.find<TaskFolderController>();
    final taskCalenderViewController = Get.find<TaskCalenderViewController>();
    final taskController = Get.find<CreateTaskController>();

    void showInnerFolderDialog({String? initialName, String? innerFolderId}) {
      TextEditingController folderNameController = TextEditingController(
        text: initialName ?? '',
      );
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(innerFolderId == null
                ? 'Create Inner Folder'
                : 'Edit Inner Folder'),
            content: TextField(
              controller: folderNameController,
              decoration: const InputDecoration(hintText: "Enter folder name"),
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
                        createNewFolderInsideFolder: CreateFolderInsideAFolder(
                          folderId: folderId ?? '',
                          innerFolderName: innerFolderName,
                          innerFolderTasks: [],
                        ),
                      );
                      showSnackbar(
                        context,
                        message: 'Create Inner folder successfully',
                        backgroundColor: neonShade,
                        textColor: kblack,
                        duration: 4,
                      );
                      // log('After inner folder creation ====> ${controller.deadlineDate.value} // $folderId');
                      controller.filterInnerFolderByDeadline(
                          filterInnerFolder: FilterInnerFolderModel(
                        filterDate: controller.deadlineDate.value,
                        folderId: folderId ?? '',
                      ));
                    } else {
                      controller.editInnerFolderName(
                          editInnerFolderName: EditInnerFolderModel(
                        folderId: folderId ?? '',
                        innerFolderId: innerFolderId,
                        innerFolderName: innerFolderName,
                      ));
                      controller.filterInnerFolderByDeadline(
                          filterInnerFolder: FilterInnerFolderModel(
                        filterDate: controller.deadlineDate.value,
                        folderId: folderId,
                      ));
                    }

                    controller.fetchTasksInsideFolder(
                        taskInsideFolder: GetTaskInsideAFolderParamsModel(
                      folderId: folderId ?? '',
                    ));
                    showSnackbar(
                      context,
                      message: 'Edit inner folder name successfully',
                      backgroundColor: neonShade,
                      textColor: kblack,
                      duration: 4,
                    );
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
          () => Column(
            children: [
              adjustHieght(10),
              controller.selectedFolderContainer.value
                  ? TaskLongPressAppBarItems(
                      folderId: folderId ?? '',
                      mergeInnerFolder: true,
                    )
                  : Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios_new,
                            size: 16,
                          ),
                        ),
                        adjustWidth(20),
                        Obx(
                          () => controller.isLoading.value
                              ? ShimmerLoaderTile(
                                  height: 15.h,
                                  width: 80.w,
                                )
                              : Text(
                                  controller.foldername.value,
                                  style: textHeadStyle1.copyWith(fontSize: 18),
                                ),
                        ),
                        const Spacer(),
                        CustomCircleAvatar(
                          backgroundColor: lightGrey,
                          onTap: () => showInnerFolderDialog(),
                          backgroundColorInner: neonShade,
                          child: const Icon(
                            Icons.add,
                            size: 20,
                            color: neonShade,
                          ),
                        ),
                        adjustWidth(10),
                      ],
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
                        lastDate: DateTime.now().add(const Duration(days: 31)),
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
                              controller.selctDate(date);
                              // log('Folder ID - folderFilterByDeadline ====> $folderId');
                              controller.filterInnerFolderByDeadline(
                                  filterInnerFolder: FilterInnerFolderModel(
                                      folderId: folderId ?? '',
                                      filterDate:
                                          DateTimeFormater.dateTimeFormat(
                                              date)));
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              decoration: BoxDecoration(
                                borderRadius: kBorderRadius5,
                                color: isSelected ? neonShade : kgrey,
                              ),
                              padding: const EdgeInsets.all(5),
                              margin: EdgeInsets.symmetric(
                                  vertical: isSelected ? 0 : 5.h,
                                  horizontal: isSelected ? 0 : 3.w),
                              height: 70.h,
                              width: isSelected ? 60.w : 50.w,
                              child: FittedBox(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      DateTimeFormater.getMonth(date.month),
                                      style: textHeadStyle1.copyWith(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: isSelected ? kwhite : kblack,
                                      ),
                                    ),
                                    Text(
                                      date.day.toString(),
                                      style: textThinStyle1.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w200,
                                        color: isSelected ? kwhite : kblack,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          DateTimeFormater.getWeekDay(
                                              date.weekday),
                                          style: textHeadStyle1.copyWith(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400,
                                            color: isSelected ? kwhite : kblack,
                                          ),
                                        ),
                                        Text(
                                          ' ($taskCount)',
                                          style: textThinStyle1.copyWith(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w200,
                                            color: isSelected ? kwhite : kblack,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
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
              Obx(
                () {
                  if (controller.isLoading.value) {
                    return const Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else if (controller.filteredInnerFolders.isEmpty &&
                      controller.tasksInsideFolder.isEmpty) {
                    return const Expanded(
                      child: Center(
                        child: Text('No folders or tasks available'),
                      ),
                    );
                  } else {
                    return Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (controller.filteredInnerFolders.isNotEmpty)
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                itemCount:
                                    controller.filteredInnerFolders.length,
                                itemBuilder: (context, index) {
                                  final innerFolder =
                                      controller.filteredInnerFolders[index];
                                  return Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 4),
                                    child: Obx(
                                      () => GestureDetector(
                                        onLongPress: () {
                                          controller.longPress(index);
                                          controller.toggleInnerFolderSelection(
                                              innerFolder.innerFolderId ?? '');
                                        },
                                        onTap: () {
                                          if (controller
                                              .selectedFolderContainer.value) {
                                            controller.longPress(index);
                                            controller
                                                .toggleInnerFolderSelection(
                                                    innerFolder.innerFolderId ??
                                                        '');
                                          } else {
                                            Get.toNamed(
                                              Routes
                                                  .taskInsideTheInnerFolderScreen,
                                              arguments: {
                                                'innerFolderName': innerFolder
                                                        .innerFolderName ??
                                                    '',
                                                'innerFolderId':
                                                    innerFolder.innerFolderId ??
                                                        '',
                                                'folderId': folderId ?? ''
                                              },
                                              id: 2,
                                            );

                                            controller
                                                .fetchAllTasksInsideAInnerFolder(
                                                    InnerFolderTasksGetParamsModel(
                                                        folderId: folderId,
                                                        innerFolderId:
                                                            innerFolder
                                                                .innerFolderId));
                                          }
                                        },
                                        child: ListTile(
                                          tileColor: taskCalenderViewController
                                                  .selectedIndices
                                                  .contains(index)
                                              ? lightColr
                                              : knill,
                                          leading: controller.selectedIndices
                                                  .contains(index)
                                              ? Stack(
                                                  children: [
                                                    SizedBox(
                                                      width: 60.w,
                                                      height: 60.h,
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
                                                  width: 60.w,
                                                  height: 60.h,
                                                  child: Image.asset(
                                                      taskFolderImage),
                                                ),
                                          title: SizedBox(
                                            width: 100,
                                            child: Text(
                                                innerFolder.innerFolderName ??
                                                    ''),
                                          ),
                                          trailing: PopupMenuButton<String>(
                                            onSelected: (value) {
                                              if (value ==
                                                  'Add New Task to Folder') {
                                                taskController.searchTasks(
                                                    searchItem: '');
                                                showTaskSelectionBottomSheet(
                                                  context,
                                                  folderId ?? '',
                                                  innerFolder.innerFolderId ??
                                                      '',
                                                  true,
                                                );
                                              } else if (value ==
                                                  'Edit folder name') {
                                                showInnerFolderDialog(
                                                  initialName: innerFolder
                                                      .innerFolderName,
                                                  innerFolderId:
                                                      innerFolder.innerFolderId,
                                                );
                                              }
                                            },
                                            color: kwhite,
                                            icon: const Icon(Icons.more_vert,
                                                color: kwhite),
                                            itemBuilder: (context) {
                                              return [
                                                const PopupMenuItem<String>(
                                                  value:
                                                      'Add New Task to Folder',
                                                  child: Text(
                                                    'Add New Task to Folder',
                                                    style: TextStyle(
                                                        color: kblack),
                                                  ),
                                                ),
                                                const PopupMenuItem<String>(
                                                  value: 'Edit folder name',
                                                  child: Text(
                                                    'Edit folder name',
                                                    style: TextStyle(
                                                        color: kblack),
                                                  ),
                                                ),
                                                PopupMenuItem<String>(
                                                  value: 'Delete Folder',
                                                  child: const Text(
                                                    'Delete Folder',
                                                    style: TextStyle(
                                                        color: kblack),
                                                  ),
                                                  onTap: () {
                                                    showCustomConfirmationDialogue(
                                                      description:
                                                          'Are you sure you want to delete this folder ?',
                                                      buttonText: 'Delete',
                                                      context: context,
                                                      onTap: () {
                                                        controller
                                                            .deleteInnerFolder(
                                                          deleteInnerFolder:
                                                              DeleteInnerFolderModel(
                                                            folderId: folderId,
                                                            innerFolderId: controller
                                                                    .filteredInnerFolders[
                                                                        index]
                                                                    .innerFolderId ??
                                                                '',
                                                          ),
                                                        );
                                                        controller
                                                            .fetchTasksInsideFolder(
                                                          taskInsideFolder:
                                                              GetTaskInsideAFolderParamsModel(
                                                            folderId: folderId,
                                                          ),
                                                        );
                                                        showSnackbar(
                                                          context,
                                                          message:
                                                              'Inner folder deleted successfully',
                                                          backgroundColor: kred,
                                                          textColor: kblack,
                                                          duration: 4,
                                                        );
                                                      },
                                                      title: 'Delete Folder',
                                                      buttonColor: neonShade,
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
                                      ),
                                    ),
                                  );
                                },
                              ),
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
                                              horizontal: 10),
                                          child: Text(
                                            'Tasks',
                                            style: textHeadStyle1.copyWith(
                                                fontSize: 18),
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
                                        final task =
                                            controller.tasksInsideFolder[index];

                                        return GestureDetector(
                                          onTap: () {
                                            log('Main folder task id => ${controller.tasksInsideFolder[index].taskId}');
                                            GoRouter.of(context)
                                                .push(Routes.taskChatScreen);
                                            taskController.fetchSingleTask(
                                                singleTaskModel:
                                                    GetSingleTaskModel(
                                                        taskId: controller
                                                                .tasksInsideFolder[
                                                                    index]
                                                                .taskId ??
                                                            ''));
                                          },
                                          child: TaskContainer(
                                            tasksFromFoldrs: true,
                                            fromFolders: true,
                                            folderId: folderId,
                                            isInnerFolderTask: false,
                                            tasksInsideFolder: task,
                                            index: index,
                                          ),
                                        );
                                      },
                                    ),
                                  )
                          ],
                        ),
                      ),
                    );
                  }
                },
              ),
              adjustHieght(10),
            ],
          ),
        ),
      ),
    );
  }
}
