import 'package:bizkit/module/task/application/presentation/screens/task_detail/widgets/attachments_task_detail.dart';
import 'package:bizkit/module/task/application/presentation/screens/task_detail/widgets/description_task_detail.dart';
import 'package:bizkit/module/task/application/presentation/screens/task_detail/widgets/sub_task_list.dart';
import 'package:bizkit/module/task/application/presentation/screens/task_detail/widgets/tag_selection_task_detail.dart';
import 'package:bizkit/module/task/application/presentation/screens/task_detail/widgets/task_detail_header_section.dart';
import 'package:bizkit/module/task/application/presentation/screens/task_detail/widgets/task_participants_details.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenTaskDetailPage extends StatelessWidget {
  const ScreenTaskDetailPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
