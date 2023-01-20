import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_chart_sample/core/entity/crypto_percentage_change.dart';

class PercentageToChartDataConverter {
  final List<CryptoPercentageChange> changes;
  final int interval;

  List<FlSpot> data = [];

  PercentageToChartDataConverter(this.changes, this.interval);

  void convert() {
    for (int i = 0; i < changes.length; i += interval) {
      data.add(FlSpot(i.toDouble(),
          double.parse(changes[i].percentageChange.toStringAsFixed(2))));
    }
  }
}
