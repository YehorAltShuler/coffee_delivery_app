import 'package:coffee_delivery_app/providers/products_provider.dart';
import 'package:coffee_delivery_app/resources/values/app_colors.dart';
import 'package:coffee_delivery_app/resources/values/custom_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductsProvider>(context);
    final favoriteProducts = products.favoriteProducts;
    return Scaffold(
      appBar: AppBar(title: const Text('Favorites Screen')),
      body: Consumer(
        builder: (BuildContext context, value, Widget? child) {
          return ListView.builder(
            itemCount: favoriteProducts.length,
            itemBuilder: (context, index) => ListTile(
              tileColor: AppColors.DARK_PRIMARY_COLOR,
              trailing: IconButton(
                icon: Icon(CustomIcons.heart,
                    color: favoriteProducts[index].isFavorite == true
                        ? AppColors.FAVORITE_COLOR
                        : AppColors.SECONDARY_COLOR_50_OPACITY),
                onPressed: () {
                  products.toggleFavorite(favoriteProducts[index]);
                },
              ),
              title: Text(
                favoriteProducts[index].title,
              ),
            ),
          );
        },
      ),
    );
  }
}
