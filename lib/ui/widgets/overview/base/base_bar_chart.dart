import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chart_sample/ui/widgets/overview/base/chart_utils.dart';

import '../../../chart/chart_boundary/base_chart_boundary.dart';

abstract class BaseBarChart extends StatelessWidget {
  const BaseBarChart({super.key});

  @override
  Widget build(BuildContext context) {
    return BarChart(
      mainData(),
    );
  }

  BarChartData mainData() {
    var data = createChartGroupData();
    var boundary = calculateBoundary();

    return BarChartData(
        minY: boundary.minY,
        maxY: boundary.maxY,
        barTouchData: BarTouchData(
          touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: Colors.grey,
            getTooltipItem: (a, b, c, d) => null,
          ),
        ),
        titlesData: FlTitlesData(
          show: true,
          rightTitles: ChartUtils.noTitles,
          topTitles: ChartUtils.noTitles,
          bottomTitles: createBottomAxisTitle(),
          leftTitles: createLeftAxisTitle(),
        ),
        borderData: ChartUtils.noBorderData,
        barGroups: data,
        gridData: ChartUtils.noGridData);
  }

  List<BarChartGroupData> createChartGroupData();

  AxisTitles createBottomAxisTitle();

  AxisTitles createLeftAxisTitle();

  BaseChartBoundary calculateBoundary();
}
