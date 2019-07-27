import 'package:flutter/material.dart';

import 'learning_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'first',
      home: Scaffold(
        appBar: AppBar(
          title: Text('appbar'),
        ),
        body: Container(
//          height: 500,
//          width: 400,
//          alignment: Alignment.center,
          child: MyCard(),
        ),
      ),
    );
  }
}
