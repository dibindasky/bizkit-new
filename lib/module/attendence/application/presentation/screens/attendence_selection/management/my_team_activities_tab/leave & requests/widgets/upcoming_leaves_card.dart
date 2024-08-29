import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../../../../../core/routes/routes.dart';
import '../../../../../../../../../../utils/constants/colors.dart';
import '../../../../../../../../../../utils/constants/contants.dart';

class UpcomingLeavesCard extends StatelessWidget {
  final String imageUrl;
  final String employeeName;
  final String date;
  final String reason;
  final String appliedDays;
  final String leaveBalance;
  final String lastLeave;

  const UpcomingLeavesCard({
    super.key,
    required this.imageUrl,
    required this.employeeName,
    required this.date,
    required this.reason,
    required this.appliedDays,
    required this.leaveBalance,
    required this.lastLeave,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.attendenceMsLeaveRequestDetailedView, id: 22);
      },
      child: Container(
        width: 320.w,
        height: 185.h,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
        decoration: BoxDecoration(
          color: klightGreyClr,
          borderRadius: kBorderRadius15,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 23,
                    backgroundColor: klightGreyClr,
                    backgroundImage: AssetImage(
                      imageUrl,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          employeeName,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        adjustHieght(3.h),
                        Text(
                          date,
                          style: const TextStyle(
                            fontSize: 11,
                          ),
                        ),
                        adjustHieght(1.h),
                        Text(
                          reason,
                          style: const TextStyle(
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Divider(
                color: kgrey,
                height: 1,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Applied Days',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    adjustHieght(6.h),
                    Text(
                      '$appliedDays Days',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Leave Balance',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    adjustHieght(6.h),
                    Text(
                      '$leaveBalance Days',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Last Leave',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    adjustHieght(6.h),
                    Text(
                      lastLeave,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            adjustHieght(12.h),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 135.w,
                      height: 36.h,
                      decoration: BoxDecoration(
                        border: Border.all(color: neonShade),
                        borderRadius: kBorderRadius5,
                      ),
                      child: const Center(
                        child: Text(
                          'Decline',
                          style: TextStyle(color: neonShade),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 135.w,
                      height: 36.h,
                      decoration: BoxDecoration(
                          color: neonShade, borderRadius: kBorderRadius5),
                      child: const Center(
                        child: Text(
                          'Approve',
                          style: TextStyle(color: kblack),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
