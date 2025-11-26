import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductItem {
  final int id;
  final String name;
  final String sku;
  final double price;
  final int stock;
  final DateTime createdAt;
  final DateTime updatedAt;

  ProductItem({
    required this.id,
    required this.name,
    required this.sku,
    required this.price,
    required this.stock,
    required this.createdAt,
    required this.updatedAt,
  });

  static ProductItem fromJson(dynamic e) {
    final item = ProductItem(
      id: e["id"],
      name: e["name"],
      sku: e["sku"],
      price: e["price"],
      stock: e["stock"],
      createdAt: DateTime.parse(e["created_at"]),
      updatedAt: DateTime.parse(e["updated_at"]),
    );

    return item;
  }
}

class ProductProvider extends ChangeNotifier {
  List<ProductItem> items = [];
  bool _isLoading = false;
  bool _initialized = false;

  bool get isLoading => _isLoading;
  bool get isInitialized => _initialized;

  void fetchAllProduct() async {
    if (_initialized) return;

    _isLoading = true;
    notifyListeners();

    final url = Uri.parse('http://10.0.2.2:3000/products/all');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      items = (data as List).map((e) => ProductItem.fromJson(e)).toList();
      _initialized = true;
    }
    _isLoading = false;
    notifyListeners();
  }

  int get count {
    return items.length;
  }
}
