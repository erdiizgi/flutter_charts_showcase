import '../data/coin_cap_api.dart';
import '../data/entity/crypto_asset.dart';
import '../data/entity/crypto_price.dart';

class CryptoInfoService {
  final CoinCapApi coinCapApi = CoinCapApi();

  Future<List<CryptoPrice>> fetchDailyBtcHistory() async {
    return await coinCapApi.fetchDailyBtcHistory();
  }

  Future<List<CryptoPrice>> fetchDailyEthHistory() async {
    return await coinCapApi.fetchDailyEthHistory();
  }

  Future<List<CryptoAsset>> fetchTop10CoinAssets() async {
    return await coinCapApi.fetchTop10CoinAssets();
  }
}
