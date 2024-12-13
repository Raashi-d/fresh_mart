import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/grocery_provider.dart';
import 'package:fresh_mart/components/loading_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => GroceryProvider()),
        // ChangeNotifierProvider(create: (context) => CartProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
        useMaterial3: true,
      ),
      home: const Loadingscreen(),
    );
  }
}

