import 'package:flutter/material.dart';
import 'package:time_range_sheet_widget/time_range_sheet_widget.dart';
import '../styles/time_range_styles.dart';

/// Page demonstrating the TimeRangeSheet widget embedded directly in a layout
class EmbeddedExamplePage extends StatelessWidget {
  final Function(TimeRangeData) onTimeRangeSelected;
  final bool isDarkMode;

  const EmbeddedExamplePage({
    super.key,
    required this.onTimeRangeSelected,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text(
        'Embedded Widget Example',
        style: TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
      elevation: 0,
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeaderSection(context),
          const SizedBox(height: 24),
          _buildWidgetContainer(context),
          const SizedBox(height: 24),
          _buildFeaturesSection(context),
        ],
      ),
    );
  }

  Widget _buildHeaderSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFF667eea).withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFF667eea),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.integration_instructions,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                'Embedded Widget Demo',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'This demonstrates the TimeRangeSheet widget embedded directly in a page layout instead of as a modal bottom sheet. Perfect for forms and settings pages.',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWidgetContainer(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: TimeRangeSheet(
          initialStartTime: const TimeOfDay(hour: 9, minute: 0),
          initialEndTime: const TimeOfDay(hour: 17, minute: 0),
          style: TimeRangeStyles.createEmbeddedStyle(isDarkMode),
          onConfirm: _handleTimeRangeConfirm,
          onCancel: () => _handleTimeRangeCancel(context),
        ),
      ),
    );
  }

  Widget _buildFeaturesSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).dividerColor,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Embedded Widget Features',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          _buildFeatureItem(
            context,
            Icons.widgets,
            'Direct Integration',
            'Embed directly in any page layout without modal overlays',
          ),
          _buildFeatureItem(
            context,
            Icons.palette,
            'Custom Styling',
            'Full control over colors, typography, and spacing',
          ),
          _buildFeatureItem(
            context,
            Icons.touch_app,
            'Interactive Controls',
            'Smooth scrolling time pickers with haptic feedback',
          ),
          _buildFeatureItem(
            context,
            Icons.check_circle,
            'Validation Support',
            'Built-in validation with custom error messages',
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureItem(BuildContext context, IconData icon, String title, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFF667eea).withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: const Color(0xFF667eea),
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _handleTimeRangeConfirm(TimeOfDay start, TimeOfDay end) {
    onTimeRangeSelected(TimeRangeData(
      startTime: start,
      endTime: end,
    ));
  }

  void _handleTimeRangeCancel(BuildContext context) {
    Navigator.of(context).pop();
  }
}
