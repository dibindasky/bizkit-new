import 'package:bizkit/application/presentation/fade_transition/fade_transition.dart';
import 'package:bizkit/application/presentation/screens/card_share/view/widgets/card_sharing.dart';
import 'package:bizkit/application/presentation/screens/home/view/home_first_screen/first_half_sction/notifications/notification_screen.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/constants/contants.dart';
import 'package:flutter/material.dart';

class HomeFirstAppBar extends StatefulWidget {
  const HomeFirstAppBar({
    super.key,
  });

  @override
  State<HomeFirstAppBar> createState() => _HomeFirstAppBarState();
}

class _HomeFirstAppBarState extends State<HomeFirstAppBar> {
  bool isOPen = false;

  Future<void> noti() async {
    setState(() {
      if (isOPen) {
        notificationScreen.value = 0;
        notificationScreen.notifyListeners();
        isOPen = !isOPen;
      } else {
        notificationScreen.value = 1;
        notificationScreen.notifyListeners();
        isOPen = !isOPen;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Text('Hello,\nJoi',
              style: custumText(
                  fontSize: kwidth * 0.05, fontWeight: FontWeight.w700)),
          const Spacer(),
          GestureDetector(
            onTap: () async {
              await noti();
            },
            child: CircleAvatar(
                radius: kwidth * .060,
                backgroundColor: textFieldFillColr,
                backgroundImage: const AssetImage(iconNotification)),
          ),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              fadePageRoute(
                const CardSharingScreen(),
              ),
            ),
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
