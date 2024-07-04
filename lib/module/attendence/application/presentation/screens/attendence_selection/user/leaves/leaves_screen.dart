import 'package:bizkit/module/attendence/application/presentation/screens/attendence_selection/user/leaves/widgets/leaves_appbar.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../utils/constants/colors.dart';
import 'widgets/leaves_status_grid_view.dart';

class AttendenceLeavesScreeen extends StatelessWidget {
  const AttendenceLeavesScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 14.0, right: 14.0, top: 24),
            child: Column(
              children: [
                const AttendenceLeavesAppbar(),
                adjustHieght(15.h),
                const AttendenceLeavesGridView(
                  subtitles: leavesGridSubTitles,
                  titles: leavesGridTitles,
                ),
                adjustHieght(20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 163.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        borderRadius: kBorderRadius10,
                        color: klightGreyClr,
                      ),
                      child: const Center(
                        child: Text(
                          'Upcoming',
                          style: TextStyle(color: neonShade),
                        ),
                      ),
                    ),
                    Container(
                      width: 165.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        borderRadius: kBorderRadius10,
                      ),
                      child: const Center(
                        child: Text('Past'),
                      ),
                    ),
                  ],
                ),
                adjustHieght(20.h),
                Container(
                  width: 390.w,
                  height: 130.h,
                  decoration: BoxDecoration(
                    borderRadius: kBorderRadius10,
                    color: klightGreyClr,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Date'),
                              Text(
                                'Approved',
                                style: TextStyle(color: kgreen),
                              ),
                            ],
                          ),
                          adjustHieght(10.h),
                          const Text(
                            '06 Dec 2023 - 09 Dec 2023',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          adjustHieght(7.h),
                          const Padding(
                            padding: EdgeInsets.only(right: 45),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Apply Days',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 13,
                                  ),
                                ),
                                Text(
                                  'Approved by',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          adjustHieght(7.h),
                          const Padding(
                            padding: EdgeInsets.only(right: 45),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '3 Days',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Arun',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                adjustHieght(15.h),
                Container(
                  width: 390.w,
                  height: 130.h,
                  decoration: BoxDecoration(
                    borderRadius: kBorderRadius10,
                    color: klightGreyClr,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Date'),
                              Text(
                                'Pendings',
                                style: TextStyle(color: kyellow),
                              ),
                            ],
                          ),
                          adjustHieght(10.h),
                          const Text(
                            '06 Dec 2023 - 09 Dec 2023',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          adjustHieght(7.h),
                          const Padding(
                            padding: EdgeInsets.only(right: 45),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Apply Days',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 13,
                                  ),
                                ),
                                Text(
                                  'Approved by',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          adjustHieght(7.h),
                          const Padding(
                            padding: EdgeInsets.only(right: 45),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '3 Days',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Arun',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                adjustHieght(15.h),
                Container(
                  width: 390.w,
                  height: 130.h,
                  decoration: BoxDecoration(
                    borderRadius: kBorderRadius10,
                    color: klightGreyClr,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Date'),
                              Text(
                                'Pendings',
                                style: TextStyle(color: kyellow),
                              ),
                            ],
                          ),
                          adjustHieght(10.h),
                          const Text(
                            '06 Dec 2023 - 09 Dec 2023',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          adjustHieght(7.h),
                          const Padding(
                            padding: EdgeInsets.only(right: 45),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Apply Days',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 13,
                                  ),
                                ),
                                Text(
                                  'Approved by',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          adjustHieght(7.h),
                          const Padding(
                            padding: EdgeInsets.only(right: 45),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '3 Days',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Arun',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                adjustHieght(15.h),
                Container(
                  width: 390.w,
                  height: 130.h,
                  decoration: BoxDecoration(
                    borderRadius: kBorderRadius10,
                    color: klightGreyClr,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Date'),
                              Text(
                                'Pendings',
                                style: TextStyle(color: kyellow),
                              ),
                            ],
                          ),
                          adjustHieght(10.h),
                          const Text(
                            '06 Dec 2023 - 09 Dec 2023',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          adjustHieght(7.h),
                          const Padding(
                            padding: EdgeInsets.only(right: 45),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Apply Days',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 13,
                                  ),
                                ),
                                Text(
                                  'Approved by',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          adjustHieght(7.h),
                          const Padding(
                            padding: EdgeInsets.only(right: 45),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '3 Days',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Arun',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
