import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chart_sample/data/entity/crypto_price.dart';
import 'package:flutter_chart_sample/ui/chart/x_axis_month_title_renderer.dart';

import '../../chart/line_chart_boundary.dart';
import '../../chart/price_to_chart_data_converter.dart';
import '../../chart/y_axis_price_title_renderer.dart';

class CryptoLineChart extends StatelessWidget {
  static const List<Color> gradientColors = [
    Color(0xff00BCD4),
    Color(0xff673AB7),
  ];
  static const int titlesOnYAxis = 5;
  static const int titlesOnXAxis = 8;
  static AxisTitles noTitles = AxisTitles(
    sideTitles: SideTitles(showTitles: false),
  );

  final List<CryptoPrice>? prices;

  const CryptoLineChart(this.prices, {super.key});

  @override
  Widget build(BuildContext context) {
    var boundary = LineChartBoundary(prices!);
    boundary.init();
    var xAxisRenderer = XAxisMonthTitleRenderer(prices!.first.date);
    var yAxisRenderer = YAxisPriceTitleRenderer();

    var priceToChart = PriceToChartDataConverter(prices!, 3);
    priceToChart.convert();

    return LineChart(
      mainData(boundary, xAxisRenderer, yAxisRenderer, priceToChart),
    );
  }

  LineChartData mainData(
      LineChartBoundary boundary,
      XAxisMonthTitleRenderer xAxisRenderer,
      YAxisPriceTitleRenderer yAxisRenderer,
      PriceToChartDataConverter priceToChart) {
    return LineChartData(
      gridData: FlGridData(
        show: false,
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: noTitles,
        topTitles: noTitles,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: boundary.maxX / (titlesOnXAxis - 1),
            getTitlesWidget: xAxisRenderer.render,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: boundary.maxY / titlesOnYAxis,
            getTitlesWidget: yAxisRenderer.render,
            reservedSize: 55,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: boundary.minX,
      maxX: boundary.maxX,
      minY: boundary.minY,
      maxY: boundary.maxY,
      lineBarsData: [
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
              colors: gradientColors
                  .map((color) => color.withOpacity(0.5))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
