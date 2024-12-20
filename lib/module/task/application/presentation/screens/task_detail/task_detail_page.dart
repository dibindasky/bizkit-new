import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/application/presentation/screens/task_detail/widgets/attachments_task_detail.dart';
import 'package:bizkit/module/task/application/presentation/screens/task_detail/widgets/description_task_detail.dart';
import 'package:bizkit/module/task/application/presentation/screens/task_detail/widgets/nex_actiondate_section.dart';
import 'package:bizkit/module/task/application/presentation/screens/task_detail/widgets/status_task_details.dart';
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
    this.fromHeirarchy = false,
  });

  final String? taskId;
  final bool fromHeirarchy;

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
                if (taskController.fetchSingleTaskError.value &&
                    taskController.singleTask.value.title == null) {
                  return GestureDetector(
                    onTap: () {
                      taskController.fetchSingleTask(
                          singleTaskModel:
                              GetSingleTaskModel(taskId: taskId ?? ''));
                    },
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.refresh,
                            color: neonShade,
                          ),
                          Text(
                            'Tap to retry',
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall
                                ?.copyWith(fontSize: 15),
                          ),
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
                          TaskDetailHeaderSection(fromHeirarchy: fromHeirarchy),
                          adjustHieght(15.h),
                          const TaskDetailUserInfoSection(),
                          adjustHieght(15.h),
                          const TaskDetailDescriptionSection(),
                          adjustHieght(15.h),
                          const TaskDetailStatusSection(),
                          adjustHieght(15.h),
                          NextActionDateSection(taskId: taskId),
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
