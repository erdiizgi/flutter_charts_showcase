import 'package:flutter_chart_sample/data/entity/crypto_price.dart';

class LineChartBoundary {
  final List<CryptoPrice> prices;

  double minX;
  double maxX;
  double minY;
  double maxY;

  LineChartBoundary(this.prices)
      : minX = 0,
        maxX = 10,
        minY = 0,
        maxY = 10;

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
