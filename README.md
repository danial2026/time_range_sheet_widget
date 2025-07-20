# Time Range Sheet Widget

A highly customizable time range picker bottom sheet widget for Flutter with tabbed interface and extensive styling options.

[![pub package](https://img.shields.io/pub/v/time_range_sheet_widget.svg)](https://pub.dev/packages/time_range_sheet_widget)
[![Live Demo](https://img.shields.io/badge/Live%20Demo-View%20Online-blue)](https://time-range-sheet-widget.pages.dev/)

## Screenshots

| ![24-Hour Format](https://raw.githubusercontent.com/danial2026/time_range_sheet_widget/main/assets/time-sheet-24.png) | ![AM/PM format](https://raw.githubusercontent.com/danial2026/time_range_sheet_widget/main/assets/time-sheet-am-pm.png) |
|------------------------------------|------------------------------------|

| ![Default Style](https://raw.githubusercontent.com/danial2026/time_range_sheet_widget/main/assets/demo-controls.png) |
|------------------------------------|

## Live Demo

[![Live Demo](https://img.shields.io/badge/Live%20Demo-View%20Online-blue?logo=flutter)](https://time-range-sheet-widget.pages.dev/)

Try the interactive demo online to explore all features and customization options

## Features

- **Tabbed Interface** - Intuitive tab-based selection for start and end times
- **Highly Customizable** - 50+ styling options for colors, typography, and layout
- **Smart Validation** - Built-in validation with custom validator support
- **24-Hour Format** - Support for both 12-hour and 24-hour time formats
- **Smooth Animations** - Tab switching with animated scroll to selected time
- **Haptic Feedback** - Optional haptic feedback for better UX
- **Dark Mode Ready** - Built-in light and dark theme support
- **Embedded Usage** - Use as modal bottom sheet or embedded widget  

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  time_range_sheet_widget: any
```

Then run:

```bash
flutter pub get
```

## Usage

### Modal Bottom Sheet

```dart
import 'package:time_range_sheet_widget/time_range_sheet_widget.dart';

final result = await showTimeRangeSheet(
  context: context,
  initialStartTime: TimeOfDay(hour: 9, minute: 0),
  initialEndTime: TimeOfDay(hour: 17, minute: 0),
);

if (result != null) {
  print('Selected: ${result.startTime} - ${result.endTime}');
  print('Duration: ${result.duration}');
  print('Valid: ${result.isValid}');
}
```

### Embedded Widget

```dart
TimeRangeSheet(
  initialStartTime: TimeOfDay(hour: 9, minute: 0),
  initialEndTime: TimeOfDay(hour: 17, minute: 0),
  onConfirm: (start, end) {
    // Handle confirmed time range
  },
  onCancel: () {
    // Handle cancellation
  },
)
```

### Single Time Picker (No Range)

```dart
TimeRangeSheet(
  initialStartTime: TimeOfDay(hour: 12, minute: 0),
  singlePicker: true, // Only one time picker, no start/end
  onConfirm: (start, end) {
    // Only 'start' is relevant in this mode
    print('Selected: \\${start.hour}:\\${start.minute}');
  },
  onCancel: () {},
)
```

## Customization

### Basic Styling

```dart
showTimeRangeSheet(
  context: context,
  style: TimeRangeSheetStyle(
    buttonColor: Colors.blue,
    confirmButtonText: 'Apply Time Range',
    use24HourFormat: true,
    enableHapticFeedback: true,
  ),
);
```

### Custom Validation

```dart
showTimeRangeSheet(
  context: context,
  customValidator: (start, end) {
    // Business hours: 8 AM to 6 PM
    final startMinutes = start.hour * 60 + start.minute;
    final endMinutes = end.hour * 60 + end.minute;
    return startMinutes >= 480 && endMinutes <= 1080 && startMinutes < endMinutes;
  },
  style: TimeRangeSheetStyle(
    errorMessage: 'Please select times within business hours',
  ),
);
```

### Allow Invalid Ranges

```dart
showTimeRangeSheet(
  context: context,
  allowInvalidRange: true, // Allows start time after end time
  style: TimeRangeSheetStyle(
    confirmButtonText: 'Use Overnight Shift',
  ),
);
```

See the example app for more styling options.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
