import 'package:animate_do/animate_do.dart';
import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/domain/model/task/get_single_task_model/get_single_task_model.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/intl/intl_date_formater.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class PinnedTasksSection extends StatelessWidget {
  const PinnedTasksSection({
    super.key,
    required this.taskController,
  });

  final CreateTaskController taskController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
          width: double.infinity,
          height: 130.h,
          child: ListView.separated(
            controller: taskController.pinnedTasksScrollController,
            shrinkWrap: true,
            separatorBuilder: (context, index) => kWidth5,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return FadeIn(
                animate: true,
                child: GestureDetector(
                  onTap: () {
                    taskController.fetchSingleTask(
                        singleTaskModel: GetSingleTaskModel(
                            taskId: taskController.allPinnedTasks[index].id));

                    GoRouter.of(context).pushNamed(
                      Routes.taskDeail,
                      pathParameters: {
                        "taskId": '${taskController.allPinnedTasks[index].id}'
                      },
                    );
                  },
                  child: Card(
                    child: Container(
                      width: taskController.allPinnedTasks.length == 1
                          ? 330.w
                          : 300.w,
                      height: 100.h,
                      decoration: BoxDecoration(
                        gradient: neonNewLinearGradient,
                        borderRadius: kBorderRadius15,
                        border: Border.all(color: kwhite, width: 3),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 4),
                      child: Stack(children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  taskController.allPinnedTasks[index].title ??
                                      'title',
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(
                                        fontSize: 13,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onTertiary,
                                      ),
                                ),
                              ],
                            ),
                            adjustHieght(10.h),
                            Text(
                              taskController
                                      .allPinnedTasks[index].description ??
                                  'description',
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.copyWith(
                                    fontSize: 10,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onTertiary,
                                  ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              softWrap: true,
                            ),
                            adjustHieght(30.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Iconsax.calendar_1,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onTertiary,
                                      size: 18,
                                    ),
                                    adjustWidth(3.w),
                                    Text(
                                      taskController.allPinnedTasks[index]
                                                  .deadLine !=
                                              null
                                          ? DateTimeFormater
                                              .formatDateForPinnedTaskCard(
                                                  taskController
                                                          .allPinnedTasks[index]
                                                          .deadLine ??
                                                      '')
                                          : '',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall
                                          ?.copyWith(
                                            fontSize: 9,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onTertiary,
                                          ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                                Text(
                                  taskController
                                              .allPinnedTasks[index].isOwned ==
                                          true
                                      ? 'Created by ${taskController.allPinnedTasks[index].createdBy?.name ?? 'name'}'
                                      : 'Assgined by ${taskController.allPinnedTasks[index].createdBy?.name ?? 'name'}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall
                                      ?.copyWith(
                                        fontSize: 8,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onTertiary,
                                      ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            )
                          ],
                        ),
                        Positioned(
                          right: -1,
                          top: 1,
                          child: CircleAvatar(
                            backgroundColor: kwhite.withOpacity(0.2),
                            child: Transform.rotate(
                              angle: 0.7,
                              child: const Icon(
                                Icons.push_pin,
                                color: kwhite,
                              ),
                            ),
                          ),
                        )
                      ]),
                    ),
                  ),
                ),
              );
            },
            itemCount: taskController.allPinnedTasks.length,
          )),
    );
  }
}
