import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/event_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'leave_success_dialog.dart';

class CalendarBottomSheet extends StatelessWidget {
  const CalendarBottomSheet({
    super.key,
    required this.datePicker,
    required this.onPressed,
    this.initialDate,
    this.year = 0,
    this.last = 0,
  });

  final TextEditingController datePicker;
  final void Function(String) onPressed;
  final int year;
  final int last;
  final DateTime? initialDate;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: khieght * 0.7,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Set the dates',
                    style: TextStyle(fontSize: 16),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.close,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
            adjustHieght(15),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 20),
              child: Container(
                width: 310.w,
                height: 90.h,
                decoration: BoxDecoration(
                  color: kblack,
                  borderRadius: kBorderRadius5,
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: Text(
                    'Please note that you can only select an overtime duration of up to 3 consecutive days.',
                    style: TextStyle(
                      fontSize: 14,
                      color: neonShade,
                    ),
                  ),
                ),
              ),
            ),
            adjustHieght(20),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 20),
              child: Column(
                children: [
                  Stack(
                    children: [
                      CalendarDatePicker(
                        initialCalendarMode: DatePickerMode.day,
                        initialDate: initialDate,
                        firstDate:
                            DateTime.now().subtract(Duration(days: year * 365)),
                        lastDate: last != 0
                            ? DateTime.now().add(
                                Duration(days: 365 * last),
                              )
                            : year == 0
                                ? DateTime.now().add(
                                    const Duration(days: 365 * 100),
                                  )
                                : DateTime.now(),
                        onDateChanged: (date) {
                          int year = date.year;
                          String month = date.month.toString().length == 1
                              ? '0${date.month}'
                              : date.month.toString();
                          String day = date.day.toString().length == 1
                              ? '0${date.day}'
                              : date.day.toString();
                          onPressed('$year-$month-$day');
                        },
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 15, right: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Start',
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                            Text(
                              'End',
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '15 Dec 2023',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              'Choose Date',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  adjustHieght(20),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 20),
                    child: EventButton(
                      text: 'Apply Leave',
                      textColr: kblack,
                      onTap: () {
                        Navigator.of(context).pop();
                        showLeaveSuccessDialog(context: context);
                      },
                      wdth: 320.w,
                      color: const LinearGradient(
                        colors: [
                          Color.fromRGBO(6, 199, 172, 1),
                          Color.fromRGBO(6, 199, 172, 1),
                        ],
                      ),
                    ),
                  ),
                  adjustHieght(20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
