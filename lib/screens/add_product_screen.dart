import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/product.dart';

class AddProductScreen extends StatefulWidget {
  static String routeName = "/add-product";

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _key = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _sku = TextEditingController();
  final _price = TextEditingController();
  final _stock = TextEditingController();

  @override
  void dispose() {
    super.dispose();

    _name.dispose();
    _sku.dispose();
    _price.dispose();
    _stock.dispose();
  }

  void _submit() {
    if (!_key.currentState!.validate()) return;

    final product = Provider.of<ProductProvider>(context, listen: false);
    final price, stock;

    if ((price = double.tryParse(_price.text)) == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Price should be a number')));
      return;
    }

    if ((stock = int.tryParse(_stock.text)) == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Stock should be a number')));
      return;
    }

    product.addProduct(_name.text, _sku.text, price, stock);

    _key.currentState!.reset();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Product added successfully')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Order"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _key,
          child: Column(children: [
            TextFormField(
                controller: _name,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (v) => v == null || v.isEmpty ? 'Required' : null),
            const SizedBox(height: 12),
            TextFormField(
                controller: _sku,
                decoration: const InputDecoration(labelText: 'SKU'),
                validator: (v) => v == null || v.isEmpty ? 'Required' : null),
            const SizedBox(height: 12),
            TextFormField(
                controller: _price,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Price'),
                validator: (v) => v == null || v.isEmpty ? 'Required' : null),
            const SizedBox(height: 12),
            TextFormField(
                controller: _stock,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Stock'),
                validator: (v) => v == null || v.isEmpty ? 'Required' : null),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                _submit();
              },
              child: Text('Add'),
            ),
          ]),
        ),
      ),
    );
  }
}
