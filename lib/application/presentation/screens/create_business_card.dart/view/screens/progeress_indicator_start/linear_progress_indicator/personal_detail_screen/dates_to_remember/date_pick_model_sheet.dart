import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class DatePickingBottomSheet extends StatelessWidget {
  const DatePickingBottomSheet({
    super.key,
    required this.datePicker,
    required this.onPressed,
    this.year = 0,
  });

  final TextEditingController datePicker;
  final void Function(String) onPressed;
  final int year;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: khieght * 0.6,
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
                initialDate: DateTime.now(),
                firstDate: DateTime.now().subtract(Duration(days: year * 365)),
                lastDate: year == 0
                    ? DateTime.now().add(
                        const Duration(days: 365 * 100),
                      )
                    : DateTime.now(),
                onDateChanged: (date) {
                  int year = date.year;
                  int month = date.month;
                  int day = date.day;
                  onPressed('$year-$month-$day');
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Cancel',
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'ok',
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
