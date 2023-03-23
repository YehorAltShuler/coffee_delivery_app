class Product {
  final String drinkType;
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  final double rate;
  bool isFavorite;

  Product({
    required this.id,
    required this.drinkType,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.rate,
    required this.isFavorite,
  });

  Product copyWith(
      {String? id,
      String? title,
      String? drinkType,
      String? description,
      double? price,
      String? imageUrl,
      double? rate,
      bool? isFavorite}) {
    return Product(
        id: id ?? this.id,
        drinkType: drinkType ?? this.drinkType,
        rate: rate ?? this.rate,
        description: description ?? this.description,
        imageUrl: imageUrl ?? this.imageUrl,
        price: price ?? this.price,
        title: title ?? this.title,
        isFavorite: isFavorite ?? this.isFavorite);
  }
}
