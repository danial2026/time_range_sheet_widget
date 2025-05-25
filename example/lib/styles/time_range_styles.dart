import 'package:flutter/material.dart';
import 'package:time_range_sheet_widget/time_range_sheet_widget.dart';

/// Collection of predefined time range sheet styles
class TimeRangeStyles {
  /// Creates a default style based on dark mode preference
  static TimeRangeSheetStyle createDefaultStyle(bool isDarkMode) {
    return TimeRangeSheetStyle(
      headerBackgroundColor: isDarkMode ? const Color(0xFF2A2A2A) : const Color(0xFFF8F9FA),
      sheetBackgroundColor: isDarkMode ? const Color(0xFF1E1E1E) : Colors.white,
      labelTextColor: isDarkMode ? const Color(0xFFB0B0B0) : const Color(0xFF6C757D),
      selectedTimeTextColor: isDarkMode ? Colors.white : const Color(0xFF212529),
      pickerTextColor: isDarkMode ? const Color(0xFF666666) : const Color(0xFF6C757D),
      selectedPickerTextColor: isDarkMode ? Colors.white : const Color(0xFF212529),
      buttonColor: const Color(0xFF007BFF),
      cancelButtonColor: isDarkMode ? const Color(0xFF666666) : const Color(0xFF6C757D),
      amPmSelectedColor: const Color(0xFF007BFF),
      dividerColor: isDarkMode ? const Color(0xFF404040) : const Color(0xFFE9ECEF),
    );
  }

  /// Creates a custom purple-themed style
  static TimeRangeSheetStyle createCustomStyle(bool isDarkMode) {
    return TimeRangeSheetStyle(
      headerBackgroundColor: isDarkMode ? const Color(0xFF2A1A2A) : const Color(0xFFF8F0FF),
      sheetBackgroundColor: isDarkMode ? const Color(0xFF1E1A1E) : const Color(0xFFFFFBFE),
      labelTextColor: const Color(0xFF6F42C1),
      selectedTimeTextColor: isDarkMode ? Colors.white : const Color(0xFF212529),
      pickerTextColor: isDarkMode ? const Color(0xFF666666) : const Color(0xFF6C757D),
      selectedPickerTextColor: const Color(0xFF6F42C1),
      buttonColor: const Color(0xFF6F42C1),
      cancelButtonColor: isDarkMode ? const Color(0xFF666666) : const Color(0xFF6C757D),
      cornerRadius: 25,
      buttonCornerRadius: 15,
      pickerItemHeight: 50,
      confirmButtonText: 'Apply Time Range',
      cancelButtonText: 'Dismiss',
      errorMessage: 'Please select a valid time range!',
      amPmSelectedColor: const Color(0xFF6F42C1),
      dividerColor: isDarkMode ? const Color(0xFF404040) : const Color(0xFFE9ECEF),
    );
  }

  /// Creates a 24-hour format style with teal theme
  static TimeRangeSheetStyle create24HourStyle(bool isDarkMode) {
    return TimeRangeSheetStyle(
      use24HourFormat: true,
      headerBackgroundColor: isDarkMode ? const Color(0xFF1A2A2A) : const Color(0xFFE8F4FD),
      sheetBackgroundColor: isDarkMode ? const Color(0xFF1A1E1E) : const Color(0xFFF8FCFF),
      labelTextColor: const Color(0xFF17A2B8),
      selectedTimeTextColor: isDarkMode ? Colors.white : const Color(0xFF212529),
      pickerTextColor: isDarkMode ? const Color(0xFF666666) : const Color(0xFF6C757D),
      selectedPickerTextColor: const Color(0xFF17A2B8),
      buttonColor: const Color(0xFF17A2B8),
      cancelButtonColor: isDarkMode ? const Color(0xFF666666) : const Color(0xFF6C757D),
      dividerColor: isDarkMode ? const Color(0xFF404040) : const Color(0xFFE9ECEF),
    );
  }

  /// Creates a validation style with green theme for business hours
  static TimeRangeSheetStyle createValidationStyle(bool isDarkMode) {
    return TimeRangeSheetStyle(
      errorMessage: 'Please select times within business hours (8 AM - 6 PM)',
      headerBackgroundColor: isDarkMode ? const Color(0xFF1A2A1A) : const Color(0xFFE8F5E8),
      sheetBackgroundColor: isDarkMode ? const Color(0xFF1A1E1A) : const Color(0xFFF8FFF8),
      labelTextColor: const Color(0xFF28A745),
      selectedTimeTextColor: isDarkMode ? Colors.white : const Color(0xFF212529),
      pickerTextColor: isDarkMode ? const Color(0xFF666666) : const Color(0xFF6C757D),
      selectedPickerTextColor: const Color(0xFF28A745),
      buttonColor: const Color(0xFF28A745),
      cancelButtonColor: isDarkMode ? const Color(0xFF666666) : const Color(0xFF6C757D),
      amPmSelectedColor: const Color(0xFF28A745),
      errorTextColor: const Color(0xFFDC3545),
      dividerColor: isDarkMode ? const Color(0xFF404040) : const Color(0xFFE9ECEF),
    );
  }

  /// Creates a style that allows invalid ranges with orange theme
  static TimeRangeSheetStyle createInvalidRangeStyle(bool isDarkMode) {
    return TimeRangeSheetStyle(
      headerBackgroundColor: isDarkMode ? const Color(0xFF2A2A1A) : const Color(0xFFFFF3E0),
      sheetBackgroundColor: isDarkMode ? const Color(0xFF1E1E1A) : const Color(0xFFFFFAF0),
      labelTextColor: const Color(0xFFFD7E14),
      selectedTimeTextColor: isDarkMode ? Colors.white : const Color(0xFF212529),
      pickerTextColor: isDarkMode ? const Color(0xFF666666) : const Color(0xFF6C757D),
      selectedPickerTextColor: const Color(0xFFFD7E14),
      buttonColor: const Color(0xFFFD7E14),
      cancelButtonColor: isDarkMode ? const Color(0xFF666666) : const Color(0xFF6C757D),
      confirmButtonText: 'Use Overnight Shift',
      amPmSelectedColor: const Color(0xFFFD7E14),
      errorTextColor: const Color(0xFFDC3545),
      dividerColor: isDarkMode ? const Color(0xFF404040) : const Color(0xFFE9ECEF),
    );
  }

  /// Creates an embedded widget style with blue gradient theme
  static TimeRangeSheetStyle createEmbeddedStyle(bool isDarkMode) {
    return TimeRangeSheetStyle(
      cornerRadius: 20,
      headerBackgroundColor: isDarkMode ? const Color(0xFF2A2A2A) : const Color(0xFFF8F9FA),
      sheetBackgroundColor: isDarkMode ? const Color(0xFF1E1E1E) : Colors.white,
      labelTextColor: const Color(0xFF667eea),
      selectedTimeTextColor: isDarkMode ? Colors.white : const Color(0xFF1A1A1A),
      pickerTextColor: isDarkMode ? const Color(0xFF666666) : const Color(0xFF6C757D),
      selectedPickerTextColor: const Color(0xFF667eea),
      buttonColor: const Color(0xFF667eea),
      cancelButtonColor: isDarkMode ? const Color(0xFF666666) : const Color(0xFF6C757D),
      amPmSelectedColor: const Color(0xFF667eea),
      dividerColor: isDarkMode ? const Color(0xFF404040) : const Color(0xFFE9ECEF),
      pickerItemHeight: 50,
      confirmButtonText: 'Apply Time Selection',
      cancelButtonText: 'Reset',
    );
  }
}
