import 'package:fl_chart/fl_chart.dart';

class ChartDataConverter {
  static List<FlSpot> convert<T>(
      List<T> elements, double Function(T) propertyFinder, final int interval) {
    List<FlSpot> data = [];
    for (int i = 0; i < elements.length; i += interval) {
      data.add(FlSpot(i.toDouble(),
          double.parse(propertyFinder(elements[i]).toStringAsFixed(2))));
    }
    return data;
  }

  ChartDataConverter._();
}
