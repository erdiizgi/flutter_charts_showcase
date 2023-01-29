import 'package:fl_chart/fl_chart.dart';

// contains util methods and objects for fl_charts
class ChartUtils {

  static AxisTitles noTitles = AxisTitles(
    sideTitles: SideTitles(showTitles: false),
  );

  static FlGridData noGridData = FlGridData(
    show: false,
  );

  static FlBorderData noBorderData = FlBorderData(
    show: false,
  );

  static AxisTitles createAxisTitle(
      double size, double interval, GetTitleWidgetFunction renderer) {
    return AxisTitles(
      sideTitles: SideTitles(
        showTitles: true,
        reservedSize: size,
        interval: interval,
        getTitlesWidget: renderer,
      ),
    );
  }
}
