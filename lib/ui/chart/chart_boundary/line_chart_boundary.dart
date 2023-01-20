import 'package:flutter_chart_sample/core/entity/crypto_price.dart';

import 'base_chart_boundary.dart';

class LineChartBoundary extends BaseChartBoundary {
  final List<CryptoPrice> prices;

  LineChartBoundary(this.prices) : super();

  void init() {
    minY = 0;
    minX = 0;
    maxX = prices.length.toDouble();
    maxY = _calculateMaxY();
  }

  double _calculateMaxY() {
    var max = _findMax();
    var rounded = max.price.round();
    return rounded * 1.1;
  }

  CryptoPrice _findMax() {
    return prices.reduce(
        (value, element) => value.price > element.price ? value : element);
  }
}
