import 'dart:math';
import 'package:flutter/material.dart';

import '../providers/order.dart';

class OrderCard extends StatefulWidget {
  final OrderItem order;

  const OrderCard(this.order);

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text(
              "Order ${widget.order.orderNumber}",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text("\$${widget.order.totalAmount.toStringAsFixed(2)}"),
            trailing: IconButton(
              icon: Icon(expanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  expanded = !expanded;
                });
              },
            ),
          ),
          if (expanded)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              height: min((widget.order.items.length * 20 + 80) as int, 150)
                  .toDouble(),
              child: ListView(
                children: widget.order.items
                    .map<Widget>((product) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "ID ${product.productId}",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 30),
                            Text(
                              "${product.quantity}x \$${(product.price / product.quantity).toStringAsFixed(2)}",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ))
                    .toList(),
              ),
            )
        ],
      ),
    );
  }
}
