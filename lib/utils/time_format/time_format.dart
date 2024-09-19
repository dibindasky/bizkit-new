import 'package:intl/intl.dart';

class TimeDateFormating {
  // 2020-10-12
  static String formatYearMonthDate(String date) {
    if (date.isEmpty) return '';
    DateTime dateTime = DateTime.parse(date);
    String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
    return formattedDate;
  }

  /// 13:30
  static String extractTime(String date) {
    if (date == '') return '';
    DateTime dateTime = DateTime.parse(date);
    final DateFormat formatter = DateFormat('HH:mm');
    return formatter.format(dateTime);
  }
}
