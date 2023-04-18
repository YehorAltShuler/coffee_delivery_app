import 'package:flutter/material.dart';

import '../models/product.dart';

class ProductsProvider with ChangeNotifier {
  final List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Cinamon & Cocoa',
      drinkType: 'Cappuchino',
      description:
          'A single espresso shot poured into hot foamy milk, with the surface topped with mildly sweetened cocoa powder and drizzled with scrumptious caramel syrup',
      price: 1.20,
      rate: 4.5,
      imageUrl:
          'https://media-cldnry.s-nbcnews.com/image/upload/newscms/2015_40/796316/latteartheart-11-150929.jpg',
      isFavorite: true,
    ),
    Product(
      id: 'p2',
      drinkType: 'Cappuchino',
      title: 'Drizzled with Caramel',
      description:
          'A single espresso shot poured into hot foamy milk, with the surface topped with mildly sweetened cocoa powder and drizzled with scrumptious caramel syrup',
      price: 2.20,
      rate: 4.5,
      imageUrl:
          'https://cdn.pixabay.com/photo/2021/02/03/12/00/coffee-5977682_1280.jpg',
      isFavorite: false,
    ),
    Product(
      id: 'p3',
      drinkType: 'Cappuchino',
      title: 'Bursting Blueberry',
      description:
          'A single espresso shot poured into hot foamy milk, with the surface topped with mildly sweetened cocoa powder and drizzled with scrumptious caramel syrup',
      price: 3.20,
      rate: 4.5,
      imageUrl:
          'https://i.pinimg.com/originals/d2/20/cc/d220cc7597866bd990146ee2255e3672.jpg',
      isFavorite: false,
    ),
    Product(
      id: 'p4',
      drinkType: 'Cappuchino',
      title: 'Dalgona Whipped Macha',
      description:
          'A single espresso shot poured into hot foamy milk, with the surface topped with mildly sweetened cocoa powder and drizzled with scrumptious caramel syrup',
      price: 4.20,
      rate: 4.5,
      imageUrl:
          'https://www.justonecookbook.com/wp-content/uploads/2022/12/Matcha-Latte-4598-I-1.jpg',
      isFavorite: false,
    ),
  ];

  List<Product> get items {
    return [..._items];
  }

  late final List<Product> _filteredProducts = [..._items];

  List<Product> get filteredProducts {
    return [..._filteredProducts];
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  void toggleFavorite(Product product) {
    product.isFavorite = !product.isFavorite;
    notifyListeners();
  }

  List<Product> get favoriteProducts {
    return _items.where((prodItem) => prodItem.isFavorite == true).toList();
  }

  void filterProductList(List<Product> productList) {
    _filteredProducts.clear();
    _filteredProducts.insertAll(0, productList);
    notifyListeners();
  }
}
