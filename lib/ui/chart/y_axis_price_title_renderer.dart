import 'package:flutter_chart_sample/ui/chart/side_title_renderer.dart';
import 'package:intl/intl.dart';

class YAxisPriceTitleRenderer extends SideTitleRenderer {
  @override
  String convert(double value) {
    return getShortForm(value);
  }

  String getShortForm(var number) {
    var f = NumberFormat.compact(locale: "en_US");
    return f.format(number);
  }
}
