import 'package:intl/intl.dart';

class DateTimeFormater {
  static String formatDateTime(String dateString, String timeString) {
    // Parse the date and time strings
    DateTime dateTime;
    try {
      dateTime = DateTime.parse('$dateString $timeString');
    } on FormatException catch (e) {
      // Handle parsing error (optional: throw exception or return default value)
      print('Invalid date or time format: $e');
      return '$dateString , $timeString'; // Or return any default value you prefer
    }catch (e){
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
}
