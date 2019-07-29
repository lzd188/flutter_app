import 'package:flutter/material.dart';
import 'draggable_widget_demo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter demo",
      theme: ThemeData.light(),
      home: Scaffold(
        body: DraggableContainerDemo(),
      )
    );
  }
}
