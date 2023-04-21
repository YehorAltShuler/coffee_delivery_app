import 'package:coffee_delivery_app/models/cart_item.dart';
import 'package:flutter/material.dart';

class CartItemsProvider with ChangeNotifier {
  final Map<String, CartItem> _cartItems = {};

  Map<String, CartItem> get cartItems {
    return {..._cartItems};
  }

  int get itemCount {
    return _cartItems.length;
  }

  double get totalPrice {
    double total = 0;
    _cartItems.forEach((key, cartItem) {
      total += cartItem.cartItemPrice * cartItem.cartItemQuantity;
    });
    return total;
  }

  void addItem(String idKey, double price, String title, String type,
      String imageUrl, productId) {
    if (_cartItems.containsKey(idKey)) {
      return;
    } else {
      _cartItems.putIfAbsent(
        idKey,
        () => CartItem(
            cartItemId: idKey,
            cartItemType: type,
            cartItemTitle: title,
            cartItemPrice: price,
            cartItemImageUrl: imageUrl,
            cartItemQuantity: 1,
            productId: productId),
      );
    }
    notifyListeners();
  }

  void removeItem(String idKey) {
    _cartItems.remove(idKey);
    notifyListeners();
  }

  void increaseQuantity(String idKey) {
    if (_cartItems[idKey]!.cartItemQuantity >= 1) {
      _cartItems.update(
        idKey,
        (existingCartItem) => CartItem(
          cartItemType: existingCartItem.cartItemType,
          cartItemTitle: existingCartItem.cartItemTitle,
          cartItemPrice: existingCartItem.cartItemPrice,
          cartItemImageUrl: existingCartItem.cartItemImageUrl,
          cartItemQuantity: existingCartItem.cartItemQuantity + 1,
          cartItemId: existingCartItem.cartItemId,
          productId: existingCartItem.productId,
        ),
      );
    }
    notifyListeners();
  }

  void reduceQuantity(String idKey) {
    if (!_cartItems.containsKey(idKey)) {
      return;
    }
    if (_cartItems[idKey]!.cartItemQuantity > 1) {
      _cartItems.update(
        idKey,
        (existingCartItem) => CartItem(
          cartItemType: existingCartItem.cartItemType,
          cartItemTitle: existingCartItem.cartItemTitle,
          cartItemPrice: existingCartItem.cartItemPrice,
          cartItemImageUrl: existingCartItem.cartItemImageUrl,
          cartItemQuantity: existingCartItem.cartItemQuantity - 1,
          cartItemId: existingCartItem.cartItemId,
          productId: existingCartItem.productId,
        ),
      );
    } else if (_cartItems[idKey]!.cartItemQuantity == 1) {
      removeItem(idKey);
    }
    notifyListeners();
  }
}
