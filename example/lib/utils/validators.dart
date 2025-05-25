import 'package:flutter/material.dart';

/// Collection of validation functions for time range selection
class TimeRangeValidators {
  /// Business hours validator - only allows times between 8 AM and 6 PM
  static bool businessHoursValidator(TimeOfDay start, TimeOfDay end) {
    final startMinutes = start.hour * 60 + start.minute;
    final endMinutes = end.hour * 60 + end.minute;
    const businessStart = 8 * 60; // 8 AM
    const businessEnd = 18 * 60; // 6 PM

    return startMinutes >= businessStart && endMinutes <= businessEnd && startMinutes < endMinutes;
  }

  /// Standard validator - ensures start time is before end time
  static bool standardValidator(TimeOfDay start, TimeOfDay end) {
    final startMinutes = start.hour * 60 + start.minute;
    final endMinutes = end.hour * 60 + end.minute;
    return startMinutes < endMinutes;
  }
}
