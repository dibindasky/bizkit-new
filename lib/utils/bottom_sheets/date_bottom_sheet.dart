import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';

class DatePickingBottomSheet extends StatelessWidget {
  const DatePickingBottomSheet({
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
      height: khieght * 0.6,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Choose the date',
                    //style: textHeadMedium1.copyWith(fontSize: sWidth * 0.04),
                  ),
                  Icon(
                    Icons.calendar_month_outlined,
                    color: neonShade,
                  ),
                ],
              ),
            ),
            adjustHieght(20),
            Column(
              children: [
                CalendarDatePicker(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'Cancel',
                      ),
                    ),
                    adjustWidth(20),
                    OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'Ok',
                      ),
                    ),
                    adjustWidth(20)
                  ],
                ),
                kHeight50,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
