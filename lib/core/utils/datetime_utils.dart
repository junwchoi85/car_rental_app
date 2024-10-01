import 'package:flutter/material.dart';

class DatetimeUtils {
  const DatetimeUtils._();

  static String formatDateTime(
      DateTime? date, TimeOfDay? time, BuildContext context) {
    if (date == null || time == null) return 'Select date & time';
    final timeString = time.format(context);
    return "${date.year}-${date.month}-${date.day} $timeString";
  }
}
