import 'package:flutter_chart_sample/core/entity/crypto_asset.dart';
import 'package:flutter_chart_sample/core/entity/crypto_price.dart';
import 'package:flutter_chart_sample/data/http_util.dart';
import 'package:flutter_chart_sample/data/transformer/crypto_asset_transformer.dart';
import 'package:flutter_chart_sample/data/transformer/crypto_price_transformer.dart';

class CoinCapApi {
  static const String btcDailyHistoryUrl =
      "https://api.coincap.io/v2/assets/bitcoin/history?interval=d1";
  static const String ethDailyHistoryUrl =
      "https://api.coincap.io/v2/assets/ethereum/history?interval=d1";
  static const String top8CoinAssetUrl =
      "https://api.coincap.io/v2/assets?ids=bitcoin,ethereum,tether,binance-coin,usd-coin,xrp,binance-usd,cardano";

  Future<List<CryptoPrice>> fetchDailyBtcHistory() async {
    String response = await HttpUtil.httpGet(btcDailyHistoryUrl);
    return CryptoPriceTransformer.fromJson(response);
  }

  Future<List<CryptoPrice>> fetchDailyEthHistory() async {
    String response = await HttpUtil.httpGet(ethDailyHistoryUrl);
    return CryptoPriceTransformer.fromJson(response);
  }

  Future<List<CryptoAsset>> fetchTop8CoinAssets() async {
    String response = await HttpUtil.httpGet(top8CoinAssetUrl);
    return CryptoAssetTransformer.fromJson(response);
  }
}
