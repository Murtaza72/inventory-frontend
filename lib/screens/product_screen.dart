import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/product_card.dart';
import '../providers/product.dart';
import './add_product_screen.dart';

import '../widgets/main_drawer.dart';

class ProductScreen extends StatelessWidget {
  static String routeName = "/product";

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Product"),
      ),
      body: ListView.builder(
        itemBuilder: (_, i) {
          return ProductCard(products.getItems[i]);
        },
        itemCount: products.count,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AddProductScreen.routeName);
        },
        child: Icon(Icons.add),
      ),
      drawer: MainDrawer(),
    );
  }
}
