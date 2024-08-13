import 'package:intl/intl.dart';

class DateTimeFormater {
  // return HH:MM AM/PM
  static String formatTimeAMPM(String? timestamp) {
    if (timestamp == null || timestamp.isEmpty) return '';

    // Parse the timestamp into a DateTime object
    final dateTime = DateTime.parse(timestamp);

    // Convert the DateTime to the user's local time zone
    final localDateTime = dateTime.toLocal();

    // Format the time in AM/PM format
    final formattedTime = DateFormat.jm().format(localDateTime);

    return formattedTime;
  }

  static String formatDateTime(String dateString, String timeString) {
    // Parse the date and time strings
    DateTime dateTime;
    try {
      dateTime = DateTime.parse('$dateString $timeString');
    } on FormatException catch (e) {
      // Handle parsing error (optional: throw exception or return default value)
      print('Invalid date or time format: $e');
      return '$dateString , $timeString'; // Or return any default value you prefer
    } catch (e) {
      print('Invalid date time exxception: $e');
      return '$dateString , $timeString';
    }

    final DateFormat dayMonthFormat =
        DateFormat('d MMM'); // Format for day and month
    final DateFormat timeFormat =
        DateFormat('h:mm a'); // Format for time (12-hour with AM/PM)

    final String formattedDate = dayMonthFormat.format(dateTime);
    final String formattedTime = timeFormat.format(dateTime);

    return '$formattedDate, $formattedTime';
  }

  static String dateTimeFormat(
    DateTime date,
  ) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  static int calculateDifferenceInHours(String date1, String date2) {
    DateTime? parseDate(String date) {
      try {
        // Try parsing with different formats
        var parsedDate = DateTime.tryParse(date);
        if (parsedDate != null) return parsedDate;

        // Try parsing the date format with the specific format used in the examples
        var formats = [
          DateFormat('yyyy-MM-dd'),
          DateFormat('yyyy-MM-ddTHH:mm:ss.SSS'),
          DateFormat('yyyy-MM-ddTHH:mm:ss.SSSSSS'),
        ];

        for (var format in formats) {
          try {
            parsedDate = format.parse(date);
            return parsedDate;
          } catch (e) {
            // Continue trying with next format
          }
        }

        return null;
      } catch (e) {
        return null;
      }
    }

    DateTime? firstDate = parseDate(date1);
    DateTime? secondDate = parseDate(date2);

    if (firstDate == null || secondDate == null) {
      throw ArgumentError('One or both dates are invalid');
    }

    Duration difference = secondDate.difference(firstDate);
    return difference.inHours;
  }

  // will return date as String type  yyyy-mm-dd
  static String getDateApi(DateTime? dateTime) {
    if (dateTime == null) return '';
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }

// will return week day
  static String getWeekDay(int day) {
    switch (day) {
      case DateTime.monday:
        return 'Mon';
      case DateTime.tuesday:
        return 'Tue';
      case DateTime.wednesday:
        return 'Wed';
      case DateTime.thursday:
        return 'Thu';
      case DateTime.friday:
        return 'Fri';
      case DateTime.saturday:
        return 'Sat';
      case DateTime.sunday:
        return 'Sun';
      default:
        return '';
    }
  }

  // will return week day
  static String getMonth(int day) {
    switch (day) {
      case DateTime.january:
        return 'Jan';
      case DateTime.february:
        return 'Feb';
      case DateTime.march:
        return 'Mar';
      case DateTime.april:
        return 'Apr';
      case DateTime.may:
        return 'May';
      case DateTime.june:
        return 'Jun';
      case DateTime.july:
        return 'Jul';
      case DateTime.august:
        return 'Aug';
      case DateTime.september:
        return 'Sep';
      case DateTime.october:
        return 'Oct';
      case DateTime.november:
        return 'Nov';
      case DateTime.december:
        return 'Dec';
      default:
        return '';
    }
  }
}
