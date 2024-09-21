import 'package:flutter/material.dart';
import 'product_catalog_page.dart'; // Import the Product model

class CartPage extends StatelessWidget {
  final List<Product> cart;

  CartPage({required this.cart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: cart.isEmpty
          ? Center(
        child: Text(
          'Your cart is empty',
          style: TextStyle(fontSize: 24),
        ),
      )
          : ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final product = cart[index];
          return ListTile(
            leading: Image.asset(product.imageUrl, width: 50, height: 50),
            title: Text(product.name),
            subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
          );
        },
      ),
      bottomNavigationBar: cart.isNotEmpty
          ? Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            // Checkout functionality can be added here
          },
          child: Text('Proceed to Checkout'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.greenAccent,
            padding: EdgeInsets.symmetric(vertical: 16),
            textStyle: TextStyle(fontSize: 18),
          ),
        ),
      )
          : SizedBox.shrink(),
    );
  }
}