import '../core/entity/compare_percentage_change.dart';
import '../core/entity/crypto_asset.dart';
import '../core/entity/crypto_price.dart';
import '../core/entity/crypto_percentage_change.dart';
import '../core/transformer/crypto_price_to_percentage_change_transformer.dart';

abstract class BaseCryptoInfoService {
  Future<List<CryptoPrice>> fetchDailyBtcHistory();

  Future<List<CryptoPrice>> fetchDailyEthHistory();

  Future<List<CryptoAsset>> fetchTop8CoinAssets();

  Future<List<CryptoPercentageChange>> fetchDailyBtcPercentage() async {
    var history = await fetchDailyBtcHistory();
    var transformer = CryptoPriceToPctChangeTransformer(history);
    return transformer.transform();
  }

  Future<List<CryptoPercentageChange>> fetchDailyEthPercentage() async {
    var history = await fetchDailyEthHistory();
    var transformer = CryptoPriceToPctChangeTransformer(history);
    return transformer.transform();
  }

  Future<CompareCryptoPercentageChange> fetchBtcVsEthPercentageChange() async {
    var btc = await fetchDailyBtcPercentage();
    var eth = await fetchDailyEthPercentage();

    return CompareCryptoPercentageChange(btc, eth);
  }
}
