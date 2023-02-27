class Product {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  final double rate;
  final bool isFavorite;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.rate,
    this.isFavorite = false,
  });

  Product copyWith(
      {String? id,
      String? title,
      String? description,
      double? price,
      String? imageUrl,
      double? rate,
      bool? isFavorite}) {
    return Product(
        id: id ?? this.id,
        rate: rate ?? this.rate,
        description: description ?? this.description,
        imageUrl: imageUrl ?? this.imageUrl,
        price: price ?? this.price,
        title: title ?? this.title,
        isFavorite: isFavorite ?? this.isFavorite);
  }
}
