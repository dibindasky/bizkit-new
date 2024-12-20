import 'package:bizkit/module/task/application/controller/caleder_view/calender_view.dart';
import 'package:bizkit/module/task/application/controller/folder/folder_controller.dart';
// import 'package:bizkit/module/task/application/controller/folder/folder_controller.dart';
import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/application/presentation/screens/calender_view/widgets/calender_view_appbar.dart';
import 'package:bizkit/module/task/application/presentation/screens/calender_view/widgets/heirarchy_task_folder_data_folder.dart';
import 'package:bizkit/module/task/application/presentation/screens/calender_view/widgets/hierarchy_task_folder.dart';
import 'package:bizkit/module/task/domain/model/folders/filter_folder_by_deadline_model/filter_folder_by_deadline_model.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/intl/intl_date_formater.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:intl/intl.dart';

class ScreenTaskCalenderView extends StatelessWidget {
  const ScreenTaskCalenderView({super.key});

  @override
  Widget build(BuildContext context) {
    final folderController = Get.find<TaskFolderController>();
    final taskCalenderViewController = Get.find<TaskCalenderViewController>();
    final calendercontroller = Get.find<TaskCalenderViewController>();
    final taskController = Get.find<CreateTaskController>();
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () {
            return Column(
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
                taskCalenderViewController.selectedFolderContainer.value ||
                        taskCalenderViewController.taskTabChangeIndex.value == 0
                    ? kempty
                    : Obx(
                        () {
                          return EasyInfiniteDateTimeLine(
                            timeLineProps: const EasyTimeLineProps(
                              vPadding: 20,
                              hPadding: 5,
                            ),
                            firstDate: DateTime.now(),
                            lastDate:
                                DateTime.now().add(const Duration(days: 31)),
                            focusDate: taskController.selectedDate.value,
                            showTimelineHeader: false,
                            itemBuilder: (context, date, isSelected, onTap) {
                              return Obx(
                                () {
                                  var taskCount = taskController
                                          .tasksCounts[DateFormat('yyyy-MM-dd')
                                              .format(date)]
                                          ?.value ??
                                      0;

                                  return GestureDetector(
                                    onTap: () {
                                      onTap();
                                      taskController.selctDate(date);

                                      if (taskCalenderViewController
                                              .taskTabChangeIndex.value ==
                                          1) {
                                        taskController.deadlineDate.value =
                                            DateTimeFormater.dateTimeFormat(
                                                date);
                                        taskController.taskFilterByDeadline();
                                      } else if (taskCalenderViewController
                                              .taskTabChangeIndex.value ==
                                          2) {
                                        folderController.deadlineDate.value =
                                            DateTimeFormater.dateTimeFormat(
                                                date);

                                        folderController
                                            .filterFoldersByDeadline(
                                                filterFolder:
                                                    FilterFolderByDeadlineModel(
                                                        filterDate:
                                                            folderController
                                                                .deadlineDate
                                                                .value));
                                      }
                                    },
                                    child: Card(
                                      elevation: 1,
                                      margin: const EdgeInsets.all(1),
                                      child: AnimatedContainer(
                                        duration:
                                            const Duration(milliseconds: 300),
                                        decoration: BoxDecoration(
                                          borderRadius: kBorderRadius5,
                                          color: isSelected
                                              ? Theme.of(context)
                                                  .colorScheme
                                                  .primary
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
                                                      style: textThinStyle1
                                                          .copyWith(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: isSelected
                                                            ? kwhite
                                                            : kblack,
                                                      ),
                                                    ),
                                                    adjustWidth(5.w),
                                                    Text(
                                                      date.day.toString(),
                                                      style: textHeadStyle1
                                                          .copyWith(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w600,
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
                                                      DateTimeFormater
                                                          .getWeekDay(
                                                              date.weekday),
                                                      style: textHeadStyle1
                                                          .copyWith(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: isSelected
                                                            ? kwhite
                                                            : kblack,
                                                      ),
                                                    ),
                                                    adjustWidth(2.w),
                                                    Text(
                                                      ' ($taskCount)',
                                                      style: textThinStyle1
                                                          .copyWith(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w200,
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
                              );
                            },
                            activeColor: kneon,
                            selectionMode: const SelectionMode.autoCenter(),
                            onDateChange: (selectedDate) {},
                          );
                        },
                      ),
                Obx(() => Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: folderController.isLoading.value &&
                                  calendercontroller.taskTabChangeIndex.value ==
                                      2 ||
                              taskController.getNetworkLoading.value &&
                                  calendercontroller.taskTabChangeIndex.value ==
                                      1
                          ? Row(
                              children: [
                                Text(
                                    calendercontroller
                                                .taskTabChangeIndex.value ==
                                            2
                                        ? 'Processing'
                                        : 'Syncing ....',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall
                                        ?.copyWith(fontSize: 10)),
                                kWidth10,
                                const SizedBox(
                                  width: 12,
                                  height: 12,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                )
                              ],
                            )
                          : const SizedBox(),
                    )),
                adjustHieght(10.h),
                HeirarchyTaskFolderDataRow(),
                adjustHieght(50.h),
              ],
            );
          },
        ),
      ),
    );
  }
}
