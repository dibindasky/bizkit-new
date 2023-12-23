import 'package:bizkit/core/const.dart';
import 'package:bizkit/fade_transition/fade_transition.dart';
import 'package:bizkit/feature/create_business_card.dart/view/screens/manuel_entries/card_creation_first.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StartingBusinessCardCreation extends StatelessWidget {
  const StartingBusinessCardCreation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: khieght * .8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  DottedBorder(
                    dashPattern: const [8, 8],
                    color: neonShade,
                    strokeWidth: 2.5,
                    child: SizedBox(
                      width: 290.dm,
                      height: 150.dm,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 32.dm,
                            height: 32.dm,
                            child: const CircleAvatar(
                              backgroundImage: AssetImage(
                                'asset/images/carbon_add-filled.png',
                              ),
                            ),
                          ),
                          Text(
                            'Scan Card',
                            style: TextStyle(fontSize: 10.sp),
                          ),
                        ],
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context).push(
                      fadePageRoute(ProfileScreen()),
                    ),
                    child: Text(
                      'Create Card manually',
                      style: TextStyle(
                        color: kwhite,
                        fontSize: 10.sp,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                border: Border.all(
                  color: neonShade,
                ),
              ),
              width: 123.dm,
              height: 45.dm,
              child: const Center(
                child: Text(
                  'Skip',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
