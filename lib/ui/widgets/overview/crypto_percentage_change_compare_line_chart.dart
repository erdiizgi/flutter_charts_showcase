import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chart_sample/core/entity/crypto_percentage_change.dart';
import 'package:flutter_chart_sample/ui/chart/chart_boundary/base_chart_boundary.dart';
import 'package:flutter_chart_sample/ui/chart/chart_boundary/boundaries.dart';
import 'package:flutter_chart_sample/ui/chart/title_renderer/x_axis_month_title_renderer.dart';

import '../../chart/chart_boundary/percentage_line_chart_boundary.dart';
import '../../chart/converter/price_to_percentage_chart_data_converter.dart';
import '../../chart/title_renderer/y_axis_number_title_renderer.dart';
import 'base/base_line_chart.dart';
import 'base/chart_utils.dart';

class CryptoPercentageChangeCompareLineChart extends BaseLineChart {
  final List<CryptoPercentageChange>? percentageChangesForFirst;
  final List<CryptoPercentageChange>? percentageChangesForSecond;

  const CryptoPercentageChangeCompareLineChart(
      this.percentageChangesForFirst, this.percentageChangesForSecond,
      {super.key, super.titlesOnYAxis = 2, super.titlesOnXAxis = 8});

  @override
  BaseChartBoundary calculateBoundary() {
    var boundaryFirst = PercentageLineChartBoundary(percentageChangesForFirst!);
    boundaryFirst.init();

    var boundarySecond =
        PercentageLineChartBoundary(percentageChangesForSecond!);
    boundarySecond.init();

    var boundaries = Boundaries(boundaryFirst, boundarySecond);
    var boundary = boundaries.convolute();
    return boundary;
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
    var converter = PercentageToChartDataConverter(percentageChangesForFirst!, 10);
    converter.convert();
    return _createBarData(const Color(0xff00BCD4), converter.data);
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
    var converter = PercentageToChartDataConverter(percentageChangesForSecond!, 10);
    converter.convert();

    return _createBarData(const Color(0xff673AB7), converter.data);
  }
}
