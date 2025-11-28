import 'package:flutter/material.dart';

import '../screens/auth_screen.dart';
import '../screens/dashboard_screen.dart';
import '../screens/order_screen.dart';
import '../screens/product_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text("Inventory Management"),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.dashboard_rounded),
            title: Text("Dashboard"),
            onTap: () => Navigator.of(context)
                .pushReplacementNamed(DashboardScreen.routeName),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text("Orders"),
            onTap: () => Navigator.of(context)
                .pushReplacementNamed(OrderScreen.routeName),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shopping_basket),
            title: Text("Products"),
            onTap: () => Navigator.of(context)
                .pushReplacementNamed(ProductScreen.routeName),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text("Logout"),
            onTap: () => Navigator.of(context)
                .pushReplacementNamed(AuthTabScreen.routeName),
          ),
        ],
      ),
    );
  }
}
