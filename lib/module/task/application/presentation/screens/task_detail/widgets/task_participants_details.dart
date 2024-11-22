import 'dart:convert';

import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/application/presentation/screens/task_detail/widgets/participants_list_bottom_sheet.dart';
import 'package:bizkit/module/task/domain/model/task/get_single_task_model/get_single_task_model.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/images/network_image_with_loader.dart';
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
      // Add null check for task
      final task = taskController.singleTask.value;
      if (task == null) {
        return const Center(child: CircularProgressIndicator());
      }

      String formatDeadline(String? deadline) {
        if (deadline == null) return 'N/A';
        final DateTime? date = DateTime.tryParse(deadline);
        if (date == null) return 'N/A';
        return DateFormat('MMM d').format(date);
      }

      // Safe concatenation of participant names with null checking
      String participants = task.assignedToDetails?.isNotEmpty == true
          ? task.assignedToDetails!.map((e) => e.name ?? 'Unknown').join(', ')
          : 'None';

      return Card(
        elevation: 0,
        child: Container(
          padding: EdgeInsets.all(10.w),
          decoration: BoxDecoration(
            borderRadius: kBorderRadius10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // Created by or assigned by section
                  if (task.isOwned == true) ...[
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: task.createdUserDetails
                                      ?.profilePicture?.isEmpty ??
                                  true
                              ? klightDarkGrey
                              : neonShade,
                          child: Padding(
                            padding: EdgeInsets.all(1.w),
                            child: task.createdUserDetails?.profilePicture
                                        ?.isNotEmpty ==
                                    true
                                ? NetworkImageWithLoader(
                                    task.createdUserDetails?.profilePicture ??
                                        '',
                                    radius: 50,
                                  )
                                : Text(
                                    task.createdUserDetails?.name?.isNotEmpty ==
                                            true
                                        ? task.createdUserDetails!.name!
                                            .substring(0, 2)
                                            .toUpperCase()
                                        : 'NA',
                                    style: textHeadStyle1,
                                  ),
                          ),
                        ),
                        adjustWidth(7.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (taskController.isLoading.value)
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: ShimmerLoaderTile(
                                  height: 9.h,
                                  width: 100.w,
                                ),
                              )
                            else
                              Text(
                                task.createdBy == task.createdUserDetails?.id
                                    ? 'Created By'
                                    : 'Assigned By',
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall
                                    ?.copyWith(
                                      overflow: TextOverflow.ellipsis,
                                    ),
                              ),
                            if (taskController.isLoading.value)
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: ShimmerLoaderTile(
                                  height: 9.h,
                                  width: 100.w,
                                ),
                              )
                            else
                              Text(
                                task.createdUserDetails?.name ?? 'Unknown',
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall
                                    ?.copyWith(fontSize: 11),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ] else ...[
                    // Assigned by section for non-owned tasks
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: task.createdUserDetails
                                      ?.profilePicture?.isEmpty ??
                                  true
                              ? klightDarkGrey
                              : neonShade,
                          child: Padding(
                            padding: EdgeInsets.all(1.w),
                            child: task.createdUserDetails?.profilePicture
                                        ?.isNotEmpty ==
                                    true
                                ? NetworkImageWithLoader(
                                    task.createdUserDetails?.profilePicture ??
                                        '',
                                    radius: 50,
                                  )
                                : Text(
                                    task.createdUserDetails?.name?.isNotEmpty ==
                                            true
                                        ? task.createdUserDetails!.name!
                                            .substring(0, 2)
                                            .toUpperCase()
                                        : 'NA',
                                    style:
                                        textHeadStyle1.copyWith(color: kwhite),
                                  ),
                          ),
                        ),
                        adjustWidth(7.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (taskController.isLoading.value)
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: ShimmerLoaderTile(
                                  height: 9.h,
                                  width: 100.w,
                                ),
                              )
                            else
                              Text(
                                task.createdBy == task.createdUserDetails?.id
                                    ? 'Created By'
                                    : 'Assigned By',
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                            if (taskController.isLoading.value)
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: ShimmerLoaderTile(
                                  height: 9.h,
                                  width: 100.w,
                                ),
                              )
                            else
                              Text(
                                task.createdUserDetails?.name ?? 'Unknown',
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                          ],
                        ),
                      ],
                    ),
                  ],
                  const Spacer(),
                  // Deadline section
                  CircleAvatar(
                    child: Padding(
                      padding: EdgeInsets.all(1.w),
                      child: const CircleAvatar(
                        backgroundColor: kneon,
                        child: Icon(
                          Icons.calendar_month,
                        ),
                      ),
                    ),
                  ),
                  adjustWidth(10.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Deadline',
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      if (taskController.isLoading.value)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: ShimmerLoaderTile(
                            height: 9.h,
                            width: 50.w,
                          ),
                        )
                      else
                        Text(
                          formatDeadline(task.deadLine),
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(fontSize: 13),
                        ),
                    ],
                  ),
                ],
              ),
              adjustHieght(10.h),
              // Participants section
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    enableDrag: true,
                    isDismissible: true,
                    showDragHandle: true,
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    builder: (context) => const ParticipantsListBottomSheet(),
                  );
                },
                child: Row(
                  children: [
                    CircleAvatar(
                      child: Padding(
                        padding: EdgeInsets.all(1.w),
                        child: const CircleAvatar(
                          backgroundColor: kneon,
                          child: Icon(
                            Icons.person,
                          ),
                        ),
                      ),
                    ),
                    adjustWidth(10.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Participants',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        if (taskController.isLoading.value)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: ShimmerLoaderTile(
                              height: 9.h,
                              width: 100.w,
                            ),
                          )
                        else
                          Text(
                            participants,
                            style: Theme.of(context).textTheme.displaySmall,
                            overflow: TextOverflow.ellipsis,
                          ),
                      ],
                    )
                  ],
                ),
              ),
              adjustHieght(20.h),
              // Time and expense section
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
                            extra: task.id ?? '',
                          );
                          taskController.fetchTaskTotalTimeAndExpense(
                            context: context,
                            taskId: GetSingleTaskModel(taskId: task.id ?? ''),
                          );
                        }
                      },
                      child: Container(
                        height: 50.h,
                        decoration: BoxDecoration(
                          borderRadius: kBorderRadius10,
                          border: Border.all(color: kneon),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                child: Padding(
                                  padding: EdgeInsets.all(1.w),
                                  child: const CircleAvatar(
                                    backgroundColor: kwhite,
                                    child: Icon(
                                      Icons.access_time_filled_sharp,
                                      color: kneon,
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
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall,
                                      ),
                                    ),
                                    if (taskController.isLoading.value)
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5),
                                        child: ShimmerLoaderTile(
                                          height: 9.h,
                                          width: 100.w,
                                        ),
                                      )
                                    else
                                      FittedBox(
                                        child: Text(
                                          DateTimeFormater
                                              .convertMinutesToHourMinuteFormat(
                                            task.totalTime ?? 0,
                                          ),
                                          style: Theme.of(context)
                                              .textTheme
                                              .displaySmall
                                              ?.copyWith(fontSize: 14),
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
                            extra: task.id ?? '',
                          );
                          taskController.fetchTaskTotalTimeAndExpense(
                            context: context,
                            taskId: GetSingleTaskModel(taskId: task.id ?? ''),
                          );
                        }
                      },
                      child: Container(
                        height: 50.h,
                        decoration: BoxDecoration(
                          borderRadius: kBorderRadius10,
                          border: Border.all(color: kneon),
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
                                    backgroundColor: kwhite,
                                    child: Image.asset(
                                      taskExpenseIconImage,
                                      width: 20.w,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        'Expense',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall,
                                      ),
                                    ),
                                    if (taskController.isLoading.value)
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5),
                                        child: ShimmerLoaderTile(
                                          height: 9.h,
                                          width: 60.w,
                                        ),
                                      )
                                    else
                                      FittedBox(
                                        child: Text(
                                          '₹ ${task.totalExpense ?? '0'}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .displaySmall
                                              ?.copyWith(fontSize: 14),
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
        ),
      );
    });
  }
}
