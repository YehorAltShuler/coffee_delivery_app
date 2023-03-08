import 'package:coffee_delivery_app/resources/values/app_colors.dart';
import 'package:coffee_delivery_app/widgets/product_card/card_product_add.dart';
import 'package:coffee_delivery_app/widgets/product_card/card_product_image.dart';
import 'package:flutter/material.dart';

import '../../models/product.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
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
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headline6,
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
