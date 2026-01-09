import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart'; // Add this
import 'screens/product_list_screen.dart';
import 'screens/product_detail_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/checkout_screen.dart';
import 'screens/auth_screen.dart'; // Add this
import 'providers/cart_provider.dart';
import 'providers/auth_provider.dart'; // Add this
import 'firebase_options.dart'; // Add this line

void main() async {
  // 1. You MUST have this line first
  WidgetsFlutterBinding.ensureInitialized();

  // 2. You MUST await the initialization
  try {
   await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  } catch (e) {
    print("Firebase initialization failed: $e");
  }

  // 3. Only then do you run the app
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 2. We watch the auth state to decide which screen to show first
    final authProvider = context.watch<AuthProvider>();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // If logged in, show Store. If not, show Login.
      home: authProvider.isAuthenticated 
          ? const ProductListScreen() 
          : const AuthScreen(),
      routes: {
        '/product-detail': (context) => const ProductDetailScreen(),
        '/cart': (context) => const CartScreen(),
        '/checkout': (context) => const CheckoutScreen(),
      },
    );
  }
}