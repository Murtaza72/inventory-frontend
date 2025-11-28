import 'package:flutter/material.dart';

class AddOrderScreen extends StatefulWidget {
  static String routeName = "/add-order";

  @override
  State<AddOrderScreen> createState() => _AddOrderScreenState();
}

class _AddOrderScreenState extends State<AddOrderScreen> {
  final _key = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _quantity = TextEditingController();

  void _submit() {
    if (!_key.currentState!.validate()) return;
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
                decoration: const InputDecoration(labelText: 'Product Id'),
                validator: (v) => v == null || v.isEmpty ? 'Required' : null),
            const SizedBox(height: 12),
            TextFormField(
                controller: _quantity,
                decoration: const InputDecoration(labelText: 'Quantity'),
                validator: (v) => v == null || v.isEmpty ? 'Required' : null),
            const SizedBox(height: 12),
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
