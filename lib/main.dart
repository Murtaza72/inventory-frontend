import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/auth.dart';
import 'package:shop/providers/order.dart';
import 'package:shop/providers/product.dart';
import 'package:shop/screens/product_detail_screen.dart';

import './screens/dashboard_screen.dart';
import './screens/auth_screen.dart';
import './screens/order_screen.dart';
import './screens/product_screen.dart';
import './screens/add_order_screen.dart';
import './screens/add_product_screen.dart';
import './screens/edit_product_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => OrderProvider(),
        ),
      ],
      child: MaterialApp(
        title: "Inventory Management",
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF80A1C1))
              .copyWith(secondary: Color(0xFFBA3F1D)),
          textTheme: TextTheme(
            titleLarge: TextStyle(
              fontFamily: "Lato",
              fontSize: 25,
              fontStyle: FontStyle.italic,
            ),
          ),
          useMaterial3: false,
        ),
        routes: {
          "/": (ctx) => DashboardScreen(),
          AuthTabScreen.routeName: (ctx) => AuthTabScreen(),
          DashboardScreen.routeName: (ctx) => DashboardScreen(),
          ProductScreen.routeName: (ctx) => ProductScreen(),
          OrderScreen.routeName: (ctx) => OrderScreen(),
          AddProductScreen.routeName: (ctx) => AddProductScreen(),
          EditProductScreen.routeName: (ctx) => EditProductScreen(),
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          AddOrderScreen.routeName: (ctx) => AddOrderScreen()
        },
      ),
    );
  }
}
