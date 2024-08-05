import 'package:bizkit/module/task/application/controller/caleder_view/calender_view.dart';
import 'package:bizkit/module/task/application/controller/folder/folder_controller.dart';
// import 'package:bizkit/module/task/application/controller/folder/folder_controller.dart';
import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/application/presentation/screens/calender_view/widgets/calender_view_appbar.dart';
import 'package:bizkit/module/task/application/presentation/screens/calender_view/widgets/heirarchy_task_folder_data_folder.dart';
import 'package:bizkit/module/task/application/presentation/screens/calender_view/widgets/hierarchy_task_folder.dart';
import 'package:bizkit/module/task/domain/model/folders/filter_folder_by_deadline_model/filter_folder_by_deadline_model.dart';
import 'package:bizkit/module/task/domain/model/task/filter_by_deadline_model/filter_by_deadline_model.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/utils/intl/intl_date_formater.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:intl/intl.dart';

class ScreenTaskCalenderView extends StatefulWidget {
  const ScreenTaskCalenderView({super.key});

  @override
  State<ScreenTaskCalenderView> createState() => _ScreenTaskCalenderViewState();
}

class _ScreenTaskCalenderViewState extends State<ScreenTaskCalenderView> {
  final controller = Get.find<TaskCalenderViewController>();

  final taskController = Get.find<CreateTaskController>();

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TaskFolderController>();
    final taskCalenderViewController = Get.find<TaskCalenderViewController>();

    final taskController = Get.find<CreateTaskController>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // taskController.filterPinnedTasksByType(
      //     filterPinnedTask: FilterPinnedTaskByTypeModel(
      //   taskType: 'all',
      //   isPinned: true,
      // ));

      // taskController.filterByType(
      //     filterByType: FilterByTypeModel(taskType: 'all'));
      // taskController.fetchAllPinnedTasks();
    });

    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => Column(
            children: [
              taskCalenderViewController.selectedFolderContainer.value
                  ? TaskLongPressAppBarItems(
                      mergeInnerFolder: false,
                    )
                  : const TaskCalenderViewAppBar(),
              taskCalenderViewController.selectedFolderContainer.value
                  ? kempty
                  : HeirarchyTaskFolderRow(),
              taskCalenderViewController.selectedFolderContainer.value
                  ? kempty
                  : adjustHieght(5.h),
              taskCalenderViewController.selectedFolderContainer.value
                  ? kempty
                  : Obx(
                      () => EasyInfiniteDateTimeLine(
                        timeLineProps: const EasyTimeLineProps(
                          vPadding: 20,
                          hPadding: 5,
                        ),
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(const Duration(days: 31)),
                        focusDate: taskController.selectedDate.value,
                        showTimelineHeader: false,
                        itemBuilder: (context, date, isSelected, onTap) {
                          int taskCount = taskController
                                  .tasksCounts[
                                      DateFormat('yyyy-MM-dd').format(date)]
                                  ?.value ??
                              0;
                          return GestureDetector(
                            onTap: () {
                              taskController.selctDate(date);
                              if (taskCalenderViewController
                                      .taskTabChangeIndex.value ==
                                  1) {
                                taskController.deadlineDate.value =
                                    DateTimeFormater.dateTimeFormat(date);
                                taskController.taskFilterByDeadline(
                                  filterByDeadline: FilterByDeadlineModel(
                                    date: taskController.deadlineDate.value,
                                  ),
                                );
                              } else if (taskCalenderViewController
                                      .taskTabChangeIndex.value ==
                                  2) {
                                taskController.deadlineDate.value =
                                    DateTimeFormater.dateTimeFormat(date);
                                controller.filterFoldersByDeadline(
                                    filterFolder: FilterFolderByDeadlineModel(
                                        filterDate:
                                            taskController.deadlineDate.value));
                              }
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
                              width: isSelected ? 90.w : 70.w,
                              child: FittedBox(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      DateTimeFormater.getMonth(date.month),
                                      style: textThinStyle1.copyWith(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w200,
                                        color: isSelected ? kwhite : kblack,
                                      ),
                                    ),
                                    Text(
                                      date.day.toString(),
                                      style: textThinStyle1.copyWith(
                                        fontSize: 12,
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
              adjustHieght(10.h),
              HeirarchyTaskFolderDataRow()
            ],
          ),
        ),
      ),
    );
  }
}
