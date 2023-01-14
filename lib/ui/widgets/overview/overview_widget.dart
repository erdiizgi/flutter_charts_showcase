import 'package:flutter/material.dart';
import 'package:flutter_chart_sample/ui/common/card_with_title.dart';
import 'package:flutter_chart_sample/ui/widgets/overview/crypto_line_chart.dart';

import '../../../service/crypto_info_service.dart';

class OverviewWidget extends StatelessWidget {
  final CryptoInfoService cryptoInfoService = CryptoInfoService();

  OverviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [_createBtcChartWidget(), _createEthChartWidget()],
    );
  }

  Widget _createBtcChartWidget() {
    return CardWithTitle("BTC Price Chart", _createBtcChart());
  }

  Widget _createEthChartWidget() {
    return CardWithTitle("ETH Price Chart", _createEthChart());
  }

  Widget _createBtcChart() {
    return FutureBuilder(
        future: cryptoInfoService.fetchDailyBtcHistory(),
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
                      child: CryptoLineChart(snapshot.data),
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

  Widget _createEthChart() {
    return FutureBuilder(
        future: cryptoInfoService.fetchDailyEthHistory(),
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
                      child: CryptoLineChart(snapshot.data),
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
