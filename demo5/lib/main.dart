import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "keep alive",
      home: Scaffold(
        body: Center(
          child: Text("center"),
        ),
      ),
    );
  }
}