import 'package:flutter/material.dart';
import '../models/product.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. "Catch" the product data passed from the grid
    final product = ModalRoute.of(context)!.settings.arguments as Product;

    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView( // Allows scrolling on small screens
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 2. Large Product Image
            // REPLACE your current Image.network with this:
Hero(
  tag: product.id, // This matches the tag you put in the List screen
  child: Image.network(
    product.image,
    height: 300,
    width: double.infinity,
    fit: BoxFit.cover,
  ),
),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Look for the Text widget inside your Detail Screen Column
Text(
  product.description, // Now it shows the real description from the API!
  style: const TextStyle(fontSize: 16, color: Colors.grey, height: 1.5),
),
                  const SizedBox(height: 10),
                  Text(
                    '\$${product.price}',
                    style: const TextStyle(fontSize: 22, color: Colors.blueAccent, fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Product Description",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "This is a premium high-quality product. It features a modern design and durable materials, perfect for your daily shopping needs.",
                    style: TextStyle(fontSize: 16, color: Colors.grey, height: 1.5),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // 3. Static "Add to Cart" Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ElevatedButton(
          // Find your ElevatedButton at the bottom
onPressed: () {
  // This sends the product to the "Brain"
  Provider.of<CartProvider>(context, listen: false).addToCart(product);
  
  // UX: Show a little "Success" message at the bottom
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('${product.name} added to cart!'),
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.green,
    ),
  );
},
          
          
           // Non-functional for Level 1
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(vertical: 15),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          child: const Text("Add to Cart", style: TextStyle(color: Colors.white, fontSize: 18)),
        ),
      ),
    );
  }
}