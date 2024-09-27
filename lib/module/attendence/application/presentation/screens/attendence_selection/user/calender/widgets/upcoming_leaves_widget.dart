import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'leave_item_widget.dart';

class UpcomingLeavesWidget extends StatelessWidget {
  const UpcomingLeavesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: Replace with actual data from API
    final leaves = [
      Leave(
        title: 'Regional Holiday',
        names: ['Adam', 'Joshua'],
        date: DateTime(2024, 6, 10),
        type: LeaveType.regionalHoliday,
      ),
      Leave(
        title: 'Leave',
        names: ['Adam madam'],
        startDate: DateTime(2024, 6, 23),
        endDate: DateTime(2024, 6, 25),
        type: LeaveType.personalLeave,
      ),
      Leave(
        title: 'Columbus Day',
        names: [],
        date: DateTime(2024, 10, 14),
        type: LeaveType.publicHoliday,
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Upcoming Leaves',
          style: textThinStyle1.copyWith(
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 10),
        ...leaves.map((leave) => LeaveItemWidget(leave: leave)).toList(),
      ],
    );
  }
}

// models/date_model.dart
class DateModel {
  final DateTime date;
  final bool isMarked;

  DateModel({required this.date, this.isMarked = false});
}

// models/leave_model.dart
enum LeaveType { regionalHoliday, personalLeave, publicHoliday }

class Leave {
  final String title;
  final List<String> names;
  final DateTime? date;
  final DateTime? startDate;
  final DateTime? endDate;
  final LeaveType type;

  Leave({
    required this.title,
    required this.names,
    this.date,
    this.startDate,
    this.endDate,
    required this.type,
  });
}
