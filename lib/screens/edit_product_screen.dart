import 'package:flutter/material.dart';

class EditProductScreen extends StatelessWidget {
  static String routeName = "/edit-product";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Product"),
      ),
    );
  }
}
