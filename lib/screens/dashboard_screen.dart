import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/order.dart';
import 'package:shop/providers/product.dart';

import '../widgets/dashboard_card.dart';
import '../widgets/main_drawer.dart';

class DashboardScreen extends StatefulWidget {
  static String routeName = "/dashboard";

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero).then((_) {
      Provider.of<ProductProvider>(context, listen: false).fetchAllProduct();
      Provider.of<OrderProvider>(context, listen: false).fetchAllProduct();
    });
  }

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductProvider>(context);
    final order = Provider.of<OrderProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            DashboardCard(
              title: 'Total Products',
              count: product.count,
              icon: Icons.inventory_2,
              color: Colors.blue,
            ),
            SizedBox(height: 20),
            DashboardCard(
              title: 'Total Orders',
              count: order.count,
              icon: Icons.shopping_cart,
              color: Colors.green,
            ),
          ],
        ),
      ),
      drawer: MainDrawer(),
    );
  }
}
