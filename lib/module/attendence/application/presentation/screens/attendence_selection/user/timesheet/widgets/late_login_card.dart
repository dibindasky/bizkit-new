import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LateLoginCard extends StatelessWidget {
  final int duration;
  final String reason;
  final String approvedBy;

  const LateLoginCard({
    Key? key,
    required this.duration,
    required this.reason,
    required this.approvedBy,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: lightColr,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Date',
                  style: textThinStyle1,
                ),
                Text('Approved', style: textThinStyle1.copyWith(color: kgreen)),
              ],
            ),
            adjustHieght(8),
            Text('Late Login by $duration Mins',
                style: const TextStyle(fontWeight: FontWeight.bold)),
            adjustHieght(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Reason',
                      style: textThinStyle1.copyWith(fontSize: 12.sp),
                    ),
                    adjustHieght(4),
                    Text(
                      reason,
                      style:
                          textThinStyle1.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Approved By',
                      style: textThinStyle1.copyWith(fontSize: 12.sp),
                    ),
                    adjustHieght(4),
                    Text(
                      approvedBy,
                      style:
                          textThinStyle1.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
