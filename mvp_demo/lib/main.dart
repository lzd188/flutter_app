import 'package:flutter/material.dart';

import 'injection/injection.dart';
import 'modules/contract/contact_view.dart';

void main() => runApp(MyApp(Flavor.PRO));

@immutable
class MyApp extends StatelessWidget {
  final Flavor _flavor;

  MyApp(this._flavor) {
    Injector.configure(_flavor);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter MVP Demo",
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: ContactPage(),
    );
  }
}
