import 'package:coffee_delivery_app/models/product.dart';
import 'package:coffee_delivery_app/providers/cart_items_provider.dart';
import 'package:coffee_delivery_app/resources/values/custom_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../resources/values/app_colors.dart';

class CardProductAdd extends StatelessWidget {
  const CardProductAdd({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final cartItems = Provider.of<CartItems>(context);
    return Container(
      decoration: BoxDecoration(
        color: AppColors.WHITE_8_OPACITY,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: Center(
              child: Text(
                product.price.toString(),
                style: Theme.of(context).textTheme.bodyLarge,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.SECONDARY_COLOR),
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () => cartItems.addItem(product.id, product.price,
                  product.title, product.drinkType, product.imageUrl),
              child: const Icon(
                CustomIcons.add,
                size: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
