import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chart_sample/core/entity/crypto_percentage_change.dart';
import 'package:flutter_chart_sample/ui/chart/chart_boundary/base_chart_boundary.dart';
import 'package:flutter_chart_sample/ui/chart/chart_boundary/boundaries.dart';
import 'package:flutter_chart_sample/ui/chart/title_renderer/x_axis_month_title_renderer.dart';

import '../../chart/chart_boundary/line_chart_boundary.dart';
import '../../chart/converter/chart_data_converter.dart';
import '../../chart/title_renderer/y_axis_number_title_renderer.dart';
import 'base/base_line_chart.dart';
import 'base/chart_utils.dart';

// creates a line chart that compares two crypto asset based on their percentage
// change.
class CryptoPercentageChangeCompareLineChart extends BaseLineChart {
  final List<CryptoPercentageChange>? percentageChangesForFirst;
  final List<CryptoPercentageChange>? percentageChangesForSecond;

  const CryptoPercentageChangeCompareLineChart(
      this.percentageChangesForFirst, this.percentageChangesForSecond,
      {super.key, super.titlesOnYAxis = 2, super.titlesOnXAxis = 8});

  @override
  BaseChartBoundary calculateBoundary() {
    var first = LineChartBoundary(
        percentageChangesForFirst!, (element) => element.percentageChange);
    first.init();
    var second = LineChartBoundary(
        percentageChangesForSecond!, (element) => element.percentageChange);
    second.init();

    return Boundaries.convolute(first, second);
  }

  @override
  AxisTitles createBottomAxisTitle(BaseChartBoundary boundary) {
    var xAxisRenderer =
        XAxisMonthTitleRenderer(percentageChangesForFirst!.first.date);
    return ChartUtils.createAxisTitle(
        30, boundary.maxX / (titlesOnXAxis - 1), xAxisRenderer.render);
  }

  @override
  AxisTitles createLeftAxisTitle(BaseChartBoundary boundary) {
    var yAxisRenderer = YAxisNumberTitleRenderer();
    return ChartUtils.createAxisTitle(
        55, boundary.maxY / titlesOnYAxis, yAxisRenderer.render);
  }

  @override
  List<LineChartBarData> createLineBarsData() {
    return [firstBarData(), secondBarData()];
  }

  LineChartBarData firstBarData() {
    var data = ChartDataConverter.convert(
        percentageChangesForFirst!, (element) => element.percentageChange, 10);
    return _createBarData(const Color(0xff00BCD4), data);
  }

  LineChartBarData _createBarData(Color color, List<FlSpot> spots) {
    return LineChartBarData(
      isCurved: true,
      color: color,
      barWidth: 3,
      isStrokeCapRound: true,
      dotData: FlDotData(show: false),
      belowBarData: BarAreaData(show: false),
      spots: spots,
    );
  }

  LineChartBarData secondBarData() {
    var data = ChartDataConverter.convert(
        percentageChangesForSecond!, (element) => element.percentageChange, 10);
    return _createBarData(const Color(0xff673AB7), data);
  }
}
