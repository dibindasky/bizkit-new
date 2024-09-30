import 'dart:developer';

import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/domain/model/task/get_single_task_model/get_single_task_model.dart';
import 'package:bizkit/utils/animations/expansion_tile.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/intl/intl_date_formater.dart';
import 'package:bizkit/utils/refresh_indicator/refresh_custom.dart';
import 'package:bizkit/utils/shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class TaskTotalTimeAndExpenseView extends StatelessWidget {
  const TaskTotalTimeAndExpenseView({
    super.key,
    required this.taskId,
  });

  final String taskId;

  @override
  Widget build(BuildContext context) {
    log('Task id === >$taskId');
    final taskController = Get.find<CreateTaskController>();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        backgroundColor: knill,
        title: Text(
          'Total Time & Expense',
          style: textHeadStyle1,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              adjustHieght(10.h),
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 50.h,
                        decoration: BoxDecoration(
                          borderRadius: kBorderRadius10,
                          border: Border.all(color: neonShade),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                child: Padding(
                                  padding: EdgeInsets.all(1.w),
                                  child: CircleAvatar(
                                    backgroundColor: lightGrey,
                                    child: const Icon(
                                      Icons.access_time_filled_sharp,
                                      color: neonShade,
                                    ),
                                  ),
                                ),
                              ),
                              adjustWidth(8.w),
                              Expanded(
                                child: Column(
                                  children: [
                                    FittedBox(
                                      child: Text(
                                        'Time For the Task',
                                        style: textThinStyle1.copyWith(
                                            fontSize: 10.sp),
                                      ),
                                    ),
                                    taskController.isLoading.value
                                        ? Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 5),
                                            child: ShimmerLoaderTile(
                                              height: 9.h,
                                              width: 100.w,
                                            ),
                                          )
                                        : FittedBox(
                                            child: Text(
                                              DateTimeFormater
                                                  .convertMinutesToHourMinuteFormat(
                                                      taskController
                                                              .singleTask
                                                              .value
                                                              .totalTime ??
                                                          0),
                                              style: textThinStyle1,
                                            ),
                                          ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    adjustWidth(15.w),
                    Expanded(
                      child: Container(
                        height: 50.h,
                        decoration: BoxDecoration(
                          borderRadius: kBorderRadius10,
                          border: Border.all(color: neonShade),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CircleAvatar(
                                child: Padding(
                                  padding: EdgeInsets.all(1.w),
                                  child: CircleAvatar(
                                      backgroundColor: lightGrey,
                                      child: Image.asset(
                                        width: 20.w,
                                        taskExpenseIconImage,
                                      )),
                                ),
                              ),
                              // adjustWidth(8.w),
                              Expanded(
                                child: Column(
                                  children: [
                                    FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        'Expense',
                                        style: textThinStyle1.copyWith(
                                            fontSize: 10.sp),
                                      ),
                                    ),
                                    taskController.isLoading.value
                                        ? Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 5),
                                            child: ShimmerLoaderTile(
                                              height: 9.h,
                                              width: 100.w,
                                            ),
                                          )
                                        : FittedBox(
                                            child: Text(
                                              '₹${taskController.singleTask.value.totalExpense ?? 0}',
                                              style: textThinStyle1,
                                            ),
                                          ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              adjustHieght(10.h),
              Obx(
                () {
                  if (taskController.loadingFortTaskExpenseAndTime.value) {
                    return ShimmerLoader(
                      seprator: kHeight10,
                      itemCount: 5,
                      height: 40.h,
                      width: double.infinity,
                    );
                  } else if (taskController.taskExpenseAndTime.isEmpty) {
                    return Expanded(
                      child: ErrorRefreshIndicator(
                        image: emptyNodata2,
                        errorMessage: 'No total expense and time  on the task',
                        onRefresh: () {
                          taskController.fetchTaskTotalTimeAndExpense(
                              context: context,
                              taskId: GetSingleTaskModel(taskId: taskId));
                        },
                      ),
                    );
                  } else {
                    return Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: taskController.taskExpenseAndTime.length+1,
                        itemBuilder: (context, index) {
                          if(index ==  taskController.taskExpenseAndTime.length){
                            return kHeight10;
                          }
                          return CustomExpansionTileWidget(
                            isBorder: true,
                            child: Card(
                              color: klightDarkGrey,
                              child: ListTile(
                                  leading: const CircleAvatar(
                                      child: Image(
                                          image: AssetImage(personDemoImg))),
                                  title: Text(
                                    taskController
                                            .taskExpenseAndTime[index].name ??
                                        'name',
                                    style: textThinStyle1,
                                  ),
                                  trailing: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        DateTimeFormater
                                            .convertMinutesToHourMinuteFormat(
                                                taskController
                                                        .taskExpenseAndTime[
                                                            index]
                                                        .totalTime ??
                                                    0),
                                        style: textThinStyle1.copyWith(
                                            color: neonShade),
                                      ),
                                      adjustWidth(6.w),
                                      Text(
                                        '₹ ${taskController.taskExpenseAndTime[index].totalExpense ?? 0}',
                                        style: textThinStyle1.copyWith(
                                            color: neonShade),
                                      ),
                                    ],
                                  )),
                            ),
                            children: List.generate(
                              taskController.taskExpenseAndTime[index].details
                                      ?.length ??
                                  0,
                              (detailIndex) => Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 4),
                                child: ClipPath(
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        bottom: 10.w,
                                        top: 10.w,
                                        left: 10.w,
                                        right: 10.w),
                                    decoration: BoxDecoration(
                                        color: klightDarkGrey,
                                        borderRadius: kBorderRadius10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          padding: EdgeInsets.only(
                                              left: 5.w,
                                              top: 5.w,
                                              bottom: 2.w,
                                              right: 5.w),
                                          decoration: BoxDecoration(
                                              borderRadius: kBorderRadius5,
                                              color: lightGrey),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Update on Expense / Time",
                                                style: textThinStyle1.copyWith(
                                                  color: Colors.white,
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                              ),
                                              kHeight5,
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        FittedBox(
                                                          child: Text(
                                                            "Money Spent on Task:",
                                                            style: textThinStyle1
                                                                .copyWith(
                                                                    fontSize:
                                                                        10.sp),
                                                          ),
                                                        ),
                                                        Text(
                                                          "₹ ${(taskController.taskExpenseAndTime[index].details?[detailIndex].expense ?? 0)}",
                                                          style: textThinStyle1
                                                              .copyWith(
                                                                  fontSize:
                                                                      12.sp),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 5.w),
                                                    child: ColoredBox(
                                                        color: kwhite,
                                                        child: SizedBox(
                                                          height: 20.w,
                                                          width: 1.w,
                                                        )),
                                                  ),
                                                  kWidth5,
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        FittedBox(
                                                          child: Text(
                                                            "Time Spent on Task:",
                                                            style: textThinStyle1
                                                                .copyWith(
                                                                    fontSize:
                                                                        10.sp),
                                                          ),
                                                        ),
                                                        Text(
                                                          DateTimeFormater.convertMinutesToHourMinuteFormat(
                                                              taskController
                                                                      .taskExpenseAndTime[
                                                                          index]
                                                                      .details?[
                                                                          detailIndex]
                                                                      .time ??
                                                                  0),
                                                          style: textThinStyle1
                                                              .copyWith(
                                                                  fontSize:
                                                                      12.sp),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 5.w),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Description :",
                                                style: textThinStyle1,
                                              ),
                                              Text(
                                                taskController
                                                        .taskExpenseAndTime[
                                                            index]
                                                        .details?[detailIndex]
                                                        .description ??
                                                    '',
                                                style: textThinStyle1.copyWith(
                                                    fontSize: 10.sp),
                                              ),
                                            ],
                                          ),
                                        ),
                                        // kHeight5,
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
