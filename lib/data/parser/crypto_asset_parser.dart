import 'package:flutter_chart_sample/core/entity/crypto_asset.dart';
import 'package:flutter_chart_sample/data/parser/transformer_utils.dart';

// helps for parsing crypto asset based on coin cap api response
class CryptoAssetParser {
  static const String nameField = "name";
  static const String symbolField = "symbol";
  static const String rankField = "rank";
  static const String marketCapUsdField = "marketCapUsd";
  static const String volumeUsd24HrField = "volumeUsd24Hr";
  static const String changePct24HrField = "changePercent24Hr";

  static List<CryptoAsset> fromJson(String json) {
    return TransformerUtils.fromJson(json, _parse);
  }

  static CryptoAsset _parse(Map entry) {
    var name = entry[nameField];
    var symbol = entry[symbolField];
    var rank = int.parse(entry[rankField]);
    var marketCapUsd = double.parse(entry[marketCapUsdField]);
    var volumeUsd24Hr = double.parse(entry[volumeUsd24HrField]);
    var changePercent24Hr = double.parse(entry[changePct24HrField]);

    return CryptoAsset(
        name, symbol, rank, marketCapUsd, volumeUsd24Hr, changePercent24Hr);
  }

  CryptoAssetParser._();
}
