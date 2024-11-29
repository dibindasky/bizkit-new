import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/module_manager/application/controller/auth_controller.dart';
import 'package:bizkit/module/module_manager/application/presentation/screen/auth/account_switching/account_switching_sheet.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class HomeAppBarWidget extends StatelessWidget {
  const HomeAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthenticationController>();
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
                          "Hello ${authController.userName.value}",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const Icon(Icons.arrow_drop_down)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              GoRouter.of(context).push(Routes.notificationPage);
              // Navigator.of(context)
              //     .push(cardFadePageRoute(const ScreenCardNotification()));
            },
            child: CircleAvatar(
              radius: kwidth * .050,
              backgroundColor: kblack,
              child: const Icon(
                Icons.notifications_none_rounded,
                color: kwhite,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
