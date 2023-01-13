import 'package:flutter_chart_sample/data/entity/crypto_price.dart';
import 'package:flutter_chart_sample/data/transformer/transformer_utils.dart';

class CryptoPriceTransformer {
  static List<CryptoPrice> fromJson(String json) {
    return TransformerUtils.fromJson(json, _parse);
  }

  static CryptoPrice _parse(Map entry) {
    var price = double.parse(entry["priceUsd"]);
    var date = DateTime.parse(entry["date"]);

    return CryptoPrice(price, date);
  }

  CryptoPriceTransformer._();
}
