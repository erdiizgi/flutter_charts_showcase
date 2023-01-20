import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chart_sample/core/entity/crypto_asset.dart';
import 'package:flutter_chart_sample/ui/chart/title_renderer/x_axis_crypto_asset_symbol_renderer.dart';
import 'package:flutter_chart_sample/ui/chart/title_renderer/y_axis_number_title_renderer.dart';
import 'package:flutter_chart_sample/ui/widgets/overview/base/base_bar_chart.dart';
import 'package:flutter_chart_sample/ui/widgets/overview/base/chart_utils.dart';

import '../../chart/chart_boundary/bar_chart_boundary.dart';
import '../../chart/chart_boundary/base_chart_boundary.dart';

class Crypto24hPercentageChangeBarChart extends BaseBarChart {
  final Color positiveBarColor = const Color(0xff00BCD4);
  final Color negativeBarColor = const Color(0xffb73a85);

  final List<CryptoAsset> assets;

  const Crypto24hPercentageChangeBarChart(this.assets, {super.key});

  @override
  AxisTitles createBottomAxisTitle() {
    var renderer = XAxisCryptoAssetSymbolRenderer(assets);
    return ChartUtils.createAxisTitle(42, 1, renderer.render);
  }

  @override
  AxisTitles createLeftAxisTitle() {
    var renderer = YAxisNumberTitleRenderer();
    return ChartUtils.createAxisTitle(46, 0.5, renderer.render);
  }

  @override
  BaseChartBoundary calculateBoundary() {
    var boundary = BarChartBoundary(assets, (value) => value.changePercent24Hr);
    boundary.init();
    return boundary;
  }

  @override
  List<BarChartGroupData> createChartGroupData() {
    List<BarChartGroupData> data = [];

    for (var asset in assets) {
      data.add(createBarChartGroupData(asset.rank, asset.changePercent24Hr));
    }

    return data;
  }

  BarChartGroupData createBarChartGroupData(int x, double y) {
    return BarChartGroupData(
      barsSpace: 4,
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: y <= 0 ? negativeBarColor : positiveBarColor,
          width: 8,
        ),
      ],
    );
  }
}
