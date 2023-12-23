import 'dart:io';
import 'package:bizkit/core/const.dart';
import 'package:bizkit/fade_transition/fade_transition.dart';
import 'package:bizkit/feature/authentication/view/widgets/auth_button.dart';
import 'package:bizkit/feature/card_share/view/widgets/level_sharing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CardSharingScreen extends StatelessWidget {
  CardSharingScreen({super.key, required this.image});
  File? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 17,
            color: kwhite,
          ),
        ),
        backgroundColor: Colors.transparent,
        title: Text(
          'QR Code',
          style: TextStyle(color: kwhite, fontSize: 16.sp),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            adjustHieght(khieght * .06),
            SizedBox(
              width: 199.dm,
              height: 200.dm,
              child: Image.file(
                image!,
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
                        const Hero(
                          transitionOnUserGestures: true,
                          tag: 'Level Sharing',
                          child: Text('Level Sharing'),
                        ),
                        Text(
                          'Professional, Emergency, Company',
                          style: TextStyle(fontSize: 10.sp),
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
