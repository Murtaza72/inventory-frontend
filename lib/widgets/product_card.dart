import 'package:flutter/material.dart';
import 'package:shop/providers/product.dart';

import '../screens/edit_product_screen.dart';
import '../screens/product_detail_screen.dart';

class ProductCard extends StatelessWidget {
  final ProductItem product;

  const ProductCard(this.product);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(product.id.toString()),
      background: Container(
        color: Theme.of(context).colorScheme.error,
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.all(20),
        child: Icon(Icons.delete),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (_) {
        return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text("Delete?"),
            content: Text("Do you want to delete this product?"),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(ctx).pop(true),
                child: Text("Yes"),
              ),
              TextButton(
                onPressed: () => Navigator.of(ctx).pop(false),
                child: Text("No"),
              ),
            ],
          ),
        );
      },
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(ProductDetailScreen.routeName,
              arguments: {"name": product.name});
        },
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          product.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Spacer(),
                        IconButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(EditProductScreen.routeName);
                            },
                            icon: Icon(Icons.edit))
                      ],
                    ),
                    Text(
                      "SKU: ${product.sku}",
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[700],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "KWD ${product.price.toStringAsFixed(2)}",
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: product.stock > 0
                                ? Colors.green[100]
                                : Colors.red[100],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            product.stock > 0
                                ? "In Stock (${product.stock})"
                                : "Out of Stock",
                            style: TextStyle(
                              color: product.stock > 0
                                  ? Colors.green[800]
                                  : Colors.red[800],
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
