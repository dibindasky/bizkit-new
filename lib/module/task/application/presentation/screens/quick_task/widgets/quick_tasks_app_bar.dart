import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class QuickTasksAppBar extends StatelessWidget {
  const QuickTasksAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final taskController = Get.find<CreateTaskController>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
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
            ),
          ],
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                taskController.fetchQuickTaskRequests();
                GoRouter.of(context).pushNamed(
                  Routes.quickTaskReceivedRequests,
                );
              },
              child: Container(
                width: 45.w,
                height: 45.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: klightgrey),
                  color: Theme.of(context).colorScheme.onTertiary,
                ),
                child: const Icon(
                  Iconsax.personalcard,
                  size: 21,
                ),
              ),
            ),
            adjustWidth(9.w),
            GestureDetector(
              onTap: () {
                GoRouter.of(context).pushNamed(
                  Routes.quickTaskCreateUpdate,
                  extra: {
                    'edit': false,
                  },
                );
              },
              child: Container(
                width: 45.w,
                height: 45.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: klightgrey),
                  color: Theme.of(context).colorScheme.onTertiary,
                ),
                child: const Icon(
                  Iconsax.additem,
                  size: 21,
                ),
              ),
            ),
            adjustWidth(3.w),
          ],
        )
      ],
    );
  }
}
