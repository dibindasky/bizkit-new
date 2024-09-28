import 'package:bizkit/module/attendence/application/presentation/screens/attendence_selection/management/my_team_activities_tab/team_timesheet/widgets/attendance_record_item.dart';
import 'package:bizkit/module/attendence/application/presentation/screens/attendence_selection/management/my_team_activities_tab/team_timesheet/widgets/employee_statsbar_widget.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EmployeeAttendanceCard extends StatefulWidget {
  final Map<String, dynamic>? arguments;

  const EmployeeAttendanceCard({super.key, this.arguments});

  @override
  State<EmployeeAttendanceCard> createState() => _EmployeeAttendanceCardState();
}

class _EmployeeAttendanceCardState extends State<EmployeeAttendanceCard> {
  String? _selectedModeOfWork = 'Last month';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 17.0, right: 17.0, top: 24),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            padding: const EdgeInsets.symmetric(horizontal: 6),
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
                  const CircleAvatar(
                    radius: 20,
                    backgroundColor: lightColr,
                    child: Icon(
                      Icons.filter_alt,
                      color: neonShade,
                    ),
                  )
                ],
              ),
              adjustHieght(20.h),
              const EmployeeStatsBar(),
              adjustHieght(25.h),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Location',
                            style: textThinStyle1.copyWith(color: neonShade),
                          ),
                          Text(
                            'Checkin',
                            style: textThinStyle1.copyWith(color: neonShade),
                          ),
                          Text(
                            'Checkout',
                            style: textThinStyle1.copyWith(color: neonShade),
                          ),
                          Text(
                            'Total Hours',
                            style: textThinStyle1.copyWith(color: neonShade),
                          ),
                        ],
                      ),
                      adjustHieght(9.h),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return const AttendanceRecordItem(
                                date: '31 June 2024',
                                location: 'Office',
                                checkIn: '09:30',
                                checkOut: '16:30',
                                totalHours: '22:30',
                              );
                            },
                            separatorBuilder: (context, index) => kHeight10,
                            itemCount: 10),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
