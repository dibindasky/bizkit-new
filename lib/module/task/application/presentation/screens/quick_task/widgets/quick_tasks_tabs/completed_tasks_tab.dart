import 'package:animate_do/animate_do.dart';
import 'package:bizkit/module/module_manager/application/controller/internet_controller.dart';
import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/images/network_image_with_loader.dart';
import 'package:bizkit/utils/intl/intl_date_formater.dart';
import 'package:bizkit/utils/refresh_indicator/refresh_custom.dart';
import 'package:bizkit/utils/shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CompletedQuickTasksTab extends StatelessWidget {
  const CompletedQuickTasksTab({
    super.key,
    required this.taskController,
  });

  final CreateTaskController taskController;

  @override
  Widget build(BuildContext context) {
    final internetConnectinController =
        Get.find<InternetConnectionController>();
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          height: constraints.maxHeight,
          child: Obx(
            () {
              if (!internetConnectinController.isConnectedToInternet.value) {
                return InternetConnectionLostWidget(
                  onTap: () {
                    taskController.fetchCompletedQuickTasks();
                  },
                );
              }
              if (taskController.loadingForCompletedQuickTasks.value) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: ShimmerLoader(
                    itemCount: 15,
                    height: 90.h,
                    width: double.infinity,
                    seprator: kHeight10,
                  ),
                );
              } else if (taskController.completedQuickTasks.isEmpty) {
                return ErrorRefreshIndicator(
                  image: emptyNodata2,
                  errorMessage: 'No Completed Quick Tasks',
                  onRefresh: () {
                    taskController.fetchCompletedQuickTasks();
                  },
                );
              } else {
                return RefreshIndicator(
                  onRefresh: () async {
                    taskController.fetchCompletedQuickTasks();
                  },
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    itemCount: taskController.completedQuickTasks.length,
                    separatorBuilder: (context, index) => SizedBox(height: 5.h),
                    itemBuilder: (context, index) {
                      final completedQuickTasks =
                          taskController.completedQuickTasks[index];
                      return FadeInRight(
                        child: Card(
                          elevation: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(13.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  completedQuickTasks.title ?? 'Untitled Task',
                                  style:
                                      Theme.of(context).textTheme.displaySmall,
                                ),
                                adjustHieght(10.h),
                                Text(
                                  completedQuickTasks.description ??
                                      'No description',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall
                                      ?.copyWith(
                                        fontSize: 10,
                                        color: kGreyNormal,
                                      ),
                                ),
                                adjustHieght(10.h),
                                // Stacked profile images replacement
                                if (completedQuickTasks.assignedTo != null &&
                                    completedQuickTasks.assignedTo!.isNotEmpty)
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: SizedBox(
                                      height: 30.h,
                                      child: completedQuickTasks.assignedTo !=
                                                  null &&
                                              completedQuickTasks
                                                  .assignedTo!.isNotEmpty
                                          ? LayoutBuilder(
                                              builder: (context, constraints) {
                                                return Stack(
                                                  clipBehavior: Clip.none,
                                                  children: List.generate(
                                                    completedQuickTasks
                                                        .assignedTo!.length,
                                                    (index) => Positioned(
                                                      left: index *
                                                          20.0, // Adjust overlap as needed
                                                      child: CircleAvatar(
                                                        radius: 20
                                                            .r, // Use .r for responsive sizing
                                                        backgroundColor: knill,
                                                        child: CircleAvatar(
                                                          radius: 18.r,
                                                          child: completedQuickTasks
                                                                      .assignedTo?[
                                                                          index]
                                                                      .profilePicture !=
                                                                  null
                                                              ? NetworkImageWithLoader(
                                                                  radius: 50,
                                                                  completedQuickTasks
                                                                          .assignedTo?[
                                                                              index]
                                                                          .profilePicture ??
                                                                      '',
                                                                )
                                                              : const Icon(
                                                                  Icons.person,
                                                                  size: 19,
                                                                ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            )
                                          : const SizedBox.shrink(),
                                    ),
                                  ),
                                adjustHieght(5.h),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Completed at : ${DateTimeFormater.formatTimeAMPMDate(completedQuickTasks.completedAt)}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall
                                          ?.copyWith(fontSize: 9),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional.bottomEnd,
                                      child: Text(
                                        completedQuickTasks.isOwned == true
                                            ? 'Created by you'
                                            : 'Assigned by ${completedQuickTasks.createdBy?.name ?? 'Unknown'}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall
                                            ?.copyWith(fontSize: 9),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
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
        );
      },
    );
  }
}
