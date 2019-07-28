import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "flutter demo",
      theme: ThemeData.dark(),
      home: MyExpandedTile(),
    );
  }
}

class MyExpandedTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("expandedTile"),
      ),
      body: Center(
        child: ExpansionTile(
          title: Text("ExpansionTile"),
          leading: Icon(Icons.ac_unit),
          backgroundColor: Colors.black38,
          children: <Widget>[
            ListTile(
              title: Text("title"),
              subtitle: Text("subtitle"),
            )
          ],
        ),
      ),
    );
  }
}
