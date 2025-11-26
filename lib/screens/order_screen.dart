import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class OrderScreen extends StatelessWidget {
  static String routeName = "/order";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order"),
      ),
      body: Center(
        child: Text("Order Screen"),
      ),
      drawer: MainDrawer(),
    );
  }
}
