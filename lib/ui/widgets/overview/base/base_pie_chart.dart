import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_chart_sample/ui/widgets/overview/base/pie_chart_data_entry.dart';

import 'indicator.dart';

// base class for any pie chart implementation
class BasePieChart extends StatefulWidget {
  final List<PieChartDataEntry> data;
  final double limit;

  const BasePieChart(this.data, {super.key, this.limit = 0});

  @override
  State<StatefulWidget> createState() => BasePieChartState();
}

class BasePieChartState extends State<BasePieChart> {
  int touchedIndex = -1;
  Map<int, PieChartDataEntry> entries = {};

  @override
  void initState() {
    entries = widget.data.asMap();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: AspectRatio(aspectRatio: 1, child: PieChart(mainData()))),
        createIndicators()
      ],
    );
  }

  PieChartData mainData() {
    return PieChartData(
      pieTouchData: PieTouchData(
        touchCallback: (FlTouchEvent event, pieTouchResponse) {
          setState(() {
            if (!event.isInterestedForInteractions ||
                pieTouchResponse == null ||
                pieTouchResponse.touchedSection == null) {
              touchedIndex = -1;
              return;
            }
            touchedIndex = pieTouchResponse.touchedSection!.touchedSectionIndex;
          });
        },
      ),
      borderData: FlBorderData(
        show: false,
      ),
      sectionsSpace: 0,
      centerSpaceRadius: 40,
      sections: showingSections(),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(entries.length, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;

      var entry = entries[i];
      return PieChartSectionData(
        color: entry!.color,
        value: entry.value,
        title: entry.value >= widget.limit ? entry.title : "",
        radius: radius,
        titleStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: const Color(0xffffffff),
        ),
      );
    });
  }

  Widget createIndicators() {
    var indicators = <Widget>[];
    for (var data in widget.data) {
      indicators.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Indicator(
            color: data.color,
            text: data.name,
            isSquare: false,
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: indicators),
    );
  }
}
