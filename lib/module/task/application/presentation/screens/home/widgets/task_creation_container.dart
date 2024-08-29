import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/task/application/controller/home_controller/home_controller.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TaskCreationContainer extends StatelessWidget {
  const TaskCreationContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<TaskHomeScreenController>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            'Task Stats',
            style: textThinStyle1.copyWith(fontSize: 15.sp),
          ),
        ),
        // EventButton(
        //   hieght: 32,
        //   wdth: 100,
        //   text: '+ Add Task',
        //   onTap: () {
        //     Get.toNamed(Routes.addTask, id: 1, arguments: 1);
        //     //  GoRouter.of(context).pushNamed(Routes.addTask);
        //   },
        //   color: const LinearGradient(colors: [neonShade, neonShade]),
        // ),

        Row(
          children: [
            // Image.asset(
            //   taskAddBtnImage,
            //   width: 50,
            // ),

            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.addTask, id: 1, arguments: 1);
              },
              child: Container(
                width: 45.w,
                height: 30.h,
                decoration: BoxDecoration(
                    color: neonShade, borderRadius: kBorderRadius5),
                child: const Icon(
                  Icons.add,
                  size: 20,
                ),
              ),
            ),
            adjustWidth(10.w),
            GestureDetector(
              onTap: () {
                homeController.changeToProgresBar();
              },
              child: Container(
                width: 45.w,
                height: 30.h,
                decoration: BoxDecoration(
                  color: neonShade,
                  borderRadius: kBorderRadius5,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Image.asset(
                    taskProgresBarBtnImage,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
