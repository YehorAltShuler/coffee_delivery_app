import 'package:flutter/material.dart';

import '../models/product.dart';

class Products with ChangeNotifier {
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
    ),
  ];

  List<Product> get items {
    return [..._items];
  }

  late List<Product> filteredProducts = [..._items];

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  List<Product> get favoriteItems {
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }

  void filterProductList(List<Product> productList) {
    filteredProducts = productList;
    notifyListeners();
  }
}
