import 'package:bizkit/module/attendence/application/presentation/screens/attendence_selection/user/timesheet/widgets/late_login_card.dart';
import 'package:bizkit/module/attendence/application/presentation/screens/home/widgets/activity_container_widget.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EmployeeAttendanceTodayCard extends StatefulWidget {
  final Map<String, dynamic>? arguments;

  const EmployeeAttendanceTodayCard({super.key, this.arguments});

  @override
  State<EmployeeAttendanceTodayCard> createState() =>
      _EmployeeAttendanceTodayCardState();
}

class _EmployeeAttendanceTodayCardState
    extends State<EmployeeAttendanceTodayCard> {
  String? _selectedModeOfWork = 'Today';

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.back(id: 22);
                          },
                          icon: const Icon(Icons.arrow_back_ios),
                        ),
                        Text(
                          widget.arguments?['employeeName'],
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
                adjustHieght(10.h),
                Row(
                  children: [
                    Container(
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 6),
                              child: Text(
                                _selectedModeOfWork ?? 'Today',
                                style: textThinStyle1.copyWith(color: kwhite),
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
                                  style: textThinStyle1.copyWith(color: kwhite),
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
                  ],
                ),
                adjustHieght(6.h),
                EasyDateTimeLine(
                  dayProps: EasyDayProps(
                    dayStructure: DayStructure.dayStrDayNum,
                    todayStyle: DayStyle(
                      decoration: BoxDecoration(
                        color: lightColr,
                        border: Border.all(color: neonShade),
                        borderRadius: kBorderRadius15,
                      ),
                      dayNumStyle: textThinStyle1.copyWith(
                          color: kwhite, fontSize: 12.sp),
                      dayStrStyle: textThinStyle1.copyWith(
                          color: kwhite, fontSize: 12.sp),
                    ),
                    todayHighlightColor: kwhite,
                    activeDayStyle: DayStyle(
                      dayNumStyle: textThinStyle1.copyWith(
                          color: kblack,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold),
                      dayStrStyle: textThinStyle1.copyWith(
                          color: kblack, fontSize: 12.sp),
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
                      dayNumStyle: textThinStyle1.copyWith(
                          color: kwhite, fontWeight: FontWeight.bold),
                      dayStrStyle: textThinStyle1.copyWith(
                          color: kwhite, fontSize: 12.sp),
                    ),
                  ),
                  timeLineProps: const EasyTimeLineProps(
                    vPadding: 22,
                  ),
                  headerProps: const EasyHeaderProps(
                    showSelectedDate: false,
                    showHeader: false,
                  ),
                  activeColor: neonShade,
                  initialDate: DateTime.now(),
                  onDateChange: (selectedDate) {
                    // log(selectedDate.toString());
                  },
                ),
                SizedBox(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5.0, vertical: 10),
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
                          adjustHieght(10.h),
                          const LateLoginCard(
                            duration: 20,
                            reason: 'Traffic',
                            approvedBy: 'Joshua',
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
