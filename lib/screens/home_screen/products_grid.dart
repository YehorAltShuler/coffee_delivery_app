import 'package:coffee_delivery_app/screens/home_screen/product_card/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/products_provider.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductsProvider>(context);
    final filteredProducts = products.filteredProducts;
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 2 / 3.5,
        crossAxisCount: 2,
      ),
      delegate: SliverChildBuilderDelegate(
        childCount: filteredProducts.length,
        (BuildContext context, int index) => ProductCard(
          product: filteredProducts[index],
          key: const ValueKey('Home Screen Product Card'),
        ),
      ),
    );
  }
}
