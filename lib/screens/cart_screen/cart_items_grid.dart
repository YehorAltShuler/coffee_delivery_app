import 'package:coffee_delivery_app/providers/cart_items_provider.dart';
import 'package:coffee_delivery_app/screens/cart_screen/cart_item_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItemsList extends StatelessWidget {
  const CartItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    final cartItems = Provider.of<CartItems>(context);
    final cartItemsMap = cartItems.cartItems;

    return SliverList(
        delegate: SliverChildBuilderDelegate(
      childCount: cartItemsMap.length,
      (context, index) => CartItemCard(
        cartItem: cartItemsMap.values.toList()[index],
      ),
    ));
  }
}
