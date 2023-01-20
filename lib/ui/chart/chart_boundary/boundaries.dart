import 'package:flutter_chart_sample/ui/chart/chart_boundary/base_chart_boundary.dart';

class Boundaries {
  final BaseChartBoundary first;
  final BaseChartBoundary second;

  Boundaries(this.first, this.second);

  BaseChartBoundary convolute() {
    var newBoundary = BaseChartBoundary();
    newBoundary.minX = first.minX < second.minX ? first.minX : second.minX;
    newBoundary.maxX = first.maxX > second.maxX ? first.maxX : second.maxX;
    newBoundary.minY = first.minY < second.minY ? first.minY : second.minY;
    newBoundary.maxY = first.maxY > second.maxY ? first.maxY : second.maxY;
    return newBoundary;
  }
}
