import 'package:flutter/material.dart';
import 'package:time_range_sheet_widget/time_range_sheet_widget.dart';
import '../widgets/package_info_card.dart';
import '../widgets/selected_time_card.dart';
import '../widgets/example_button.dart';
import '../styles/time_range_styles.dart';
import '../utils/validators.dart';
import 'embedded_example_page.dart';

/// Main home page displaying all the time range sheet examples
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TimeRangeData? _selectedTimeRange;
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      child: Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Text('Time Range Sheet Widget'),
      actions: [
        IconButton(
          icon: Icon(_isDarkMode ? Icons.light_mode : Icons.dark_mode),
          onPressed: _toggleDarkMode,
        ),
      ],
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Package info card
          PackageInfoCard(isDarkMode: _isDarkMode),
          const SizedBox(height: 24),

          // Selected time range card (if any)
          if (_selectedTimeRange != null) ...[
            SelectedTimeCard(
              timeRange: _selectedTimeRange!,
              isDarkMode: _isDarkMode,
            ),
            const SizedBox(height: 24),
          ],

          // Examples section
          _buildExamplesSection(),
          const SizedBox(height: 24),

          // Embedded section
          _buildEmbeddedSection(),
        ],
      ),
    );
  }

  Widget _buildExamplesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader(
          'Style Examples',
          Icons.palette,
          const Color(0xFF6C757D),
        ),
        const SizedBox(height: 20),
        _buildExamplesList(),
      ],
    );
  }

  Widget _buildEmbeddedSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader(
          'Direct Widget Usage',
          Icons.widgets,
          const Color(0xFF495057),
        ),
        const SizedBox(height: 20),
        ExampleButton(
          title: 'Embedded Widget',
          description: 'Use TimeRangeSheet as a regular widget',
          onPressed: _showEmbeddedExample,
          color: const Color(0xFF6C757D),
          icon: Icons.integration_instructions,
          isDarkMode: _isDarkMode,
        ),
      ],
    );
  }

  Widget _buildSectionHeader(String title, IconData icon, Color color) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 20,
          ),
        ),
        const SizedBox(width: 12),
        Text(
          title,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: _isDarkMode ? Colors.white : const Color(0xFF1A1A1A),
          ),
        ),
      ],
    );
  }

  Widget _buildExamplesList() {
    return Column(
      children: [
        ExampleButton(
          title: 'Default Style',
          description: 'Basic time range picker with default styling',
          onPressed: _showDefaultExample,
          color: const Color(0xFF007BFF),
          icon: Icons.schedule,
          isDarkMode: _isDarkMode,
        ),
        const SizedBox(height: 12),
        ExampleButton(
          title: 'Custom Style',
          description: 'Customized colors, fonts, and layout',
          onPressed: _showCustomStyleExample,
          color: const Color(0xFF6F42C1),
          icon: Icons.brush,
          isDarkMode: _isDarkMode,
        ),
        const SizedBox(height: 12),
        ExampleButton(
          title: '24-Hour Format',
          description: 'Time picker using 24-hour format',
          onPressed: _show24HourExample,
          color: const Color(0xFF17A2B8),
          icon: Icons.access_time_filled,
          isDarkMode: _isDarkMode,
        ),
        const SizedBox(height: 12),
        ExampleButton(
          title: 'Custom Validation',
          description: 'Custom validation with business hours',
          onPressed: _showCustomValidationExample,
          color: const Color(0xFF28A745),
          icon: Icons.verified_user,
          isDarkMode: _isDarkMode,
        ),
        const SizedBox(height: 12),
        ExampleButton(
          title: 'Allow Invalid Range',
          description: 'Allows start time after end time',
          onPressed: _showInvalidRangeExample,
          color: const Color(0xFFFD7E14),
          icon: Icons.warning_amber,
          isDarkMode: _isDarkMode,
        ),
      ],
    );
  }

  void _toggleDarkMode() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  // Example methods
  Future<void> _showDefaultExample() async {
    final result = await showTimeRangeSheet(
      context: context,
      initialStartTime: const TimeOfDay(hour: 9, minute: 0),
      initialEndTime: const TimeOfDay(hour: 17, minute: 0),
      style: TimeRangeStyles.createDefaultStyle(_isDarkMode),
    );
    _updateSelectedTimeRange(result);
  }

  Future<void> _showCustomStyleExample() async {
    final result = await showTimeRangeSheet(
      context: context,
      initialStartTime: const TimeOfDay(hour: 10, minute: 30),
      initialEndTime: const TimeOfDay(hour: 14, minute: 15),
      style: TimeRangeStyles.createCustomStyle(_isDarkMode),
    );
    _updateSelectedTimeRange(result);
  }

  Future<void> _show24HourExample() async {
    final result = await showTimeRangeSheet(
      context: context,
      initialStartTime: const TimeOfDay(hour: 8, minute: 0),
      initialEndTime: const TimeOfDay(hour: 20, minute: 30),
      style: TimeRangeStyles.create24HourStyle(_isDarkMode),
    );
    _updateSelectedTimeRange(result);
  }

  Future<void> _showCustomValidationExample() async {
    final result = await showTimeRangeSheet(
      context: context,
      initialStartTime: const TimeOfDay(hour: 9, minute: 0),
      initialEndTime: const TimeOfDay(hour: 17, minute: 0),
      customValidator: TimeRangeValidators.businessHoursValidator,
      style: TimeRangeStyles.createValidationStyle(_isDarkMode),
    );
    _updateSelectedTimeRange(result);
  }

  Future<void> _showInvalidRangeExample() async {
    final result = await showTimeRangeSheet(
      context: context,
      initialStartTime: const TimeOfDay(hour: 22, minute: 0),
      initialEndTime: const TimeOfDay(hour: 6, minute: 0),
      allowInvalidRange: true,
      style: TimeRangeStyles.createInvalidRangeStyle(_isDarkMode),
    );
    _updateSelectedTimeRange(result);
  }

  void _showEmbeddedExample() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Theme(
          data: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
          child: EmbeddedExamplePage(
            onTimeRangeSelected: (timeRange) {
              _updateSelectedTimeRange(timeRange);
              Navigator.of(context).pop();
            },
            isDarkMode: _isDarkMode,
          ),
        ),
      ),
    );
  }

  void _updateSelectedTimeRange(TimeRangeData? result) {
    if (result != null) {
      setState(() {
        _selectedTimeRange = result;
      });
    }
  }
}
