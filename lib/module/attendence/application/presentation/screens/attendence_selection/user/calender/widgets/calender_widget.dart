import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/intl/intl_date_formater.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({Key? key}) : super(key: key);

  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  late final ValueNotifier<List<Event>> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  List<Event> _getEventsForDay(DateTime day) {
    if (day.day == 5) {
      return [const Event('Event 1', personDemoImg)];
    }
    if (day.day == 10) {
      return [const Event('Event 2', demoPerosnImgPeltandpell)];
    }
    if (day.day == 18) {
      return [const Event('Event 3', dummyPersonImage)];
    }
    return [];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _selectedEvents.value = _getEventsForDay(selectedDay);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            DateTimeFormater.getMonthFull(_focusedDay.month),
            style: textStyle1.copyWith(
              fontSize: 16.sp,
            ),
          ),
          adjustHieght(5.h),
          Container(
            height: 250.h,
            decoration: BoxDecoration(
              color: lightColr,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(13.0),
              child: TableCalendar<Event>(
                rowHeight: 40,
                headerVisible: false,
                firstDay: DateTime.utc(2024, 1, 1),
                lastDay: DateTime.utc(2090, 12, 31),
                focusedDay: _focusedDay,
                selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                calendarFormat: _calendarFormat,
                eventLoader: _getEventsForDay,
                startingDayOfWeek: StartingDayOfWeek.monday,
                calendarStyle: const CalendarStyle(
                  outsideDaysVisible: false,
                  weekendTextStyle: TextStyle(color: Colors.white),
                  holidayTextStyle: TextStyle(color: Colors.white),
                ),
                onDaySelected: _onDaySelected,
                onFormatChanged: (format) {
                  if (_calendarFormat != format) {
                    setState(() {
                      _calendarFormat = format;
                    });
                  }
                },
                onPageChanged: (focusedDay) {
                  _focusedDay = focusedDay;
                },
                calendarBuilders: CalendarBuilders(
                  defaultBuilder: (context, day, focusedDay) {
                    return _buildCalendarCell(day, _getEventsForDay(day));
                  },
                  selectedBuilder: (context, day, focusedDay) {
                    return _buildCalendarCell(day, _getEventsForDay(day),
                        isSelected: true);
                  },
                  todayBuilder: (context, day, focusedDay) {
                    return _buildCalendarCell(day, _getEventsForDay(day),
                        isToday: true);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCalendarCell(DateTime day, List<Event> events,
      {bool isSelected = false, bool isToday = false}) {
    return Container(
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        gradient: isSelected
            ? neonShadeLinearGradient
            : (isToday ? neonShadeLinearGradient : null),
        // color: isSelected
        //     ? neonShade
        //     : (isToday ? neonShade.withOpacity(0.3) : null),
        shape: BoxShape.circle,
      ),
      child: Stack(
        children: [
          Center(
            child: Text(
              '${day.day}',
              style: TextStyle(
                color: isSelected || isToday ? kwhite : Colors.grey[300],
              ),
            ),
          ),
          if (events.isNotEmpty)
            Positioned(
              bottom: 1,
              right: 1,
              child: CircleAvatar(
                radius: 15,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage(events.first.imageUrl),
              ),
            ),
        ],
      ),
    );
  }
}

class Event {
  final String title;
  final String imageUrl;

  const Event(this.title, this.imageUrl);
}
