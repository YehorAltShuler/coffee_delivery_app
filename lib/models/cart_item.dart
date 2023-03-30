class CartItem {
  final String cartItemId;
  final String productId;
  final String cartItemType;
  final String cartItemTitle;
  final double cartItemPrice;
  final String cartItemImageUrl;
  final int cartItemQuantity;

  CartItem({
    required this.cartItemId,
    required this.productId,
    required this.cartItemType,
    required this.cartItemTitle,
    required this.cartItemPrice,
    required this.cartItemImageUrl,
    required this.cartItemQuantity,
  });
}
