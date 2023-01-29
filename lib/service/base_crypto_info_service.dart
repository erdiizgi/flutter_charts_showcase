import '../core/entity/compare_percentage_change.dart';
import '../core/entity/crypto_asset.dart';
import '../core/entity/crypto_percentage_change.dart';
import '../core/entity/crypto_price.dart';
import '../core/transformer/crypto_price_to_percentage_change_transformer.dart';

// service that helps to receive crypto information, mind that this abstraction
// does not depend on any api, keep it that way!
abstract class BaseCryptoInfoService {
  Future<List<CryptoPrice>> fetchDailyBtcHistory();

  Future<List<CryptoPrice>> fetchDailyEthHistory();

  Future<List<CryptoAsset>> fetchTop8CoinAssets();

  const BaseCryptoInfoService();

  Future<List<CryptoPercentageChange>> fetchDailyBtcPercentage() async {
    var history = await fetchDailyBtcHistory();
    return CryptoPriceToPctChangeTransformer.transform(history);
  }

  Future<List<CryptoPercentageChange>> fetchDailyEthPercentage() async {
    var history = await fetchDailyEthHistory();
    return CryptoPriceToPctChangeTransformer.transform(history);
  }

  Future<CompareCryptoPercentageChange> fetchBtcVsEthPercentageChange() async {
    var btc = await fetchDailyBtcPercentage();
    var eth = await fetchDailyEthPercentage();

    return CompareCryptoPercentageChange(btc, eth);
  }
}
