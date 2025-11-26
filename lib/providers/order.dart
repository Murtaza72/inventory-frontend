import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop/providers/auth.dart';

class ProdItem {
  final int productId;
  final int quantity;
  final double price;

  ProdItem(
      {required this.productId, required this.quantity, required this.price});
}

class OrderItem {
  final int id;
  final String orderNumber;
  final double totalAmount;
  final List<ProdItem> items;

  OrderItem(
      {required this.id,
      required this.orderNumber,
      required this.totalAmount,
      required this.items});

  static OrderItem fromJson(dynamic e) {
    final item = OrderItem(
        id: e["id"],
        orderNumber: e["order_number"],
        totalAmount: e["total_amount"],
        items: e["items"]);

    return item;
  }
}

class OrderProvider extends ChangeNotifier {
  List<OrderItem> items = [];
  bool _isLoading = false;
  bool _initialized = false;

  bool get isLoading => _isLoading;
  bool get isInitialized => _initialized;

  void fetchAllProduct() async {
    if (_initialized) return;

    _isLoading = true;
    notifyListeners();

    final url = Uri.parse('http://10.0.2.2:3000/orders');
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer '},
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      items = (data as List).map((e) => OrderItem.fromJson(e)).toList();
      _initialized = true;
    }
    _isLoading = false;
    notifyListeners();
  }

  int get count {
    return items.length;
  }
}
