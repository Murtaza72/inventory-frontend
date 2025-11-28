import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/order.dart';
import './add_order_screen.dart';
import '../widgets/order_card.dart';

import '../widgets/main_drawer.dart';

class OrderScreen extends StatelessWidget {
  static String routeName = "/order";

  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<OrderProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Order"),
      ),
      body: ListView.builder(
        itemBuilder: (_, i) {
          return OrderCard(orders.getItems[i]);
        },
        itemCount: orders.count,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AddOrderScreen.routeName);
        },
        child: Icon(Icons.add),
      ),
      drawer: MainDrawer(),
    );
  }
}
