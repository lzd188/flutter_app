import 'package:flutter/material.dart';

class Product {
  final String name;
  final String description;

  Product(this.name, this.description);
}

class ProductList extends StatelessWidget {
  final List<Product> products;

  ProductList({Key key, @required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.android),
              title: Text("${products[index].name}"),
              subtitle: Text("${products[index].description}"),
              onTap: () => _navigateToDetail(context, products[index]),
            ));
  }

  _navigateToDetail(BuildContext context, Product product) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ProductDetail(product: product)));
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(result),
      duration: Duration(seconds: 1),
    ));
  }
}

class ProductDetail extends StatelessWidget {
  final Product product;

  ProductDetail({Key key, @required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${product.name}"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text("${product.description}"),
            RaisedButton(
              child: Text("buy one"),
              onPressed: () => Navigator.pop(context, "${product.name} one"),
            ),
            RaisedButton(
              child: Text("buy two"),
              onPressed: () => Navigator.pop(context, "${product.name} two"),
            ),
          ],
        ),
      ),
    );
  }
}
