import 'package:flutter_chart_sample/core/entity/crypto_percentage_change.dart';

import 'base_chart_boundary.dart';

class PercentageLineChartBoundary extends BaseChartBoundary {
  final List<CryptoPercentageChange> changes;

  PercentageLineChartBoundary(this.changes) : super();

  void init() {
    minX = 0;
    maxX = changes.length.toDouble();
    minY = _calculateMinY();
    maxY = _calculateMaxY();
  }

  double _calculateMinY() {
    return _round(_findMin());
  }

  double _calculateMaxY() {
    return _round(_findMax());
  }

  double _round(CryptoPercentageChange change) {
    var rounded = change.percentageChange.round();
    return rounded * 1.1;
  }

  CryptoPercentageChange _findMax() {
    return changes.reduce((value, element) =>
        value.percentageChange > element.percentageChange ? value : element);
  }

  CryptoPercentageChange _findMin() {
    return changes.reduce((value, element) =>
        value.percentageChange < element.percentageChange ? value : element);
  }
}
