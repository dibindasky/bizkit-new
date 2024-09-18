import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HolidayOrLeaveCard extends StatelessWidget {
  final String title;
  final String names;
  final String date;
  final List<String> avatars;
  final Color borderClr;

  const HolidayOrLeaveCard({
    super.key,
    required this.title,
    required this.names,
    required this.date,
    required this.avatars,
    required this.borderClr,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320.w,
      height: 110.h,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: kBorderRadius10,
        color: lightColr,
        border: Border.all(
          color: borderClr,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: textHeadStyle1.copyWith(fontSize: 18),
          ),
          adjustHieght(7.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    names,
                    style: textThinStyle1.copyWith(
                      fontSize: 13,
                    ),
                  ),
                  adjustHieght(2.h),
                  Text(
                    date,
                    style: textThinStyle1.copyWith(
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 100.w,
                height: 40,
                child: const Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    CircleAvatar(
                      radius: 15,
                      backgroundColor: kblack,
                      backgroundImage: AssetImage(
                        dummyPersonImage,
                      ),
                    ),
                    Positioned(
                      right: 15,
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: kwhite,
                        backgroundImage: AssetImage(
                          personDemoImg,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
