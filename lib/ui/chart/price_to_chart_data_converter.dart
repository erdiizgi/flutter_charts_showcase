import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_chart_sample/data/entity/crypto_price.dart';

class PriceToChartDataConverter {
  final List<CryptoPrice> prices;
  final int interval;

  List<FlSpot> data = [];

  PriceToChartDataConverter(this.prices, this.interval);

  void convert() {
    for (int i = 0; i < prices.length; i += interval) {
      data.add(FlSpot(
          i.toDouble(), double.parse(prices[i].price.toStringAsFixed(2))));
    }
  }
}
