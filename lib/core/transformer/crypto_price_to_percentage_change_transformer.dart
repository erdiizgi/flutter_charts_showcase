import 'package:flutter_chart_sample/core/entity/crypto_price.dart';
import 'package:flutter_chart_sample/core/entity/crypto_percentage_change.dart';

class CryptoPriceToPctChangeTransformer {
  final List<CryptoPrice> prices;

  List<CryptoPercentageChange> changes = [];

  CryptoPriceToPctChangeTransformer(this.prices);

  List<CryptoPercentageChange> transform() {
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
}
