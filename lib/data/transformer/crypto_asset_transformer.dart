import 'package:flutter_chart_sample/data/entity/crypto_asset.dart';
import 'package:flutter_chart_sample/data/transformer/transformer_utils.dart';

class CryptoAssetTransformer {
  static List<CryptoAsset> fromJson(String json) {
    return TransformerUtils.fromJson(json, _parse);
  }

  static CryptoAsset _parse(Map entry) {
    var name = entry["name"];
    var rank = int.parse(entry["rank"]);
    var marketCapUsd = double.parse(entry["marketCapUsd"]);
    var volumeUsd24Hr = double.parse(entry["volumeUsd24Hr"]);
    var changePercent24Hr = double.parse(entry["changePercent24Hr"]);

    return CryptoAsset(
        name, rank, marketCapUsd, volumeUsd24Hr, changePercent24Hr);
  }

  CryptoAssetTransformer._();
}
