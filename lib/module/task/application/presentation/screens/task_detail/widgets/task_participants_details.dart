import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/domain/model/task/get_single_task_model/get_single_task_model.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/intl/intl_date_formater.dart';
import 'package:bizkit/utils/shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class TaskDetailUserInfoSection extends StatelessWidget {
  const TaskDetailUserInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    final taskController = Get.find<CreateTaskController>();

    return Obx(() {
      final task = taskController.singleTask.value;

      String formatDeadline(String? deadline) {
        if (deadline == null) return 'N/A';
        final DateTime? date = DateTime.tryParse(deadline);
        if (date == null) return 'N/A';
        return DateFormat('MMM d').format(date);
      }

      //  Join participants names
      String? participants =
          task.assignedToDetails != null && task.assignedToDetails!.isNotEmpty
              ? task.assignedToDetails?.map((e) => e.name).join(', ')
              : 'None';

      return Container(
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          color: klightDarkGrey,
          borderRadius: kBorderRadius10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                taskController.singleTask.value.isOwned == true
                    ? Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: neonShade,
                            child: Padding(
                                padding: EdgeInsets.all(1.w),
                                child: CircleAvatar(
                                  radius: 20.w,
                                  backgroundImage:
                                      const AssetImage(personDemoImg),
                                )),
                          ),
                          adjustWidth(7.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              taskController.isLoading.value
                                  ? Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      child: ShimmerLoaderTile(
                                        height: 9.h,
                                        width: 100.w,
                                      ),
                                    )
                                  : Text(
                                      taskController
                                                  .singleTask.value.createdBy ==
                                              taskController.singleTask.value
                                                  .createdUserDetails?.id
                                          ? 'Created By'
                                          : 'Assigned By',
                                      style: textHeadStyle1.copyWith(
                                          fontSize: 13.sp),
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
                                  : Text(
                                      taskController.singleTask.value
                                              .createdUserDetails?.name ??
                                          'creater name',
                                      style: textThinStyle1,
                                    ),
                            ],
                          ),
                        ],
                      )
                    : Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: neonShade,
                            child: Padding(
                                padding: EdgeInsets.all(1.w),
                                child: CircleAvatar(
                                  radius: 20.w,
                                  backgroundImage:
                                      const AssetImage(personDemoImg),
                                )),
                          ),
                          adjustWidth(7.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              taskController.isLoading.value
                                  ? Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      child: ShimmerLoaderTile(
                                        height: 9.h,
                                        width: 100.w,
                                      ),
                                    )
                                  : Text(
                                      'Assigned By',
                                      style: textHeadStyle1.copyWith(
                                          fontSize: 13.sp),
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
                                  : Text(
                                      taskController.singleTask.value
                                              .createdUserDetails?.name ??
                                          'Unknown',
                                      style: textThinStyle1,
                                    ),
                            ],
                          ),
                        ],
                      ),
                const Spacer(),
                CircleAvatar(
                  backgroundColor: neonShade,
                  child: Padding(
                    padding: EdgeInsets.all(1.w),
                    child: const CircleAvatar(
                        backgroundColor: klightDarkGrey,
                        child: Icon(Icons.calendar_month, color: kwhite)),
                  ),
                ),
                adjustWidth(10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Deadline',
                      style: textHeadStyle1.copyWith(fontSize: 13.sp),
                    ),
                    taskController.isLoading.value
                        ? Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: ShimmerLoaderTile(
                              height: 9.h,
                              width: 50.w,
                            ),
                          )
                        : Text(
                            formatDeadline(task.deadLine),
                            style: textThinStyle1,
                          ),
                  ],
                ),
              ],
            ),
            adjustHieght(10.h),
            Row(
              children: [
                CircleAvatar(
                  child: Padding(
                    padding: EdgeInsets.all(1.w),
                    child: const CircleAvatar(
                        backgroundColor: klightDarkGrey,
                        child: Icon(
                          Icons.person,
                          color: neonShade,
                        )),
                  ),
                ),
                adjustWidth(10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Participants',
                      style: textHeadStyle1.copyWith(fontSize: 13.sp),
                    ),
                    Obx(
                      () => taskController.isLoading.value
                          ? Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: ShimmerLoaderTile(
                                height: 9.h,
                                width: 100.w,
                              ),
                            )
                          : Text(
                              participants ?? 'Participants',
                              style: textThinStyle1,
                              overflow: TextOverflow.ellipsis,
                            ),
                    ),
                  ],
                )
              ],
            ),
            adjustHieght(20.h),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      if ((task.totalExpense != 0 &&
                              task.totalExpense != null) &&
                          (task.totalTime != 0 && task.totalTime != null)) {
                        GoRouter.of(context).pushNamed(
                            Routes.taskTotalTimeAndExpense,
                            extra: task.id ?? '');
                        taskController.fetchTaskTotalTimeAndExpense(
                            context: context,
                            taskId: GetSingleTaskModel(taskId: task.id ?? ''));
                      }
                    },
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
                                            // '${ task.totalTime ?? 'total time'}',
                                            DateTimeFormater
                                                .convertMinutesToHourMinuteFormat(
                                                    task.totalTime ?? 0),
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
                ),
                adjustWidth(15.w),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      if ((task.totalExpense != 0 &&
                              task.totalExpense != null) &&
                          (task.totalTime != 0 && task.totalTime != null)) {
                        GoRouter.of(context).pushNamed(
                            Routes.taskTotalTimeAndExpense,
                            extra: task.id ?? '');
                        taskController.fetchTaskTotalTimeAndExpense(
                            context: context,
                            taskId: GetSingleTaskModel(taskId: task.id ?? ''));
                      }
                    },
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
                                            width: 60.w,
                                          ),
                                        )
                                      : FittedBox(
                                          child: Text(
                                            '₹ ${task.totalExpense ?? '0'}',
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
                ),
              ],
            )
          ],
        ),
      );
    });
  }
}
