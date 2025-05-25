import 'package:flutter/material.dart';

/// Collection of formatting utilities for time and duration display
class TimeFormatters {
  /// Formats a TimeOfDay to a readable 12-hour format string
  static String formatTime(TimeOfDay time) {
    final hour = time.hour % 12 == 0 ? 12 : time.hour % 12;
    final period = time.hour >= 12 ? 'PM' : 'AM';
    return '${hour.toString()}:${time.minute.toString().padLeft(2, '0')} $period';
  }

  /// Formats a TimeOfDay to a 24-hour format string
  static String formatTime24Hour(TimeOfDay time) {
    return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
  }

  /// Formats a Duration to a readable string (e.g., "2h 30m")
  static String formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes % 60;
    return '${hours}h ${minutes}m';
  }

  /// Formats duration in minutes only (e.g., "150 min")
  static String formatDurationMinutes(Duration duration) {
    return '${duration.inMinutes} min';
  }
}
