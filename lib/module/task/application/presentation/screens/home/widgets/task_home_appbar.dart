import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/module_manager/application/controller/auth_controller.dart';
import 'package:bizkit/module/module_manager/application/presentation/screen/auth/account_switching/account_switching_sheet.dart';
import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TaskHomeAppBar extends StatelessWidget {
  const TaskHomeAppBar({
    super.key,
    required this.authController,
  });

  final AuthenticationController authController;

  @override
  Widget build(BuildContext context) {
    final taskController = Get.find<CreateTaskController>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Obx(
          () => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: GestureDetector(
              onTap: () => accountSwitchingBottomSheet(context),
              child: Row(
                children: [
                  Text(
                    "Welcome ${authController.userName.value}",
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall
                        ?.copyWith(fontSize: 15.5),
                  ),
                  const Icon(Icons.arrow_drop_down)
                ],
              ),
            ),
          ),
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.taskTabNotification, id: 1);
                taskController.fetchReceivedRequests();
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
            Container(
              width: 45.w,
              height: 45.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: klightgrey),
                color: Theme.of(context).colorScheme.onTertiary,
              ),
              child: const Icon(
                Iconsax.notification,
                size: 21,
              ),
            ),
            adjustWidth(3.w),
          ],
        )
      ],
    );
  }
}
