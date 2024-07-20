import 'dart:developer';

import 'package:bizkit/module/task/application/controller/caleder_view/calender_view.dart';
import 'package:bizkit/module/task/application/controller/folder/folder_controller.dart';
// import 'package:bizkit/module/task/application/controller/folder/folder_controller.dart';
import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/application/presentation/screens/calender_view/widgets/calender_view_appbar.dart';
import 'package:bizkit/module/task/application/presentation/screens/calender_view/widgets/heirarchy_task_folder_data_folder.dart';
import 'package:bizkit/module/task/application/presentation/screens/calender_view/widgets/hierarchy_task_folder.dart';
import 'package:bizkit/module/task/domain/model/folders/filter_folder_by_deadline_model/filter_folder_by_deadline_model.dart';
import 'package:bizkit/module/task/domain/model/task/filter_by_deadline_model/filter_by_deadline_model.dart';
import 'package:bizkit/module/task/domain/model/task/filter_by_type_model/filter_by_type_model.dart';
import 'package:bizkit/module/task/domain/model/task/filter_pinned_task_by_type_model/filter_pinned_task_by_type_model.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
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

      taskController.filterByType(
          filterByType: FilterByTypeModel(taskType: 'all'));
      // taskController.fetchAllPinnedTasks();
    });

    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => Column(
            children: [
              taskCalenderViewController.selectedFolderContainer.value
                  ? TaskLongPressAppBarItems()
                  : const TaskCalenderViewAppBar(),
              taskCalenderViewController.selectedFolderContainer.value
                  ? kempty
                  : HeirarchyTaskFolderRow(),
              taskCalenderViewController.selectedFolderContainer.value
                  ? kempty
                  : adjustHieght(5.h),
              taskCalenderViewController.selectedFolderContainer.value
                  ? kempty
                  : EasyDateTimeLine(
                      dayProps: EasyDayProps(
                        todayStyle: DayStyle(
                          decoration: BoxDecoration(
                            border: Border.all(color: kred),
                            borderRadius: kBorderRadius15,
                          ),
                          monthStrStyle:
                              TextStyle(color: kwhite, fontSize: 11.sp),
                          dayNumStyle:
                              TextStyle(color: kwhite, fontSize: 12.sp),
                          dayStrStyle:
                              TextStyle(color: kwhite, fontSize: 11.sp),
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
                      timeLineProps: const EasyTimeLineProps(
                        vPadding: 20,
                        hPadding: 10,
                      ),
                      headerProps: const EasyHeaderProps(
                        showSelectedDate: false,
                        showHeader: false,
                      ),
                      activeColor: neonShade,
                      initialDate: DateTime.now(),
                      onDateChange: (selectedDate) {
                        String formattedDate =
                            DateFormat('yyyy-MM-dd').format(selectedDate);
                        controller.deadlineDate.value = formattedDate;
                        taskController.deadlineDate.value = formattedDate;
                        log(selectedDate.toString());
                        if (taskCalenderViewController
                                .taskTabChangeIndex.value ==
                            1) {
                          taskController.taskFilterByDeadline(
                            filterByDeadline: FilterByDeadlineModel(
                              date: taskController.deadlineDate.value,
                            ),
                          );
                        } else if (taskCalenderViewController
                                .taskTabChangeIndex.value ==
                            2) {
                          controller.filterFoldersByDeadline(
                              filterFolder: FilterFolderByDeadlineModel(
                                  filterDate: controller.deadlineDate.value));
                        }
                      },
                    ),
              // : EasyInfiniteDateTimeLine(
              //     timeLineProps: const EasyTimeLineProps(
              //       vPadding: 20,
              //       hPadding: 10,
              //     ),
              //     dayProps: EasyDayProps(
              //       todayStyle: DayStyle(
              //         decoration: BoxDecoration(
              //           border: Border.all(color: kred),
              //           borderRadius: kBorderRadius15,
              //         ),
              //         monthStrStyle:
              //             TextStyle(color: kwhite, fontSize: 11.sp),
              //         dayNumStyle:
              //             TextStyle(color: kwhite, fontSize: 12.sp),
              //         dayStrStyle:
              //             TextStyle(color: kwhite, fontSize: 11.sp),
              //       ),
              //       todayHighlightColor: kwhite,
              //       activeDayStyle: DayStyle(
              //         dayNumStyle: const TextStyle(color: kblack),
              //         decoration: BoxDecoration(
              //           color: neonShade,
              //           borderRadius: kBorderRadius15,
              //           border: Border.all(color: neonShade),
              //         ),
              //       ),
              //       inactiveDayStyle: DayStyle(
              //         decoration: BoxDecoration(
              //           color: lightGrey,
              //           borderRadius: kBorderRadius15,
              //         ),
              //         dayNumStyle: const TextStyle(color: kwhite),
              //       ),
              //     ),
              //     firstDate: DateTime.now(),
              //     lastDate: DateTime.now().add(const Duration(days: 31)),
              //     focusDate: DateTime.now(),
              //     showTimelineHeader: false,
              //     itemBuilder: (context, date, isSelected, onTap) =>
              //         GestureDetector(
              //       onTap: () {
              //         onTap();
              //       },
              //       child: AnimatedContainer(
              //         duration: const Duration(milliseconds: 300),
              //         decoration: BoxDecoration(
              //           borderRadius: kBorderRadius5,
              //           color: isSelected ? kneonShade : kgrey,
              //         ),
              //         padding: const EdgeInsets.all(5),
              //         margin: EdgeInsets.symmetric(
              //             vertical: isSelected ? 0 : 5.h,
              //             horizontal: isSelected ? 0 : 3.w),
              //         height: 70.h,
              //         width: isSelected ? 60.w : 50.w,
              //         child: FittedBox(
              //           child: Column(
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             children: [
              //               Text(
              //                 '',
              //                 style: textThinStyle1.copyWith(
              //                     color: isSelected ? kwhite : kblack),
              //               ),
              //               Text(
              //                 date.day.toString(),
              //                 style: textHeadStyle1.copyWith(
              //                     color: isSelected ? kwhite : kblack),
              //               ),
              //               Text(
              //                 '₹ 3100',
              //                 style: textThinStyle1.copyWith(
              //                     color: isSelected ? kwhite : kblack),
              //               )
              //             ],
              //           ),
              //         ),
              //       ),
              //     ),
              //     onDateChange: (selectedDate) {
              //       log(selectedDate.toString());
              //     },
              //   ),
              adjustHieght(10.h),
              HeirarchyTaskFolderDataRow()
            ],
          ),
        ),
      ),
    );
  }
}
