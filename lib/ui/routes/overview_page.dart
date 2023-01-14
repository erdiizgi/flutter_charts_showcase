import 'package:flutter/material.dart';
import 'package:flutter_chart_sample/ui/widgets/overview/overview_widget.dart';

class OverViewPage extends StatelessWidget {
  final String title;

  const OverViewPage(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(title),
      ),
      body: OverviewWidget(),
    );
  }
}
