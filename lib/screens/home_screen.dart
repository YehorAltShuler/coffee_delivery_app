import 'package:coffee_delivery_app/providers/products_provider.dart';
import 'package:coffee_delivery_app/widgets/products_grid.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: ProductsGrid(),
    );
  }
}
