import 'dart:developer';

import 'package:bizkit/module/task/application/controller/caleder_view/calender_view.dart';
import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/application/presentation/screens/calender_view/widgets/calender_view_appbar.dart';
import 'package:bizkit/module/task/application/presentation/screens/calender_view/widgets/heirarchy_task_folder_data_folder.dart';
import 'package:bizkit/module/task/application/presentation/screens/calender_view/widgets/hierarchy_task_folder.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';

class ScreenTaskCalenderView extends StatelessWidget {
  ScreenTaskCalenderView({super.key});

  final controller = Get.find<TaskCalenderViewController>();
  final taskController = Get.find<CreateTaskController>();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      taskController.fetchAllTasks();
    });
    return Scaffold(
      body: SafeArea(
          child: Obx(
        () => Column(
          children: [
            controller.selectedFolderContainer.value
                ? TaskLongPressAppBarItems()
                : const TaskCalenderViewAppBar(),
            controller.selectedFolderContainer.value
                ? kempty
                : HeirarchyTaskFolderRow(),
            controller.selectedFolderContainer.value
                ? kempty
                : adjustHieght(5.h),
            controller.selectedFolderContainer.value
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
                      log(selectedDate.toString());
                    },
                  ),
            adjustHieght(10.h),
            HeirarchyTaskFolderDataRow()
          ],
        ),
      )),
    );
  }
}
