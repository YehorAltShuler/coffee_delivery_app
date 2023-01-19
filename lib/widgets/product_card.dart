import 'package:coffee_delivery_app/resources/values/app_colors.dart';
import 'package:coffee_delivery_app/widgets/card_product_add.dart';
import 'package:coffee_delivery_app/widgets/card_product_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    return Card(
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: AppColors.FADED_PRIMARY_COLOR,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: CardProductImage(
                  rate: product.rate, imageUrl: product.imageUrl),
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  product.title,
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
            ),
            CardProductAdd(price: product.price)
          ],
        ),
      ),
    );
  }
}
