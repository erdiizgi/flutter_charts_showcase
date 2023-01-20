import 'dart:ui';

class PieChartDataEntry {
  final double value;
  final String title;
  final String name;
  final Color color;

  PieChartDataEntry(this.value, this.name, this.color) : title =  ('${value.toStringAsFixed(1)}%');
}
