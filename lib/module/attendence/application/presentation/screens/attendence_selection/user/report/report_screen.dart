import 'package:bizkit/module/attendence/application/presentation/screens/attendence_selection/user/report/widgets/report_appbar.dart';
import 'package:bizkit/module/attendence/application/presentation/screens/attendence_selection/user/report/widgets/report_card.dart';
import 'package:bizkit/module/attendence/application/presentation/screens/attendence_selection/user/report/widgets/report_searchbar.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../../../core/routes/routes.dart';

class AttendenceReportScreen extends StatelessWidget {
  const AttendenceReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 14.0, right: 14.0, top: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AttendenceReportAppbar(
                title: 'Report',
              ),
              adjustHieght(20.h),
              const AttendenceReportSearchbar(),
              adjustHieght(25.h),
              const Padding(
                padding: EdgeInsets.only(left: 14, bottom: 20),
                child: Text(
                  'Raise new report',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              adjustWidth(20.h),
              Padding(
                padding: const EdgeInsets.only(left: 14),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.attendenceCreateNewReport, id: 22);
                        },
                        child: ReportCard(
                          title1: '',
                          color: Colors.grey[850]!,
                          title2: 'New Report',
                          icon: null,
                          textColor: kwhite,
                        ),
                      ),
                      adjustWidth(10.w),
                      ReportCard(
                        color: Colors.green[50]!,
                        title1: 'Questions about',
                        title2: 'How to Invest',
                        icon: Icons.settings,
                        iconColor: kgreen,
                        textColor: kblack,
                      ),
                      adjustWidth(10.w),
                      ReportCard(
                        textColor: kblack,
                        color: Colors.red[50]!,
                        title2: 'Payments',
                        title1: 'Questions about',
                        icon: Icons.payment,
                        iconColor: Colors.red,
                      ),
                      adjustWidth(10.w),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 14, bottom: 20, top: 30),
                child: Text(
                  'Report History',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              adjustHieght(5.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  width: 320.w,
                  height: 84.h,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: kwhite,
                      ),
                      borderRadius: kBorderRadius10),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Lorem Ipsum has been the industry's standard dummy text?",
                          style: TextStyle(
                            fontSize: 14,
                            color: neonShade,
                          ),
                        ),
                        adjustHieght(3.h),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '22-06-24 ',
                              style: TextStyle(
                                  color: kwhite,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Resolved',
                              style: TextStyle(
                                color: neonShade,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              adjustHieght(10.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  width: 320.w,
                  height: 84.h,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: kwhite,
                      ),
                      borderRadius: kBorderRadius10),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Lorem Ipsum has been the industry's standard dummy text?",
                          style: TextStyle(
                            fontSize: 14,
                            color: neonShade,
                          ),
                        ),
                        adjustHieght(3.h),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '22-06-24 ',
                              style: TextStyle(
                                  color: kwhite,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Resolved',
                              style: TextStyle(
                                color: neonShade,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              adjustHieght(10.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  width: 320.w,
                  height: 84.h,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: kwhite,
                      ),
                      borderRadius: kBorderRadius10),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Lorem Ipsum has been the industry's standard dummy text?",
                          style: TextStyle(
                            fontSize: 14,
                            color: neonShade,
                          ),
                        ),
                        adjustHieght(3.h),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '22-06-24 ',
                              style: TextStyle(
                                  color: kwhite,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Resolved',
                              style: TextStyle(
                                color: neonShade,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
