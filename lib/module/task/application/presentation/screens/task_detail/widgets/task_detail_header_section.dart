// import 'dart:developer';
import 'dart:math' as math;
import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/task/application/controller/chat/chat_controller.dart';
import 'package:bizkit/module/task/application/controller/chat/message_count_controller.dart';
import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/application/presentation/screens/task_detail/widgets/task_status_dialoge.dart';
import 'package:bizkit/utils/animations/custom_shrinking_animation.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class TaskDetailHeaderSection extends StatelessWidget {
  const TaskDetailHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    final taskController = Get.find<CreateTaskController>();
    final messageCountController = Get.find<MessageCountController>();

    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              kWidth5,
              GestureDetector(
                onTap: () {
                  GoRouter.of(context).pop(context);
                },
                child: CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.onPrimary,
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    size: 18.sp,
                    color: Theme.of(context).colorScheme.onTertiary,
                  ),
                ),
              ),
              adjustWidth(10.w),
              Obx(
                () => taskController.isLoading.value
                    ? Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: ShimmerLoaderTile(
                          height: 15.h,
                          width: 150.w,
                        ),
                      )
                    : Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              taskController.singleTask.value.title ?? '',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(
                                    fontSize: 15,
                                    color: kneonDark,
                                  ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              softWrap: true,
                            ),
                            Obx(
                              () {
                                return AnimatedContainer(
                                  height: taskController.isSyncing.value ||
                                          (taskController
                                                  .fetchSingleTaskError.value &&
                                              !taskController.isLoading.value)
                                      ? null
                                      : 0,
                                  duration: const Duration(milliseconds: 300),
                                  child: taskController.isSyncing.value
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            // Rotating Sync icon using TweenAnimationBuilder
                                            TweenAnimationBuilder(
                                              tween: Tween<double>(
                                                  begin: 0, end: 2 * math.pi),
                                              duration:
                                                  const Duration(seconds: 1),
                                              builder: (context, double angle,
                                                  child) {
                                                return Transform.rotate(
                                                  angle: angle,
                                                  child: const Icon(
                                                    Icons.sync,
                                                    color: kneonDark,
                                                    size: 15,
                                                  ),
                                                );
                                              },
                                              onEnd: () {
                                                // Repeat the animation
                                                taskController.isSyncing.value
                                                    ? Future.delayed(
                                                        Duration.zero, () {
                                                        (context as Element)
                                                            .markNeedsBuild();
                                                      })
                                                    : null;
                                              },
                                            ),
                                            const SizedBox(width: 8),
                                            Text(
                                              'Syncing ...',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displaySmall
                                                  ?.copyWith(
                                                    color: kneonDark,
                                                  ),
                                            ),
                                          ],
                                        )
                                      : taskController
                                                  .fetchSingleTaskError.value &&
                                              !taskController.isLoading.value
                                          ? Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                const Icon(
                                                  Icons.error_outline,
                                                  color: kred,
                                                  size: 12,
                                                ),
                                                const SizedBox(width: 8),
                                                Text(
                                                  'Syncing failed',
                                                  style:
                                                      textThinStyle1.copyWith(
                                                          color: kred,
                                                          fontSize: 11.sp),
                                                ),
                                              ],
                                            )
                                          : const SizedBox.shrink(),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Obx(
              () {
                if ((taskController.singleTask.value.isCompleted != true &&
                        taskController.singleTask.value.isKilled != true) &&
                    taskController.singleTask.value.isOwned == true) {
                  return CircleAvatar(
                    backgroundColor: kneon,
                    child: IconButton(
                      icon: const Icon(
                        Iconsax.edit,
                        size: 19,
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (context) => TaskStatusChangeDialog(
                            taskId: taskController.singleTask.value.id,
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return kempty;
                }
              },
            ),
            adjustWidth(10.w),
            Obx(
              () => taskController.isLoading.value ||
                      taskController.singleTask.value.id == null
                  ? kempty
                  : Stack(
                      children: [
                        CircleAvatar(
                          backgroundColor: kneon,
                          child: IconButton(
                            icon: const Icon(
                              Iconsax.message,
                              size: 20,
                            ),
                            onPressed: () {
                              Get.find<ChatController>().connectChannel(context,
                                  taskId: taskController.singleTask.value.id);

                              /// pass active task or not as param [(taskController.singleTask.value.isCompleted !=true &&taskController.singleTask.value.isKilled !=true)]
                              GoRouter.of(context).push(
                                Routes.taskChatScreen,
                                extra: {
                                  'active': taskController
                                              .singleTask.value.isCompleted !=
                                          true &&
                                      taskController
                                              .singleTask.value.isKilled !=
                                          true,
                                  'taskTitle':
                                      taskController.singleTask.value.title ??
                                          ''
                                },
                              );

                              messageCountController.resetCount(
                                  id: taskController.singleTask.value.id ?? '');
                            },
                          ),
                        ),
                        Obx(() {
                          final count = messageCountController.unreadCounts[
                              taskController.singleTask.value.id ?? ''];
                          if (count == null || count.value == 0) return kempty;
                          return Positioned(
                            right: 0,
                            top: 0,
                            child: AnimatedGrowShrinkContainer(
                              animate: true,
                              child: CircleAvatar(
                                radius: 5.w,
                                backgroundColor:
                                    Theme.of(context).colorScheme.onSecondary,
                              ),
                            ),
                          );
                        })
                      ],
                    ),
            ),
          ],
        ),
      ],
    );
  }
}
