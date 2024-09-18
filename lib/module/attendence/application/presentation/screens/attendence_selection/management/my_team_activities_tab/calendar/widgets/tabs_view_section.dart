import 'package:bizkit/module/attendence/application/presentation/screens/attendence_selection/management/my_team_activities_tab/calendar/widgets/holiday_or_leave_card.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AttendenceMsCalendarTabsViewSection extends StatelessWidget {
  final TabController tabController;
  AttendenceMsCalendarTabsViewSection({super.key, required this.tabController});
  final TextEditingController datePicker = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        controller: tabController,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: lightColr, borderRadius: kBorderRadius20),
                  child: CalendarDatePicker(
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now()
                        .subtract(const Duration(days: 100 * 365)),
                    lastDate: 500 != 0
                        ? DateTime.now().add(
                            const Duration(days: 365 * 500),
                          )
                        : 100 == 0
                            ? DateTime.now().add(
                                const Duration(days: 365 * 100),
                              )
                            : DateTime.now(),
                    currentDate: DateTime.now(),
                    onDateChanged: (date) {},
                  ),
                ),
                adjustHieght(20.h),
                const HolidayOrLeaveCard(
                  borderClr: holidayBorderClr,
                  avatars: [],
                  date: '10th June',
                  names: 'Adam , Joshua',
                  title: 'Regional Holiday',
                ),
                adjustHieght(10.h),
                const HolidayOrLeaveCard(
                  borderClr: leaveBorderClr,
                  avatars: [],
                  date: '23rd June - 25th June',
                  names: 'Adam madam',
                  title: 'Leave',
                ),
                adjustHieght(10.h),
                const HolidayOrLeaveCard(
                  borderClr: holidayBorderClr,
                  avatars: [],
                  date: '2118 Thornridge Cir',
                  names: '3:30PM-5:00PM',
                  title: 'Columbus Day',
                ),
              ],
            ),
          ),
          ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                child: HolidayOrLeaveCard(
                  borderClr: holidayBorderClr,
                  avatars: [],
                  date: '10th June',
                  names: 'Adam , Joshua',
                  title: 'Regional Holiday',
                ),
              );
            },
          ),
          ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                child: HolidayOrLeaveCard(
                  borderClr: leaveBorderClr,
                  avatars: [],
                  date: '23rd June - 25th June',
                  names: 'Adam madam',
                  title: 'Leave',
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
