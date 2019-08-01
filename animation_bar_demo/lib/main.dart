import 'package:flutter/material.dart';

import 'chart_pages.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter demo",
      home:  BarChartPage(),
    );
  }
}
