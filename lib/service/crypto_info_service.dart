import '../core/entity/crypto_asset.dart';
import '../core/entity/crypto_price.dart';
import '../data/coin_cap_api.dart';
import 'base_crypto_info_service.dart';

class CryptoInfoService extends BaseCryptoInfoService {
  final CoinCapApi coinCapApi = CoinCapApi();

  @override
  Future<List<CryptoPrice>> fetchDailyBtcHistory() async {
    return await coinCapApi.fetchDailyBtcHistory();
  }

  @override
  Future<List<CryptoPrice>> fetchDailyEthHistory() async {
    return await coinCapApi.fetchDailyEthHistory();
  }

  @override
  Future<List<CryptoAsset>> fetchTop8CoinAssets() async {
    return await coinCapApi.fetchTop8CoinAssets();
  }
}
