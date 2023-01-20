import 'package:flutter_chart_sample/ui/chart/title_renderer/side_title_renderer.dart';
import 'package:intl/intl.dart';

class XAxisMonthTitleRenderer extends SideTitleRenderer {
  final DateTime initialDate;

  XAxisMonthTitleRenderer(this.initialDate);

  @override
  String convert(double value) {
    var current = initialDate.add(Duration(days: value.round()));
    var month = current.month;

    return DateFormat('MMM').format(DateTime(0, month));
  }
}
