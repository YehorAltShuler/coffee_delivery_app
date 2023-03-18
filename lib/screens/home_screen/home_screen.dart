import 'package:coffee_delivery_app/screens/home_screen/product_card/search_bar_sliver.dart';
import 'package:flutter/material.dart';

import 'products_grid.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverAppBar(
              title: Text('Home Screen'),
              expandedHeight: 142,
            ),
            SliverPersistentHeader(
              delegate: SearchBarSliver(maxExtent: 120, minExtent: 120),
              floating: true,
            ),
            const ProductsGrid(),
          ],
        ),
      ),
    );
  }
}
