import 'package:bizkit/module/attendence/application/presentation/screens/attendence_selection/user/report/widgets/report_history_appbar.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AttendenceReportHistoryScreen extends StatelessWidget {
  const AttendenceReportHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 14.0, right: 14.0, top: 24),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const AttendenceReportHistoryAppBar(
                  title: 'Report History',
                ),
                adjustHieght(10.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(
                        bottom: 10,
                      ),
                      child: CircleAvatar(
                        radius: 17,
                        backgroundImage: AssetImage(chatSectionPersonDummyImg1),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 240.w,
                          height: 90.h,
                          decoration: const BoxDecoration(
                            color: klightGrey,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(24),
                                topLeft: Radius.circular(24),
                                bottomRight: Radius.circular(24),
                                bottomLeft: Radius.circular(4)),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 16),
                            child: Text(
                              'Hi Kitsbase, Let me know you need help and you can ask us any questions.',
                              style: TextStyle(
                                color: kblack,
                                fontSize: 13,
                                height: 1.6,
                              ),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                            '08:20 AM',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              color: kgrey,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                adjustHieght(35.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 200.w,
                        height: 70.h,
                        decoration: const BoxDecoration(
                          color: klightred,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(24),
                              topLeft: Radius.circular(24),
                              bottomRight: Radius.circular(4),
                              bottomLeft: Radius.circular(24)),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 16),
                          child: Center(
                            child: Text(
                              'How to create a FinX Stock account?',
                              style: TextStyle(
                                color: kred,
                                fontSize: 13,
                                height: 1.7,
                                fontWeight: FontWeight.w200,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          '08:25 AM',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            color: kgrey,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                adjustHieght(35.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(
                        bottom: 10,
                      ),
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: 19,
                            backgroundImage:
                                AssetImage(userProfileDummy),
                          ),
                          Positioned(
                            bottom: 2,
                            right: 0,
                            child: CircleAvatar(
                              radius: 8,
                              backgroundImage: AssetImage(dummyImg3),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 240.w,
                          height: 140.h,
                          decoration: const BoxDecoration(
                            color: klightGrey,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(24),
                                topLeft: Radius.circular(24),
                                bottomRight: Radius.circular(24),
                                bottomLeft: Radius.circular(4)),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 16),
                            child: Text(
                              'Open the FinX Stock app to get started and follow the steps. FinX Stock doesn’t charge a fee to create or maintain your FinX Stock account.',
                              style: TextStyle(
                                color: kblack,
                                fontSize: 13,
                                height: 1.7,
                              ),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                            '08:29 AM',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              color: kgrey,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                adjustHieght(35.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(
                        bottom: 10,
                      ),
                      child: CircleAvatar(
                        radius: 17,
                        backgroundImage: AssetImage(chatSectionPersonDummyImg1),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 240.w,
                          height: 90.h,
                          decoration: const BoxDecoration(
                            color: klightGrey,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(24),
                                topLeft: Radius.circular(24),
                                bottomRight: Radius.circular(24),
                                bottomLeft: Radius.circular(4)),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 16),
                            child: Text(
                              'Hi Kitsbase, Let me know you need help and you can ask us any questions.',
                              style: TextStyle(
                                color: kblack,
                                fontSize: 13,
                                height: 1.6,
                              ),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                            '08:20 AM',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              color: kgrey,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                adjustHieght(35.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 200.w,
                        height: 70.h,
                        decoration: const BoxDecoration(
                          color: klightred,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(24),
                              topLeft: Radius.circular(24),
                              bottomRight: Radius.circular(4),
                              bottomLeft: Radius.circular(24)),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 16),
                          child: Center(
                            child: Text(
                              'How to create a FinX Stock account?',
                              style: TextStyle(
                                color: kred,
                                fontSize: 13,
                                height: 1.7,
                                fontWeight: FontWeight.w200,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          '08:25 AM',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            color: kgrey,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                adjustHieght(35.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(
                        bottom: 10,
                      ),
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: 19,
                            backgroundImage:
                                AssetImage(userProfileDummy),
                          ),
                          Positioned(
                            bottom: 2,
                            right: 0,
                            child: CircleAvatar(
                              radius: 8,
                              backgroundImage: AssetImage(dummyImg3),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 240.w,
                          height: 140.h,
                          decoration: const BoxDecoration(
                            color: klightGrey,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(24),
                                topLeft: Radius.circular(24),
                                bottomRight: Radius.circular(24),
                                bottomLeft: Radius.circular(4)),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 16),
                            child: Text(
                              'Open the FinX Stock app to get started and follow the steps. FinX Stock doesn’t charge a fee to create or maintain your FinX Stock account.',
                              style: TextStyle(
                                color: kblack,
                                fontSize: 13,
                                height: 1.7,
                              ),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                            '08:29 AM',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              color: kgrey,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                adjustHieght(35.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 120.w,
                      height: 2.h,
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            // width: 2,
                            color: kgrey,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        gradient: neonShadeLinearGradient,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const Text(
                      'Resolved',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: neonShade),
                    ),
                    Container(
                      width: 120.w,
                      height: 2.h,
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: kgrey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                adjustHieght(35.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
