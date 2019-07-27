import 'package:flutter/material.dart';

class EachView extends StatelessWidget {
  final String title;

  EachView({Key key, @required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(title),
      ),
    );
  }
}
