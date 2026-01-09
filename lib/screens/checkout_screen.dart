import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  // This key acts like a "master switch" for the form
  final _formKey = GlobalKey<FormState>();

  void _submitOrder() {
    // This triggers all the "validator" logic below
    if (_formKey.currentState!.validate()) {
      // If valid, show a success dialog
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Icon(Icons.check_circle, color: Colors.green, size: 60),
          content: const Text("Order placed successfully!", textAlign: TextAlign.center),
          actions: [
            TextButton(
              onPressed: () {
                Provider.of<CartProvider>(context, listen: false).clearCart();
  
  Navigator.of(ctx).pop();
  Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
              },
              child: const Text("Back to Store"),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Checkout")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, // Attach the key here
          child: ListView(
            children: [
              const Text("Shipping Address", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(labelText: "Full Name", border: OutlineInputBorder()),
                validator: (value) {
                  if (value == null || value.isEmpty) return "Please enter your name";
                  return null;
                },
              ),
              const SizedBox(height: 15),
              TextFormField(
                decoration: const InputDecoration(labelText: "Email Address", border: OutlineInputBorder()),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || !value.contains('@')) return "Enter a valid email";
                  return null;
                },
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _submitOrder,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black, padding: const EdgeInsets.symmetric(vertical: 15)),
                child: const Text("Confirm Order", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}