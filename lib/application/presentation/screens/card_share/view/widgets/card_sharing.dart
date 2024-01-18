import 'package:bizkit/application/commen/const.dart';
import 'package:bizkit/application/fade_transition/fade_transition.dart';
import 'package:bizkit/application/presentation/screens/authentication/view/widgets/auth_button.dart';
import 'package:bizkit/application/presentation/card_share/view/widgets/level_sharing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CardSharingScreen extends StatelessWidget {
  const CardSharingScreen({super.key});
  final String image =
      'https://www.online-qrcode-generator.com/QR-Code/qrcode-generator.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 18,
            color: kwhite,
          ),
        ),
        backgroundColor: knill,
        title: Text(
          'QR Code',
          style: appBarHeading1,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            adjustHieght(khieght * .06),
            SizedBox(
              width: 199.dm,
              height: 200.dm,
              child: Image.network(
                image,
                fit: BoxFit.cover,
              ),
            ),
            adjustHieght(khieght * .09),
            GestureDetector(
              onTap: () => Navigator.of(context).push(
                fadePageRoute(const LevelSharing()),
              ),
              child: Container(
                padding: const EdgeInsets.only(left: 15, right: 10),
                height: 57.dm,
                width: 300.dm,
                decoration: BoxDecoration(border: Border.all(color: kwhite)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Level Sharing',
                          style: TextStyle(
                            fontSize: kwidth * 0.037,
                          ),
                        ),
                        Text(
                          'Professional, Emergency, Company',
                          style: TextStyle(
                            fontSize: kwidth * 0.027,
                          ),
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.keyboard_arrow_up_rounded,
                      color: kwhite,
                      size: 30,
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            AuthButton(
              text: 'Share',
              onTap: () {},
              wdth: 110,
            ),
            adjustHieght(khieght * .04),
          ],
        ),
      ),
    );
  }
}
