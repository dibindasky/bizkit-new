import 'package:intl/intl.dart';

class DateTimeFormater {
  // return HH:MM AM/PM
  static String formatTimeAMPM(String? timestamp) {
    if (timestamp == null || timestamp.isEmpty) return '';
    try {
      // Parse the timestamp into a DateTime object
      final dateTime = DateTime.parse(timestamp);

      // Convert the DateTime to the user's local time zone
      final localDateTime = dateTime.toLocal();

      // Add 5 hours and 30 minutes to the localDateTime
      final updatedDateTime =
          localDateTime.add(const Duration(hours: 5, minutes: 30));

      // Format the time in AM/PM format
      final formattedTime = DateFormat.jm().format(updatedDateTime);

      return formattedTime;
    } catch (_) {
      return '';
    }
  }

  /// return format "11 NOV 12:15 AM"
  static String getDDMMHHMMformat(String? date) {
    if (date == null) return '';
    try {
      DateTime dateTime = DateTime.parse(date);
      return DateFormat('d MMM h:mm a').format(dateTime);
    } catch (e) {
      return '';
    }
  }

  static String formatDateTimeDDMMYYYYHHMMSS(DateTime dateTime) {
    // Convert UTC time to IST (UTC+5:30)
    dateTime = dateTime.add(const Duration(hours: 5, minutes: 30));

    final day = dateTime.day.toString().padLeft(2, '0');
    final month = dateTime.month.toString().padLeft(2, '0');
    final year = dateTime.year.toString();
    final hours = dateTime.hour.toString().padLeft(2, '0');
    final minutes = dateTime.minute.toString().padLeft(2, '0');
    final seconds = dateTime.second.toString().padLeft(2, '0');

    // Format the date and time using string interpolation
    return '$day/$month/$year, $hours:$minutes:$seconds';
  }

  static String getDateByDayMonthYear(String date) {
    if (date.isEmpty) return '';
    DateTime dateTime = DateTime.parse(date);
    String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
    return formattedDate;
  }

  static String formatDateTime(String dateString, String timeString) {
    DateTime dateTime;
    try {
      dateTime = DateTime.parse('$dateString $timeString');
    } on FormatException catch (_) {
      return '$dateString , $timeString'; // Or return any default value you prefer
    } catch (e) {
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

  /// format date string to DD-MM-YYYY
  static String formatDateToDDMMYYYY(String dateStr) {
    try {
      DateTime dateTime = DateTime.parse(dateStr);
      String formattedDate = DateFormat('dd-MM-yyyy').format(dateTime);
      return formattedDate;
    } catch (e) {
      return '';
    }
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

  // return the difference between given time and current time
  static int countdownInSeconds(String timeString) {
    try {
      DateTime targetTime = DateTime.parse(timeString);
      DateTime currentTime = DateTime.now();
      Duration difference = targetTime.difference(currentTime);
      return difference.inSeconds;
    } catch (e) {
      return -1;
    }
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

  static String getMonthFull(int month) {
    switch (month) {
      case DateTime.january:
        return 'January';
      case DateTime.february:
        return 'February';
      case DateTime.march:
        return 'March';
      case DateTime.april:
        return 'April';
      case DateTime.may:
        return 'May';
      case DateTime.june:
        return 'June';
      case DateTime.july:
        return 'July';
      case DateTime.august:
        return 'August';
      case DateTime.september:
        return 'September';
      case DateTime.october:
        return 'October';
      case DateTime.november:
        return 'November';
      case DateTime.december:
        return 'December';
      default:
        return '';
    }
  }

  // return "45 Hours 24 Minutes" minutes
  static String convertMinutesToHourMinuteFormat(int totalMinutes) {
    int hours = totalMinutes ~/ 60; // Calculate the number of hours
    int minutes = totalMinutes % 60; // Calculate the remaining minutes

    if (hours == 0) {
      return "$minutes Min${minutes != 1 ? 's' : ''}";
    } else {
      return "$hours Hr${hours != 1 ? 's' : ''} $minutes Min${minutes != 1 ? 's' : ''}";
    }
  }

  static String timeAgo(DateTime dateTime) {
    final Duration difference = DateTime.now().difference(dateTime);

    if (difference.inDays > 1) {
      return '${difference.inDays} days ago';
    } else if (difference.inDays == 1) {
      return '1 day ago';
    } else if (difference.inHours > 1) {
      return '${difference.inHours} hours ago';
    } else if (difference.inHours == 1) {
      return '1 hour ago';
    } else if (difference.inMinutes > 1) {
      return '${difference.inMinutes} min ago';
    } else if (difference.inMinutes == 1) {
      return '1 min ago';
    } else {
      return 'Just now';
    }
  }

  // return time from int second (MM:SS)
  static String getDurtionFromSeconds(int sec) {
    // Calculate minutes and seconds
    int minutes = sec ~/ 60; // Integer division to get minutes
    int seconds = sec % 60; // Remainder to get seconds

    // Format minutes and seconds to always have two digits
    String formattedMinutes = minutes.toString().padLeft(2, '0');
    String formattedSeconds = seconds.toString().padLeft(2, '0');

    // Return the formatted duration
    return '$formattedMinutes:$formattedSeconds';
  }

  // retrun total seconds from (MM:SS)
  static int convertMMSSToTotalSeconds(String time) {
    try {
      // Split the string into minutes and seconds
      List<String> parts = time.split(':');
      if (parts.length == 1) return 1;

      // Parse minutes and seconds as integers
      int minutes = int.parse(parts[0]);
      int seconds = int.parse(parts[1]);

      // Calculate total seconds
      return (minutes * 60) + seconds;
    } catch (e) {
      return 1;
    }
  }
}
