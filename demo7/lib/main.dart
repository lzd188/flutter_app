import 'package:flutter/material.dart';
import 'wrap_demo.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "wrap layout",
      home: WrapLayoutDemo(),
    );
  }
}