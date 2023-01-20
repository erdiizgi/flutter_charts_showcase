import 'package:flutter_chart_sample/core/entity/crypto_asset.dart';

import 'base_chart_boundary.dart';

class BarChartBoundary extends BaseChartBoundary {
  final List<CryptoAsset> assets;
  final double Function(CryptoAsset) propertyFinder;

  BarChartBoundary(this.assets, this.propertyFinder) : super();

  void init() {
    minY = _calculateMinY();
    maxY = _calculateMaxY();
  }

  double _calculateMaxY() {
    var max = _findMax();
    var result = propertyFinder(max);
    return result;
  }

  double _calculateMinY() {
    var min = _findMin();
    if (propertyFinder(min) > 0) {
      return 0;
    } else {
      var result = propertyFinder(min);
      return result;
    }
  }

  CryptoAsset _findMin() {
    return assets.reduce((value, element) =>
        propertyFinder(value) < propertyFinder(element) ? value : element);
  }

  CryptoAsset _findMax() {
    return assets.reduce((value, element) =>
        propertyFinder(value) > propertyFinder(element) ? value : element);
  }
}
