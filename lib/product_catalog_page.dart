import 'package:flutter/material.dart';
import 'cart_page.dart';
import 'logout_page.dart'; // Import LogoutPage

class ProductCatalogPage extends StatefulWidget {
  @override
  _ProductCatalogPageState createState() => _ProductCatalogPageState();
}

class _ProductCatalogPageState extends State<ProductCatalogPage> {
  final List<Product> products = [
    Product('Product 1', 'assets/product1.jpeg', 29.99),
    Product('Product 2', 'assets/product2.jpeg', 49.99),
    Product('Product 3', 'assets/product3.jpeg', 19.99),
  ];

  // List to hold the cart items
  final List<Product> _cart = [];

  void _addToCart(Product product) {
    setState(() {
      _cart.add(product);
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('${product.name} added to cart'),
      duration: Duration(seconds: 2),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Catalog'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage(cart: _cart)),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.logout), // Add a logout icon in the AppBar
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LogoutPage()), // Navigate to LogoutPage
              );
            },
          ),
        ],
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
              onPressed: () => _addToCart(product),
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