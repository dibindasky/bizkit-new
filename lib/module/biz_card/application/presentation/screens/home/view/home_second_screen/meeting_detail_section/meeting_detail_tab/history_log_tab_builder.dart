import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MeetingDetailHistoryLogTabBuilder extends StatelessWidget {
  const MeetingDetailHistoryLogTabBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: ListView.builder(
        padding: const EdgeInsets.all(0),
        itemCount: 5,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.w),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: ColoredBox(
              color: smallBigGrey,
              child: Column(
                children: [
                  kHeight5,
                  Row(
                    children: [
                      kWidth5,
                      Image.asset(imageHistoryList[index % 4],
                          fit: BoxFit.cover, height: 15.w),
                      kWidth5,
                      Text('Date', style: textThinStyle1),
                    ],
                  ),
                  kHeight5,
                  Text(
                      'Scheduled onto discuss about. Scheduled onto discuss about.',
                      style: textThinStyle1),
                  kHeight10
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
