import 'package:bizkit/module/task/application/controller/caleder_view/calender_view.dart';
import 'package:bizkit/module/task/application/presentation/screens/calender_view/widgets/drop_dwon_container.dart';
import 'package:bizkit/module/task/application/presentation/screens/calender_view/widgets/hierarchy_tile.dart';
import 'package:bizkit/module/task/application/presentation/screens/total_tasks/tabbar.dart';
import 'package:bizkit/module/task/application/presentation/widgets/circle_avatar.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';

class ScreenTaskCalenderView extends StatelessWidget {
  ScreenTaskCalenderView({super.key});

  final controller = Get.find<TaskCalenderViewController>();
  TextEditingController deadLineController = TextEditingController();
  TextEditingController priorityController = TextEditingController();
  TextEditingController taskTypeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              width: double.infinity,
              height: 80,
              child: Row(
                children: [
                  const Icon(
                    Icons.calendar_month,
                    color: neonShade,
                  ),
                  adjustWidth(10),
                  Text('Calender view', style: TextStyle(fontSize: 17.sp)),
                  const Spacer(),
                  CustomCircleAvatar(
                    backgroundColor: lightGrey,
                    onTap: () {},
                    backgroundColorInner: neonShade,
                  ),
                  adjustWidth(10),
                  CustomCircleAvatar(
                    backgroundColor: lightGrey,
                    onTap: () {},
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
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: lightGrey,
                        borderRadius: kBorderRadius25,
                      ),
                      height: 40.h,
                      width: 240.w,
                      child: Obx(
                        () => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () {
                                controller.changeBottomTab(0);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color:
                                      controller.taskBottomTabIndex.value == 0
                                          ? neonShade
                                          : knill,
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(25),
                                      bottomLeft: Radius.circular(25)),
                                ),
                                height: 40.h,
                                width: 80.w,
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(Icons.history_edu_sharp),
                                    Text('Hierarcy'),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.changeBottomTab(1);
                              },
                              child: Container(
                                width: 80.w,
                                height: 40.h,
                                color: controller.taskBottomTabIndex.value == 1
                                    ? neonShade
                                    : knill,
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(Icons.task_alt_sharp),
                                    Text('Task'),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.changeBottomTab(2);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color:
                                        controller.taskBottomTabIndex.value == 2
                                            ? neonShade
                                            : knill,
                                    borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(25),
                                        bottomRight: Radius.circular(25))),
                                width: 80.w,
                                height: 40.h,
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(Icons.folder_open_sharp),
                                    Text('Folder'),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    CustomCircleAvatar(
                      onTap: () {},
                      backgroundColor: lightGrey,
                      backgroundColorInner: lightGrey,
                      child: const Icon(
                        Icons.search,
                        color: neonShade,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            adjustHieght(10),
            EasyDateTimeLine(
              timeLineProps: const EasyTimeLineProps(
                vPadding: 14,
                hPadding: 10,
              ),
              headerProps: const EasyHeaderProps(
                showSelectedDate: false,
                showHeader: false,
              ),
              activeColor: neonShade,
              initialDate: DateTime.now(),
              onDateChange: (selectedDate) {},
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  DropDownContainer(controller: deadLineController, items: [
                    'Jan - 31 - 2023',
                    'Jan - 31 - 2023',
                    'Jan - 31 - 2023'
                  ]),
                  DropDownContainer(
                      controller: priorityController,
                      items: ['High', 'Medium', 'Low']),
                  DropDownContainer(
                    controller: taskTypeController,
                    items: ['Official', 'Personal'],
                  ),
                ],
              ),
            ),
            adjustHieght(20),
            Obx(() {
              if (controller.taskBottomTabIndex.value == 0) {
                return Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return const HierarchyListtile();
                    },
                  ),
                );
              }
              if (controller.taskBottomTabIndex.value == 1) {
                return const Expanded(child: TaskListView());
              } else {
                return const Expanded(child: TaskListView());
              }
            })
          ],
        ),
      ),
    );
  }
}
