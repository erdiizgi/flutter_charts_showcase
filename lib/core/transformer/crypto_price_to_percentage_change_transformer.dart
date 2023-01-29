import 'package:flutter_chart_sample/core/entity/crypto_price.dart';
import 'package:flutter_chart_sample/core/entity/crypto_percentage_change.dart';

// transforms the list of crypto prices to changes in percentage
class CryptoPriceToPctChangeTransformer {
  static List<CryptoPercentageChange> transform(List<CryptoPrice> prices) {
    List<CryptoPercentageChange> changes = [];

    for (int i = 1; i < prices.length; i++) {
      changes.add(
        CryptoPercentageChange(
            _percentageChange(prices[i - 1].price, prices[i].price),
            prices[i].date),
      );
    }

    return changes;
  }

  static double _percentageChange(double oldValue, double newValue) {
    return ((newValue - oldValue) / oldValue) * 100;
  }

  CryptoPriceToPctChangeTransformer._();
}
