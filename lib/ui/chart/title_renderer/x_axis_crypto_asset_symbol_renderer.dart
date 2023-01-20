import 'package:flutter_chart_sample/ui/chart/title_renderer/side_title_renderer.dart';

import '../../../core/entity/crypto_asset.dart';

class XAxisCryptoAssetSymbolRenderer extends SideTitleRenderer {
  final List<CryptoAsset> assets;

  XAxisCryptoAssetSymbolRenderer(this.assets);

  @override
  String convert(double value) {
    int rank = value.toInt();
    var asset = assets.firstWhere((element) => element.rank == rank);
    return asset.symbol;
  }
}
