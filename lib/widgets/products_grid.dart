import 'package:coffee_delivery_app/providers/products_provider.dart';
import 'package:coffee_delivery_app/widgets/ProductCard/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = productsData.items;
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 2 / 3.5,
        crossAxisCount: 2,
      ),
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) =>
          ProductCard(product: products[index]),
    );
  }
}
