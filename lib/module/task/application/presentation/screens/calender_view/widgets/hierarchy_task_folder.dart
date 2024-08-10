import 'package:bizkit/module/task/application/controller/caleder_view/calender_view.dart';
import 'package:bizkit/module/task/application/presentation/screens/calender_view/widgets/drop_dwon_container.dart';
import 'package:bizkit/module/task/application/presentation/widgets/circle_avatar.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HeirarchyTaskFolderRow extends StatelessWidget {
  HeirarchyTaskFolderRow({super.key});

  final controller = Get.find<TaskCalenderViewController>();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: lightGrey,
                borderRadius: kBorderRadius25,
              ),
              height: 30.h,
              width: 240.w,
              child: Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.taskTabchangeIndex(0);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: controller.taskTabChangeIndex.value == 0
                              ? neonShade
                              : knill,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(25),
                              bottomLeft: Radius.circular(25)),
                        ),
                        height: 40.h,
                        width: 90.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Icon(Icons.person_outlined, size: 17),
                            Text(
                              'Hierarchy',
                              style: TextStyle(fontSize: 12.sp),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.taskTabchangeIndex(1);
                      },
                      child: Container(
                        width: 70.w,
                        height: 40.h,
                        color: controller.taskTabChangeIndex.value == 1
                            ? neonShade
                            : knill,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              height: 10.h,
                              width: 10.w,
                              child: Image.asset(
                                  'asset/images/task/task in calender view icon.png'),
                            ),
                            Text(
                              'Task',
                              style: TextStyle(fontSize: 12.sp),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.taskTabchangeIndex(2);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: controller.taskTabChangeIndex.value == 2
                                ? neonShade
                                : knill,
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(25),
                                bottomRight: Radius.circular(25))),
                        width: 80.w,
                        height: 40.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              height: 10.h,
                              width: 10.w,
                              child: Image.asset(
                                  'asset/images/task/task in calender view icon.png'),
                            ),
                            const Text('Folder'),
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
              radius: 20,
              onTap: () {},
              backgroundColor: lightGrey,
              backgroundColorInner: lightGrey,
              child: const Icon(
                Icons.search,
                color: neonShade,
              ),
            ),
            adjustWidth(10.w),
            CustomCircleAvatar(
              radius: 20,
              onTap: () {
                // showModalBottomSheet(
                //   isDismissible: true,
                //   enableDrag: true,
                //   showDragHandle: true,
                //   context: context,
                //   builder: (context) {
                //     return TaskSortingBottomSheet();
                //   },
                // );
              },
              backgroundColor: lightGrey,
              backgroundColorInner: lightGrey,
              child: const Icon(
                Icons.filter_alt_outlined,
                color: neonShade,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
