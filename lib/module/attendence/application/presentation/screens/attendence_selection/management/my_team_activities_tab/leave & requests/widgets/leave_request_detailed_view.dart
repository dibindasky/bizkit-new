import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../../../utils/constants/colors.dart';
import 'appbar.dart';

class AttendenceMsLeaveRequestDetailedViewScreen extends StatelessWidget {
  const AttendenceMsLeaveRequestDetailedViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 17.0, right: 17.0, top: 24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AttendenceMsLeavesAppbar(title: 'Leaves Requests'),
                adjustHieght(20.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Leave Type',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    adjustHieght(10.h),
                    Container(
                      width: 320.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                        color: klightDarkGrey,
                        borderRadius: kBorderRadius5,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text('Sick Leave'),
                      ),
                    ),
                  ],
                ),
                adjustHieght(20.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Date',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    adjustHieght(10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 140.w,
                          height: 50.h,
                          decoration: BoxDecoration(
                            color: klightDarkGrey,
                            borderRadius: kBorderRadius5,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('From :'),
                                adjustHieght(4.h),
                                const Text('14-06-24'),
                              ],
                            ),
                          ),
                        ),
                        adjustWidth(10.w),
                        Container(
                          width: 140.w,
                          height: 50.h,
                          decoration: BoxDecoration(
                            color: klightDarkGrey,
                            borderRadius: kBorderRadius5,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('To :'),
                                adjustHieght(4.h),
                                const Text('17-06-24'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    adjustHieght(20.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Reason',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        adjustHieght(10.h),
                        Container(
                          width: 320.w,
                          height: 90.h,
                          decoration: BoxDecoration(
                            color: klightDarkGrey,
                            borderRadius: kBorderRadius5,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Text('Getting Operated for sinusitis.'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                adjustHieght(20.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Attachments :'),
                    adjustHieght(10.h),
                    Row(
                      children: [
                        Container(
                          width: 75.w,
                          height: 79.h,
                          decoration: BoxDecoration(
                            borderRadius: kBorderRadius5,
                            color: klightDarkGrey,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                attendenceSolidPdfImg,
                                width: 35.w,
                                height: 35.h,
                              ),
                              adjustWidth(5.h),
                              const Text(
                                textAlign: TextAlign.center,
                                'Medical position.pdf',
                                style: TextStyle(fontSize: 9),
                              )
                            ],
                          ),
                        ),
                        adjustWidth(10.h),
                        Container(
                          width: 75.w,
                          height: 79.h,
                          decoration: BoxDecoration(
                            color: klightDarkGrey,
                            borderRadius: kBorderRadius5,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                attendenceMedicalBillImg,
                                width: 45.w,
                                height: 45.h,
                              ),
                              adjustWidth(5.h),
                              const Text(
                                maxLines: 2,
                                softWrap: true,
                                textAlign: TextAlign.center,
                                'Medical bill.JPG',
                                style: TextStyle(fontSize: 10),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                adjustHieght(35.h),
                const Text(
                  'Leave History',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
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
