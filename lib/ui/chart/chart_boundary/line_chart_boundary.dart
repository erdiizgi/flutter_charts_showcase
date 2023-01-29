import 'base_chart_boundary.dart';

// convenience class to calculate boundary for line charts
class LineChartBoundary<T> extends BaseChartBoundary<T> {
  final List<T> prices;

  LineChartBoundary(this.prices, double Function(T) propertyFinder)
      : super(prices, propertyFinder);

  void init() {
    minX = 0;
    maxX = prices.length.toDouble();
    minY = calculateMinY();
    maxY = calculateMaxY();
  }
}
