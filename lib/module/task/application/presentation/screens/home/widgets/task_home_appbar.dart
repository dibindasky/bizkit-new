import 'dart:math' as math;

import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/module_manager/application/controller/auth_controller.dart';
import 'package:bizkit/module/module_manager/application/controller/internet_controller.dart';
import 'package:bizkit/module/module_manager/application/presentation/screen/auth/account_switching/account_switching_sheet.dart';
import 'package:bizkit/module/task/application/controller/chat/message_count_controller.dart';
import 'package:bizkit/module/task/application/controller/home_controller/home_controller.dart';
import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/snackbar/flutter_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
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
    final notificationController = Get.find<MessageCountController>();
    final homeController = Get.find<TaskHomeScreenController>();
    final internetConnectinController =
        Get.find<InternetConnectionController>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Obx(
          () => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () => accountSwitchingBottomSheet(context),
                  child: Row(
                    children: [
                      Text(
                        "Hello ${authController.userName.value}",
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall
                            ?.copyWith(fontSize: 15.5),
                      ),
                      const Icon(Icons.arrow_drop_down)
                    ],
                  ),
                ),
                // Obx(() => AnimatedContainer(
                //       duration: const Duration(milliseconds: 300),
                //       child: homeController
                //                   .loadingForRecentTasksNetwork.value ||
                //               homeController
                //                   .loadingForRecentTasksNetworkError.value
                //           ? Row(
                //               children: [
                //                 Text(
                //                   homeController
                //                           .loadingForRecentTasksNetworkError
                //                           .value
                //                       ? 'syncing failed'
                //                       : 'syncing...',
                //                   style: Theme.of(context)
                //                       .textTheme
                //                       .displaySmall
                //                       ?.copyWith(
                //                         color: homeController
                //                                 .loadingForRecentTasksNetworkError
                //                                 .value
                //                             ? kred
                //                             : kneonDark,
                //                       ),
                //                 ),
                //                 TweenAnimationBuilder(
                //                   tween:
                //                       Tween<double>(begin: 0, end: 2 * math.pi),
                //                   duration: const Duration(seconds: 1),
                //                   builder: (context, double angle, child) {
                //                     return Transform.rotate(
                //                       angle: angle,
                //                       child: Icon(
                //                         Icons.sync,
                //                         color: homeController
                //                                 .loadingForRecentTasksNetworkError
                //                                 .value
                //                             ? kred
                //                             : kneonDark,
                //                         size: 15,
                //                       ),
                //                     );
                //                   },
                //                   onEnd: () {
                //                     // Repeat the animation
                //                     taskController.isSyncing.value
                //                         ? Future.delayed(Duration.zero, () {
                //                             (context as Element)
                //                                 .markNeedsBuild();
                //                           })
                //                         : null;
                //                   },
                //                 ),
                //               ],
                //             )
                //           : kempty,
                //     ))
              ],
            ),
          ),
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                if (internetConnectinController.isConnectedToInternet.value) {
                  GoRouter.of(context).pushNamed(Routes.taskTabNotification);
                  taskController.fetchReceivedRequests();
                } else {
                  showCustomToast(
                    message:
                        'You must be online to access the requests section. Please check your internet connection.',
                    backgroundColor: kred,
                  );
                }
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
                GoRouter.of(context).pushNamed(Routes.taskNotification);
                notificationController.viewed.value = false;
              },
              child: Obx(() => Stack(
                    children: [
                      Container(
                        width: 45.w,
                        height: 45.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: klightgrey),
                          color: Theme.of(context).colorScheme.onTertiary,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Badge(
                            isLabelVisible: notificationController.viewed.value,
                            child: const Center(
                              child: Icon(
                                Iconsax.notification,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                      // notificationController.viewed.value
                      //     ? Badge()
                      //     : const SizedBox()
                    ],
                  )),
            ),
            adjustWidth(3.w),
          ],
        )
      ],
    );
  }
}
