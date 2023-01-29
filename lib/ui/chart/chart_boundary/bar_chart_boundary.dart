import 'base_chart_boundary.dart';

// convenience class to calculate boundary for bar charts
class BarChartBoundary<T> extends BaseChartBoundary<T> {
  BarChartBoundary(List<T> elements, double Function(T) propertyFinder)
      : super(elements, propertyFinder);

  void init() {
    minY = calculateMinY();
    maxY = calculateMaxY();
  }
}
