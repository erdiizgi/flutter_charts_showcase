import 'package:flutter/material.dart';
import 'package:flutter_chart_sample/ui/routes/overview_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Charts',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        canvasColor: const Color(0xff2C373D)
      ),
      home: const OverViewPage('Overview'),
    );
  }
}
