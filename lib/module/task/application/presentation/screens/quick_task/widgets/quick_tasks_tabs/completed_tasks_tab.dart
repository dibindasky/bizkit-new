import 'package:animate_do/animate_do.dart';
import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/images/network_image_with_loader.dart';
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
    return SingleChildScrollView(
      child: Column(
        children: [
          Obx(
            () {
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
              } else {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: RefreshIndicator(
                    onRefresh: () async {
                      taskController.fetchCompletedQuickTasks();
                    },
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final completedQuickTasks =
                            taskController.completedQuickTasks[index];
                        return FadeInRight(
                          animate: true,
                          child: Card(
                            elevation: 0,
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    completedQuickTasks.title ?? 'title',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall,
                                  ),
                                  adjustHieght(10.h),
                                  Text(
                                    completedQuickTasks.description ??
                                        'description',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall
                                        ?.copyWith(
                                          fontSize: 10,
                                          color: kGreyNormal,
                                        ),
                                  ),
                                  adjustHieght(10.h),
                                  Row(
                                    children: List.generate(
                                      growable: true,
                                      completedQuickTasks.assignedTo?.length ??
                                          0,
                                      (index) => CircleAvatar(
                                        radius: 15,
                                        child: completedQuickTasks
                                                    .assignedTo?[index]
                                                    .profilePicture !=
                                                null
                                            ? NetworkImageWithLoader(
                                                radius: 50,
                                                completedQuickTasks
                                                        .assignedTo?[index]
                                                        .profilePicture ??
                                                    '')
                                            : const Icon(
                                                Icons.person,
                                                size: 19,
                                              ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional.bottomEnd,
                                    child: Text(
                                      completedQuickTasks.isOwned == true
                                          ? 'Created by you'
                                          : 'Assgined by ${completedQuickTasks.completedBy?[index].name ?? ''}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall
                                          ?.copyWith(fontSize: 9),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => kHeight5,
                      itemCount: taskController.completedQuickTasks.length,
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
