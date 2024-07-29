import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/biz_card/data/secure_storage/flutter_secure_storage.dart';
import 'package:bizkit/module/module_manager/application/controller/auth_controller.dart';
import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/application/presentation/widgets/circle_avatar.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TaskHomeAppBar extends StatelessWidget {
  const TaskHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final taskController = Get.find<CreateTaskController>();
    final authController = Get.find<AuthenticationController>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Obx(
          () => Text(
            authController.userName.value.isNotEmpty
                ? "Welcome \n ${authController.userName.value}"
                : "Welcome \n Guest",
            style: TextStyle(
              fontSize: 17.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Row(
          children: [
            CustomCircleAvatar(
              backgroundColor: lightGrey,
              onTap: () {
                Get.toNamed(Routes.taskNotification, id: 1);
              },
              backgroundColorInner: neonShade,
            ),
            adjustWidth(12.w),
            CustomStackOnlineDotCircleAvatar(
              onTap: () {
                Get.toNamed(Routes.taskTabNotification, id: 1);
                taskController.fetchReceivedRequests();
              },
              image: taskHomeNNOtificationAsset,
              dotColor: kOrange,
            ),
            adjustWidth(3.w),
          ],
        ),
      ],
    );
  }
}
