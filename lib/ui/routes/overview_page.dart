import 'package:flutter/material.dart';
import 'package:flutter_chart_sample/service/base_crypto_info_service.dart';
import 'package:flutter_chart_sample/ui/widgets/overview/overview_widget.dart';

import '../../service/crypto_info_service.dart';

class OverViewPage extends StatelessWidget {
  static const BaseCryptoInfoService service = CoinCapApiService();

  final String title;

  const OverViewPage(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: const OverviewWidget(service),
    );
  }
}
