import 'package:bizkit/module/task/application/presentation/screens/task_detail/widgets/task_status_dialoge.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class TaskDetailHeaderSection extends StatelessWidget {
  const TaskDetailHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'New Project User flow',
              style: textHeadStyle1.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp,
                  color: neonShade),
            ),
            SizedBox(height: 8.h),
            Text(
              'Total Time Taken: 24Hr 55Min',
              style: textStyle1,
            ),
          ],
        ),
        Row(
          children: [
            CircleAvatar(
              backgroundColor: kGrayLight,
              child: IconButton(
                icon:
                    const Icon(Icons.mode_edit_outline_outlined, color: kwhite),
                onPressed: () {
                  showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (context) => const TaskStatusChangeDialog(),
                  );
                },
              ),
            ),
            adjustWidth(10.w),
            CircleAvatar(
              backgroundColor: kGrayLight,
              child: IconButton(
                icon: const Icon(Icons.message_outlined, color: kwhite),
                onPressed: () {
                  GoRouter.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}