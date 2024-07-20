import 'dart:developer';

import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/task/application/controller/caleder_view/calender_view.dart';
import 'package:bizkit/module/task/application/controller/folder/folder_controller.dart';
import 'package:bizkit/module/task/application/presentation/screens/calender_view/folder/folder.dart';
import 'package:bizkit/module/task/application/presentation/widgets/circle_avatar.dart';
import 'package:bizkit/module/task/application/presentation/widgets/task_container.dart';
import 'package:bizkit/module/task/domain/model/folders/get_task_inside_a_folder_params_model/get_task_inside_a_folder_params_model.dart';
import 'package:bizkit/module/task/domain/model/folders/inner_folder/create_folder_inside_a_folder/create_folder_inside_a_folder.dart';
import 'package:bizkit/module/task/domain/model/folders/inner_folder/delete_inner_folder_model/delete_inner_folder_model.dart';
import 'package:bizkit/module/task/domain/model/folders/inner_folder/edit_inner_folder_model/edit_inner_folder_model.dart';
import 'package:bizkit/module/task/domain/model/folders/inner_folder/filter_inner_folder_modle/filter_inner_folder_modle.dart';
import 'package:bizkit/module/task/domain/model/folders/inner_folder/inner_folder_tasks_get_params_model/inner_folder_tasks_get_params_model.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/utils/show_dialogue/confirmation_dialog.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
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
    final controller = Get.find<TaskFolderController>();
    final taskCalenderViewController = Get.find<TaskCalenderViewController>();

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
                          folderId: folderId,
                          innerFolderName: innerFolderName,
                          innerFolderTasks: [],
                        ),
                      );
                      controller.filterInnerFolderByDeadline(
                          filterInnerFolder: FilterInnerFolderModel(
                        filterDate: controller.deadlineDate.value,
                        folderId: folderId,
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
        child: Column(
          children: [
            adjustHieght(10),
            Row(
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
                  () => Text(
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
            EasyDateTimeLine(
              timeLineProps: const EasyTimeLineProps(
                vPadding: 20,
                hPadding: 15,
              ),
              headerProps: const EasyHeaderProps(
                showSelectedDate: false,
                showHeader: false,
              ),
              dayProps: EasyDayProps(
                todayStyle: DayStyle(
                  decoration: BoxDecoration(
                    border: Border.all(color: kred),
                    borderRadius: kBorderRadius15,
                  ),
                  monthStrStyle: TextStyle(color: kwhite, fontSize: 11.sp),
                  dayNumStyle: TextStyle(color: kwhite, fontSize: 12.sp),
                  dayStrStyle: TextStyle(color: kwhite, fontSize: 11.sp),
                ),
                todayHighlightColor: kwhite,
                activeDayStyle: DayStyle(
                  dayNumStyle: const TextStyle(color: kblack),
                  decoration: BoxDecoration(
                    color: neonShade,
                    borderRadius: kBorderRadius15,
                    border: Border.all(color: neonShade),
                  ),
                ),
                inactiveDayStyle: DayStyle(
                  decoration: BoxDecoration(
                    color: lightGrey,
                    borderRadius: kBorderRadius15,
                  ),
                  dayNumStyle: const TextStyle(color: kwhite),
                ),
              ),
              activeColor: neonShade,
              initialDate: DateTime.now(),
              onDateChange: (selectedDate) {
                controller.deadlineDate.value =
                    DateFormat('yyyy-MM-dd').format(selectedDate);
                log('date :=> ${controller.deadlineDate.value}');
                controller.filterInnerFolderByDeadline(
                    filterInnerFolder: FilterInnerFolderModel(
                  folderId: folderId ?? '',
                  filterDate: controller.deadlineDate.value,
                ));
              },
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
                } else if (controller.innerFolders.isEmpty &&
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
                          if (controller.innerFolders.isNotEmpty)
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              itemCount: controller.innerFolders.length,
                              itemBuilder: (context, index) {
                                final innerFolder =
                                    controller.innerFolders[index];
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 4),
                                  child: ListTile(
                                    onTap: () {
                                      controller
                                          .fetchAllTasksInsideAInnerFolder(
                                              InnerFolderTasksGetParamsModel(
                                                  folderId: folderId,
                                                  innerFolderId: innerFolder
                                                      .innerFolderId));

                                      Get.toNamed(
                                          Routes.taskInsideTheInnerFolderScreen,
                                          arguments: controller
                                              .innerFolders[index]
                                              .innerFolderName,
                                          id: 2);
                                    },
                                    tileColor: taskCalenderViewController
                                            .selectedIndices
                                            .contains(index)
                                        ? lightColr
                                        : knill,
                                    leading: taskCalenderViewController
                                            .selectedIndices
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
                                                  backgroundColor: neonShade,
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
                                            child: Image.asset(taskFolderImage),
                                          ),
                                    title: SizedBox(
                                      width: 100,
                                      child: Text(
                                          innerFolder.innerFolderName ?? ''),
                                    ),
                                    trailing: PopupMenuButton<String>(
                                      onSelected: (value) {
                                        if (value == 'Add New Task to Folder') {
                                          showTaskSelectionBottomSheet(
                                              context,
                                              folderId ?? '',
                                              innerFolder.innerFolderId,
                                              true);
                                        } else if (value ==
                                            'Edit folder name') {
                                          showInnerFolderDialog(
                                            initialName:
                                                innerFolder.innerFolderName,
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
                                            value: 'Add New Task to Folder',
                                            child: Text(
                                              'Add New Task to Folder',
                                              style: TextStyle(color: kblack),
                                            ),
                                          ),
                                          const PopupMenuItem<String>(
                                            value: 'Edit folder name',
                                            child: Text(
                                              'Edit folder name',
                                              style: TextStyle(color: kblack),
                                            ),
                                          ),
                                          PopupMenuItem<String>(
                                            value: 'Delete Folder',
                                            child: const Text(
                                              'Delete Folder',
                                              style: TextStyle(color: kblack),
                                            ),
                                            onTap: () {
                                              showCustomConfirmationDialogue(
                                                description:
                                                    'Are you sure you want to delete this folder ?',
                                                buttonText: 'Delete',
                                                context: context,
                                                onTap: () {
                                                  controller.deleteInnerFolder(
                                                    deleteInnerFolder:
                                                        DeleteInnerFolderModel(
                                                      folderId: folderId,
                                                      innerFolderId: controller
                                                              .innerFolders[
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
                                );
                              },
                            ),
                          if (controller.tasksInsideFolder.isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Text(
                                    'Tasks',
                                    style:
                                        textHeadStyle1.copyWith(fontSize: 18),
                                  ),
                                ),
                              ),
                            ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            itemCount: controller.tasksInsideFolder.length,
                            itemBuilder: (context, index) {
                              final task = controller.tasksInsideFolder[index];
                              return TaskContainer(
                                tasksInsideFolder: task,
                                index: index,
                              );
                            },
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
        ),
      ),
    );
  }
}
