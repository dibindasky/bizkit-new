import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/event_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AttendencePeltAndPellCard extends StatelessWidget {
  const AttendencePeltAndPellCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 361.w,
      height: 250.h,
      decoration: BoxDecoration(
        color: klightDarkGrey,
        borderRadius: kBorderRadius20,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text('Your PELT will be changed in 2 days.'),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: CircleAvatar(
                    radius: 36,
                    backgroundImage: AssetImage(
                      demoPerosnImgPeltandpell,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 13),
                      child: Text(
                        'Olivia Williams',
                        style: textStyle1.copyWith(
                            color: neonShade,
                            fontWeight: FontWeight.bold,
                            fontSize: 19),
                      ),
                    ),
                    Container(
                      width: 128.w,
                      height: 29.h,
                      decoration: BoxDecoration(
                          color: kgrey, borderRadius: kBorderRadius25),
                      child: Center(
                        child: Text(
                          'UXUI Designer',
                          style: textThinStyle1.copyWith(
                              color: kblack,
                              fontWeight: FontWeight.w500,
                              fontSize: 13),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 70, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'LOCATION',
                        style: textThinStyle1.copyWith(
                            color: neonShade,
                            fontWeight: FontWeight.w500,
                            fontSize: 13),
                      ),
                      Text(
                        'Bangalore',
                        style: textThinStyle1.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'LOGIN TIME',
                        style: textThinStyle1.copyWith(
                            color: neonShade,
                            fontWeight: FontWeight.w500,
                            fontSize: 13),
                      ),
                      Text(
                        '9:00 to 6:00',
                        style: textThinStyle1.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                EventButton(
                  color: const LinearGradient(
                    colors: [
                      Color.fromRGBO(6, 199, 172, 1),
                      Color.fromRGBO(6, 199, 172, 1),
                    ],
                  ),
                  textColr: kblack,
                  text: 'Change PELT / PELL',
                  onTap: () {},
                ),
                EventButton(
                  color: const LinearGradient(
                    colors: [neonShade, neonShade],
                  ),
                  textColr: kblack,
                  text: 'Request change',
                  onTap: () {
                    Get.toNamed(Routes.attendencePeltAndPellRequestChange,
                        id: 22);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
