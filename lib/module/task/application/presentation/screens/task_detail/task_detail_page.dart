import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/application/presentation/screens/task_detail/widgets/attachments_task_detail.dart';
import 'package:bizkit/module/task/application/presentation/screens/task_detail/widgets/description_task_detail.dart';
import 'package:bizkit/module/task/application/presentation/screens/task_detail/widgets/sub_task_list.dart';
import 'package:bizkit/module/task/application/presentation/screens/task_detail/widgets/tag_selection_task_detail.dart';
import 'package:bizkit/module/task/application/presentation/screens/task_detail/widgets/task_detail_header_section.dart';
import 'package:bizkit/module/task/application/presentation/screens/task_detail/widgets/task_participants_details.dart';
import 'package:bizkit/module/task/domain/model/task/get_single_task_model/get_single_task_model.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ScreenTaskDetailPage extends StatelessWidget {
  const ScreenTaskDetailPage({
    super.key,
    this.taskId,
  });

  final String? taskId;

  @override
  Widget build(BuildContext context) {
    final taskController = Get.find<CreateTaskController>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: RefreshIndicator(
            onRefresh: () async {
              taskController.fetchSingleTask(
                  singleTaskModel: GetSingleTaskModel(taskId: taskId ?? ''));
            },
            child: Obx(
              () {
                if (taskController.fetchSingleTaskError.value) {
                  return GestureDetector(
                    onTap: () {
                      taskController.fetchSingleTask(
                          singleTaskModel:
                              GetSingleTaskModel(taskId: taskId ?? ''));
                    },
                    child: const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.refresh,
                            color: neonShade,
                          ),
                          Text('Tap to retry'),
                        ],
                      ),
                    ),
                  );
                }
                return Stack(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const TaskDetailHeaderSection(),
                          adjustHieght(15.h),
                          const TaskDetailUserInfoSection(),
                          adjustHieght(15.h),
                          const TaskDetailDescriptionSection(),
                          adjustHieght(15.h),
                          const TaskDetailAttachmentsSection(),
                          adjustHieght(15.h),
                          const TaskDetailTagsSection(),
                          adjustHieght(15.h),
                          const TaskDetailSubtasksSection(),
                          adjustHieght(150.h),
                        ],
                      ),
                    ),
                    // if (taskController.isSyncing.value)
                    //   Positioned(
                    //     bottom: 10,
                    //     left: 120,
                    //     child: Center(
                    //       child: Row(
                    //         mainAxisSize: MainAxisSize.min,
                    //         children: [
                    //           // Rotating Sync icon using TweenAnimationBuilder
                    //           TweenAnimationBuilder(
                    //             tween:
                    //                 Tween<double>(begin: 0, end: 2 * math.pi),
                    //             duration: const Duration(seconds: 1),
                    //             builder: (context, double angle, child) {
                    //               return Transform.rotate(
                    //                 angle: angle,
                    //                 child: const Icon(
                    //                   Icons.sync,
                    //                   color: neonShade,
                    //                   size: 20,
                    //                 ),
                    //               );
                    //             },
                    //             onEnd: () {
                    //               // Repeat the animation
                    //               taskController.isSyncing.value
                    //                   ? Future.delayed(Duration.zero, () {
                    //                       (context as Element).markNeedsBuild();
                    //                     })
                    //                   : null;
                    //             },
                    //           ),
                    //           const SizedBox(width: 8),
                    //           Text(
                    //             'Syncing ...',
                    //             style:
                    //                 textThinStyle1.copyWith(color: neonShade),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
