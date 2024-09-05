import 'package:bizkit/core/routes/fade_transition/fade_transition.dart';
import 'package:bizkit/module/biz_card/application/controller/card/create_controller.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/home/view/home_first_screen/home_first_screen.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/notifications/notification_screen.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/qr_screen/qr_lists.dart';
import 'package:bizkit/module/biz_card/application/presentation/widgets/show_case_view.dart';
import 'package:bizkit/module/module_manager/application/controller/auth_controller.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeFirstAppBar extends StatefulWidget {
  const HomeFirstAppBar({
    super.key,
  });

  @override
  State<HomeFirstAppBar> createState() => _HomeFirstAppBarState();
}

class _HomeFirstAppBarState extends State<HomeFirstAppBar> {
  bool isOPen = false;

  @override
  void initState() {
    // context
    //     .read<ProfileBloc>()
    //     .add(const ProfileEvent.getProfile(isLoad: true));
    super.initState();
  }

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
                  () => Text(
                    "Welcome ${authController.userName.value}",
                    style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.bold,
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
            // child: CustomShowCaseView(
            //   image: personImage,
            //   globalKey: globalKeynotificationIcon,
            //   tittle: 'See notification',
            //   description: '',
            //   child: CircleAvatar(
            //     radius: kwidth * .060,
            //     backgroundColor: textFieldFillColr,
            //     backgroundImage: const AssetImage(
            //       iconNotification,
            //     ),
            //   ),
            // ),
            child: CircleAvatar(
              radius: kwidth * .060,
              backgroundColor: textFieldFillColr,
              backgroundImage: const AssetImage(
                iconNotification,
              ),
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              cardController.getAllcards(true);
              Navigator.push(
                context,
                cardFadePageRoute(
                  const ScreenCardSharing(),
                ),
              );
            },
            // child: CustomShowCaseView(
            //   image: personImage,
            //   globalKey: globalKeylevelSharingIcon,
            //   tittle: 'Share your card using QR code',
            //   description: '',
            //   child: CircleAvatar(
            //     radius: kwidth * 0.060,
            //     backgroundColor: textFieldFillColr,
            //     child: Padding(
            //       padding: const EdgeInsets.all(10.0),
            //       child: Image.asset(iconBizkitPng),
            //     ),
            //   ),
            // ),
            child: CircleAvatar(
              radius: kwidth * 0.060,
              backgroundColor: textFieldFillColr,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(iconBizkitPng),
              ),
            ),
          )
        ],
      ),
    );
  }
}
