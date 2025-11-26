import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class ProductScreen extends StatelessWidget {
  static String routeName = "/product";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product"),
      ),
      body: Center(
        child: Text("Product Screen"),
      ),
      drawer: MainDrawer(),
    );
  }
}
