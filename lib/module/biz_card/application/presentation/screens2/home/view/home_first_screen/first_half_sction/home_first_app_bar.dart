import 'package:bizkit/core/routes/fade_transition/fade_transition.dart';
import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/biz_card/application/controller/card/create_controller.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_notifications/card_notifications.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens2/notifications/notification_screen.dart';
import 'package:bizkit/module/module_manager/application/controller/auth_controller.dart';
import 'package:bizkit/module/module_manager/application/presentation/screen/auth/account_switching/account_switching_sheet.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class HomeFirstAppBar extends StatefulWidget {
  const HomeFirstAppBar({super.key});

  @override
  State<HomeFirstAppBar> createState() => _HomeFirstAppBarState();
}

class _HomeFirstAppBarState extends State<HomeFirstAppBar> {
  bool isOPen = false;

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthenticationController>();
    final cardController = Get.find<CardController>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
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
                          "Welcome ${authController.userName.value}",
                          style: TextStyle(
                            fontSize: 17.sp,
                            fontWeight: FontWeight.bold,
                          ),
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
              Navigator.of(context)
                  .push(cardFadePageRoute(const ScreenCardNotification()));
            },
            child: CircleAvatar(
              radius: kwidth * .060,
              backgroundColor: textFieldFillColr,
              backgroundImage: const AssetImage(
                iconNotification,
              ),
            ),
          ),
          kWidth10,
          GestureDetector(
            onTap: () {
              cardController.getAllcards(true);
              // GoRouter.of(context).pushNamed(Routes.cardQrCode);
            },
            child: CircleAvatar(
              radius: kwidth * 0.060,
              backgroundColor: textFieldFillColr,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(iconBizkitPng),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
