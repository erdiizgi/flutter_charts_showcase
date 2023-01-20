import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chart_sample/core/entity/crypto_price.dart';
import 'package:flutter_chart_sample/ui/chart/chart_boundary/base_chart_boundary.dart';
import 'package:flutter_chart_sample/ui/chart/title_renderer/x_axis_month_title_renderer.dart';
import 'package:flutter_chart_sample/ui/widgets/overview/base/chart_utils.dart';

import '../../chart/chart_boundary/line_chart_boundary.dart';
import '../../chart/converter/price_to_chart_data_converter.dart';
import '../../chart/title_renderer/y_axis_number_title_renderer.dart';
import 'base/base_line_chart.dart';

class CryptoPriceLineChart extends BaseLineChart {

  final List<CryptoPrice>? prices;

  const CryptoPriceLineChart(this.prices,
      {super.key, super.titlesOnYAxis = 5, super.titlesOnXAxis = 8});

  @override
  BaseChartBoundary calculateBoundary() {
    var boundary = LineChartBoundary(prices!);
    boundary.init();
    return boundary;
  }

  @override
  AxisTitles createBottomAxisTitle(BaseChartBoundary boundary) {
    var xAxisRenderer = XAxisMonthTitleRenderer(prices!.first.date);
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
    const List<Color> gradientColors = [
      Color(0xff00BCD4),
      Color(0xff673AB7),
    ];

    var priceToChart = PriceToChartDataConverter(prices!, 3);
    priceToChart.convert();

    return [
      LineChartBarData(
        spots: priceToChart.data,
        isCurved: true,
        gradient: const LinearGradient(
          colors: gradientColors,
        ),
        barWidth: 3,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(
          show: true,
          gradient: LinearGradient(
            colors:
                gradientColors.map((color) => color.withOpacity(0.5)).toList(),
          ),
        ),
      ),
    ];
  }
}
