import 'dart:developer';

import 'package:bizkit/module/attendence/application/presentation/screens/attendence_selection/user/timesheet/widgets/late_login_card.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../../../utils/constants/colors.dart';
import '../../../../../../../../utils/constants/constant.dart';
import '../../../home/widgets/activity_container_widget.dart';

class AttendenceTimeSheetScreen extends StatefulWidget {
  const AttendenceTimeSheetScreen({super.key});

  @override
  State<AttendenceTimeSheetScreen> createState() =>
      _AttendenceTimeSheetScreenState();
}

class _AttendenceTimeSheetScreenState extends State<AttendenceTimeSheetScreen> {
  String? _selectedModeOfWork;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Timesheet',
          style: TextStyle(fontSize: 17),
        ),
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            Get.back(id: 22);
          },
          child: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(left: 18.0, right: 14.0, top: 24),
                child: Container(
                  width: 140.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                    color: lightColr,
                    border: Border.all(color: neonShade),
                    borderRadius: kBorderRadius5,
                  ),
                  child: DropdownButtonHideUnderline(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: DropdownButton<String>(
                        dropdownColor: klightDarkGrey,
                        isExpanded: true,
                        borderRadius: kBorderRadius5,
                        hint: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: Text(
                            _selectedModeOfWork ?? 'Today',
                            style: const TextStyle(
                              color: kwhite,
                              fontSize: 13,
                            ),
                          ),
                        ),
                        items: <String>[
                          'Today',
                          'Last week',
                          'Last month',
                          'Two month',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style:
                                  const TextStyle(color: kwhite, fontSize: 14),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            _selectedModeOfWork = value;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
              adjustHieght(10.h),
              EasyDateTimeLine(
                dayProps: EasyDayProps(
                  dayStructure: DayStructure.dayStrDayNum,
                  todayStyle: DayStyle(
                    decoration: BoxDecoration(
                      border: Border.all(color: kred),
                      borderRadius: kBorderRadius15,
                    ),
                    dayNumStyle: TextStyle(color: kwhite, fontSize: 14.sp),
                    dayStrStyle: TextStyle(color: kwhite, fontSize: 14.sp),
                  ),
                  todayHighlightColor: kwhite,
                  activeDayStyle: DayStyle(
                    dayStrStyle: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w300,
                        color: kblack),
                    dayNumStyle: TextStyle(
                        color: kblack,
                        fontSize: 19.sp,
                        fontWeight: FontWeight.bold),
                    decoration: BoxDecoration(
                      color: neonShade,
                      borderRadius: kBorderRadius15,
                      border: Border.all(color: neonShade),
                    ),
                  ),
                  inactiveDayStyle: DayStyle(
                    decoration: BoxDecoration(
                      color: lightColr,
                      borderRadius: kBorderRadius15,
                    ),
                    dayNumStyle: TextStyle(
                      color: kwhite,
                      fontSize: 19.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    dayStrStyle: TextStyle(
                      color: kwhite,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                timeLineProps: const EasyTimeLineProps(
                  vPadding: 20,
                  // hPadding: 10,
                ),
                headerProps: const EasyHeaderProps(
                  showSelectedDate: false,
                  showHeader: false,
                ),
                activeColor: neonShade,
                initialDate: DateTime.now(),
                onDateChange: (selectedDate) {
                  log(selectedDate.toString());
                },
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: Column(
                  children: [
                    AttendenceActivityContainerWidget(
                      color: lightColr,
                      icon: Icons.logout,
                      title: 'Clock-Out',
                      subTitle: '31 September 2023',
                      trailingStatus: 'On-time',
                      trailingTime: '16:30',
                      width: 350,
                      height: 72,
                    ),
                    adjustHieght(10.h),
                    AttendenceActivityContainerWidget(
                      color: lightColr,
                      icon: Icons.food_bank,
                      title: 'Lunch',
                      subTitle: '31 September 2023',
                      trailingStatus: 'On-time',
                      trailingTime: '2:30',
                      width: 350,
                      height: 72,
                    ),
                    adjustHieght(10.h),
                    AttendenceActivityContainerWidget(
                      color: lightColr,
                      icon: Icons.coffee,
                      title: 'Break',
                      subTitle: '1 September 2023',
                      trailingStatus: 'On-time',
                      trailingTime: '5:30',
                      width: 350,
                      height: 72,
                    ),
                    adjustHieght(10.h),
                    AttendenceActivityContainerWidget(
                      color: lightColr,
                      icon: Icons.logout,
                      title: 'Clock-In',
                      subTitle: '02 September 2023',
                      trailingStatus: 'Late',
                      trailingTime: '16:30',
                      width: 350,
                      height: 72,
                    ),
                    adjustHieght(10.h),
                    const LateLoginCard(
                      duration: 20,
                      reason: 'Traffic',
                      approvedBy: 'Joshua',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
