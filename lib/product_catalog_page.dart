// TODO Implement this library.
// product_catalog_page.dart
import 'package:flutter/material.dart';

class ProductCatalogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//product list
    final List<Product> products = [
      Product('Product 1', 'assets/product1.jpeg', 29.99),
      Product('Product 2', 'assets/product2.jpeg', 49.99),
      Product('Product 3', 'assets/product3.jpeg', 19.99),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Product Catalog'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            leading: Image.asset(product.imageUrl, width: 50, height: 50),
            title: Text(product.name),
            subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
            trailing: ElevatedButton(
              onPressed: () {
                //"Add to Cart" action
              },
              child: Text('Add to Cart'),
            ),
          );
        },
      ),
    );
  }
}

class Product {
  final String name;
  final String imageUrl;
  final double price;

  Product(this.name, this.imageUrl, this.price);
}
