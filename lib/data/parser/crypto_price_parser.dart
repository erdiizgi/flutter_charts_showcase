import 'package:flutter_chart_sample/core/entity/crypto_price.dart';
import 'package:flutter_chart_sample/data/parser/transformer_utils.dart';

// helps for parsing crypto price based on coin cap api response
class CryptoPriceParser {
  static const String priceUsdField = "priceUsd";
  static const String dateField = "date";

  static List<CryptoPrice> fromJson(String json) {
    return TransformerUtils.fromJson(json, _parse);
  }

  static CryptoPrice _parse(Map entry) {
    var price = double.parse(entry[priceUsdField]);
    var date = DateTime.parse(entry[dateField]);

    return CryptoPrice(price, date);
  }

  CryptoPriceParser._();
}
