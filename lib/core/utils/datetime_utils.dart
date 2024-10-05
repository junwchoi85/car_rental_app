import 'package:flutter/material.dart';

class DatetimeUtils {
  const DatetimeUtils._();

  static String formatDateTime(
      DateTime? date, TimeOfDay? time, BuildContext context) {
    if (date == null || time == null) return 'Select date & time';
    final timeString = time.format(context);
    return "${date.year}-${date.month}-${date.day} $timeString";
  }

  static Future<TimeOfDay?> selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    return picked;
  }

  static Future<DateTime?> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    return pickedDate;
  }

  static String formatTime(BuildContext context, TimeOfDay? time) {
    if (time == null) return 'Select time';
    return time.format(context);
  }

  static String formatDate(BuildContext context, DateTime? date) {
    if (date == null) return 'Select date';
    return date.toIso8601String().split('T').first;
  }
}
