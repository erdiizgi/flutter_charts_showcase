import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_chart_sample/core/entity/crypto_asset.dart';
import 'package:flutter_chart_sample/ui/widgets/overview/base/pie_chart_data_entry.dart';

class AssetToPieChartDataConverter {
  List<CryptoAsset> assets;
  double Function(CryptoAsset) propertyFinder;

  AssetToPieChartDataConverter(this.assets, this.propertyFinder);

  List<PieChartDataEntry> convert() {
    double total = 0;
    for (var element in assets) {
      total += propertyFinder(element);
    }

    return assets.map((e) => convertAsset(e, total)).toList();
  }

  PieChartDataEntry convertAsset(CryptoAsset asset, double totalValue) {
    var color = generateColor(asset.name);
    return PieChartDataEntry(
        findPercentage(propertyFinder(asset), totalValue), asset.name, color);
  }

  static double findPercentage(double number, double total) {
    return (number / total) * 100;
  }

  static Color generateColor(String inputString) {
    final int seed = inputString.hashCode;
    final Random random = Random(seed + 156);
    const List<Color> materialPaletteColors = [
      Color(0xff3F51B5), // Indigo
      Color(0xffE91E63), // Pink
      Color(0xff2196F3), // Blue
      Color(0xff00BCD4), // Cyan
      Color(0xff009688), // Teal
      Color(0xff4CAF50), // Green/ Green
      Color(0xffCDDC39), // Lime
      Color(0xffFFEB3B), // Yellow
      Color(0xffFFC107), // Amber
      Color(0xffFF9800), // Orange
      Color(0xffFF5722), // Deep Orange
      Color(0xff607D8B), // Blue Grey
    ];

    final int index = random.nextInt(materialPaletteColors.length);
    return materialPaletteColors[index];
  }
}
