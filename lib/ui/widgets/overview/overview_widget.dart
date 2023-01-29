import 'package:flutter/material.dart';
import 'package:flutter_chart_sample/ui/chart/converter/asset_to_pie_chart_converter.dart';
import 'package:flutter_chart_sample/ui/common/card_with_title.dart';
import 'package:flutter_chart_sample/ui/widgets/overview/base/base_pie_chart.dart';
import 'package:flutter_chart_sample/ui/widgets/overview/crypto_24h_percentage_change_bar_chart.dart';
import 'package:flutter_chart_sample/ui/widgets/overview/crypto_percentage_change_compare_line_chart.dart';
import 'package:flutter_chart_sample/ui/widgets/overview/crypto_price_line_chart.dart';

import '../../../service/base_crypto_info_service.dart';

class OverviewWidget extends StatelessWidget {
  final BaseCryptoInfoService cryptoInfoService;

  const OverviewWidget(this.cryptoInfoService, {super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _createBtcChartWidget(),
          _createEthChartWidget(),
          _createBtcVsEthChartWidget(),
          _create24hVolumeBarWidget(),
          _create24hVolumePieChartWidget()
        ],
      ),
    );
  }

  Widget _createBtcChartWidget() {
    return CardWithTitle("BTC Price Chart", _createBtcChart());
  }

  Widget _createBtcChart() {
    return _createChart((snapshot) => CryptoPriceLineChart(snapshot.data!),
        cryptoInfoService.fetchDailyBtcHistory());
  }

  Widget _createEthChartWidget() {
    return CardWithTitle("ETH Price Chart", _createEthChart());
  }

  Widget _createEthChart() {
    return _createChart((snapshot) => CryptoPriceLineChart(snapshot.data!),
        cryptoInfoService.fetchDailyEthHistory());
  }

  Widget _createBtcVsEthChartWidget() {
    return CardWithTitle(
        "BTC vs ETH Percentage Changes", _createBtcVsEthChart());
  }

  Widget _createBtcVsEthChart() {
    return _createChart(
        (snapshot) => CryptoPercentageChangeCompareLineChart(
            snapshot.data?.first, snapshot.data?.second),
        cryptoInfoService.fetchBtcVsEthPercentageChange());
  }

  Widget _create24hVolumeBarWidget() {
    return CardWithTitle("24 Hour Percentage Change", _create24hVolumeBar());
  }

  Widget _create24hVolumeBar() {
    return _createChart(
        (snapshot) => Crypto24hPercentageChangeBarChart(snapshot.data!),
        cryptoInfoService.fetchTop8CoinAssets());
  }

  Widget _create24hVolumePieChartWidget() {
    return CardWithTitle("24 Hour Volume", _create24hVolumePieChart());
  }

  Widget _create24hVolumePieChart() {
    return _createChart((snapshot) {
      var converter =
          AssetToPieChartDataConverter(snapshot.data!, (e) => e.volumeUsd24Hr);
      var data = converter.convert();
      return BasePieChart(data, limit: 5.0);
    }, cryptoInfoService.fetchTop8CoinAssets());
  }

  static Widget _createChart<T>(
      Widget Function(AsyncSnapshot<T>) widgetBuilder, Future<T> future) {
    return FutureBuilder(
        future: future,
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return Stack(
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 1.6,
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(18),
                      ),
                      color: Color(0xff232d37),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        right: 18,
                        left: 12,
                        top: 24,
                        bottom: 12,
                      ),
                      child: widgetBuilder(snapshot),
                    ),
                  ),
                )
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }));
  }
}
