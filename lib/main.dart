import 'package:flutter/material.dart';

import 'nav.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'first',
      home: Scaffold(
        appBar: AppBar(
          title: Text("商品列表"),
        ),
        body: ProductList(
          products: List<Product>.generate(
              30, (index) => Product("商品$index", "商品描述:$index")),
        ),
      ),
    );
  }
}
