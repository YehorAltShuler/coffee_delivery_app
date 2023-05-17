import 'package:coffee_delivery_app/providers/cart_items_provider.dart';
import 'package:coffee_delivery_app/resources/values/app_colors.dart';
import 'package:coffee_delivery_app/resources/values/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/cart_item.dart';
import '../product_details_screen/product_details_screen.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({super.key, required this.cartItem});

  final CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    final cartItems = Provider.of<CartItemsProvider>(context);
    return Card(
      margin: const EdgeInsets.symmetric(
          horizontal: AppConstants.k12Padding,
          vertical: AppConstants.k12Padding / 2),
      color: AppColors.FADED_PRIMARY_COLOR,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(15.0),
        onTap: () {
          Navigator.of(context).pushNamed(ProductDetailsScreen.routeName,
              arguments: cartItem.productId);
        },
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.k12Padding),
          child: IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 72,
                  width: 72,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(cartItem.cartItemImageUrl),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppConstants.k12Padding),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cartItem.cartItemType,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        Text(
                          cartItem.cartItemTitle,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        Text(
                          '\$ ${cartItem.cartItemPrice.toString()}',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.WHITE_8_OPACITY,
                  ),
                  child: Row(
                    children: [
                      Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.SECONDARY_COLOR,
                          ),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(8),
                            child: const Icon(Icons.remove_rounded),
                            onTap: () =>
                                cartItems.reduceQuantity(cartItem.cartItemId),
                          )),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppConstants.kDefaultPadding),
                        child: Text(cartItem.cartItemQuantity.toString()),
                      ),
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.SECONDARY_COLOR,
                        ),
                        child: InkWell(
                            borderRadius: BorderRadius.circular(8),
                            child: const Icon(Icons.add_rounded),
                            onTap: () => cartItems.increaseQuantity(
                                  cartItem.cartItemId,
                                )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
