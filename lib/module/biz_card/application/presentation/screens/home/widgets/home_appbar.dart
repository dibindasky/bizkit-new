import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/biz_card/application/controller/notifications/bizcard_notification_controller.dart';
import 'package:bizkit/module/module_manager/application/controller/auth_controller.dart';
import 'package:bizkit/module/module_manager/application/presentation/screen/auth/account_switching/account_switching_sheet.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class HomeAppBarWidget extends StatelessWidget {
  const HomeAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthenticationController>();
    final notificationController = Get.find<BizcardNotificationController>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(
                  () => GestureDetector(
                    onTap: () => accountSwitchingBottomSheet(context),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Hello ${authController.userName.value} ",
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(fontSize: 16),
                        ),
                        const Icon(Icons.arrow_drop_down)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // GestureDetector(
          //   onTap: () {
          //     GoRouter.of(context).pushNamed(Routes.notificationPage);
          //     notificationController.viewed.value = false;
          //   },
          //   child: CircleAvatar(
          //     radius: kwidth * .050,
          //     backgroundColor: kblack,
          //     child: const Icon(
          //       Icons.notifications_none_rounded,
          //       color: kwhite,
          //     ),
          //   ),
          // ),
          GestureDetector(
            onTap: () {
              GoRouter.of(context).pushNamed(Routes.notificationPage);
              notificationController.viewed.value = false;
            },
            child: Container(
              width: 45.w,
              height: 45.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: klightgrey),
                color: Theme.of(context).colorScheme.onTertiary,
              ),
              child: Obx(() => Padding(
                    padding: const EdgeInsets.all(4),
                    child: Badge(
                      isLabelVisible: notificationController.viewed.value,
                      child: const Center(
                        child: Icon(
                          Iconsax.notification,
                          size: 20,
                        ),
                      ),
                    ),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
