import 'dart:ui';

// makes it easy to work with pie chart, contains all the necessary information
// to represent a pie chart entry
class PieChartDataEntry {
  final double value;
  final String title;
  final String name;
  final Color color;

  PieChartDataEntry(this.value, this.name, this.color)
      : title = ('${value.toStringAsFixed(1)}%');
}
