import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class QuickTasksAppBar extends StatelessWidget {
  const QuickTasksAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
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
        adjustWidth(20.w),
        Text(
          'Quick Tasks',
          style: Theme.of(context).textTheme.displayMedium,
        )
      ],
    );
  }
}
