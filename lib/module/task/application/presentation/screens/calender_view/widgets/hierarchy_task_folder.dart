import 'dart:ui';
import 'package:bizkit/module/module_manager/application/controller/access/access_controller.dart';
import 'package:bizkit/module/task/application/controller/caleder_view/calender_view.dart';
import 'package:bizkit/module/task/application/controller/hierarchy/hierarchy_controller.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class HeirarchyTaskFolderRow extends StatelessWidget {
  HeirarchyTaskFolderRow({super.key});

  final controller = Get.find<TaskCalenderViewController>();
  final hierarchyController = Get.find<HierarchyController>();
  final accessController = Get.find<AccessController>();
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
                color: Theme.of(context).colorScheme.onSecondary,
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
                        if (accessController.userRole.value == 'employee') {
                          hierarchyController.fetchEmployeesList();
                          controller.taskTabchangeIndex(0);
                        } else {
                          Fluttertoast.showToast(
                            msg:
                                'Access to view the hierarchy has been restricted',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.SNACKBAR,
                            timeInSecForIosWeb: 3,
                            fontSize: 12,
                            backgroundColor: kred,
                            textColor: kwhite,
                          );
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: controller.taskTabChangeIndex.value == 0
                              ? kneon
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
                            const Icon(
                              Icons.person_outlined,
                              size: 17,
                              color: kwhite,
                            ),
                            Text(
                              'Hierarchy',
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onTertiary,
                                  ),
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
                        decoration: BoxDecoration(
                          color: controller.taskTabChangeIndex.value == 1
                              ? kneon
                              : knill,
                        ),
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
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onTertiary,
                                  ),
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
                                ? kneon
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
                            Text(
                              'Folder',
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onTertiary,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
