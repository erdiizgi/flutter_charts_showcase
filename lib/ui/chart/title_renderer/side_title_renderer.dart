import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

abstract class SideTitleRenderer {
  SideTitleWidget render(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff68737d),
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    Widget text = Text(convert(value), style: style);
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  String convert(double value);
}
