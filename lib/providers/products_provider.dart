import 'package:coffee_delivery_app/models/product.dart';
import 'package:flutter/material.dart';

class Products with ChangeNotifier {
  final List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Cinamon & Cocoa',
      description: 'Cappuchino with cinnamon & Cocoa',
      price: 1.20,
      rate: 4.5,
      imageUrl:
          'https://media-cldnry.s-nbcnews.com/image/upload/newscms/2015_40/796316/latteartheart-11-150929.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Drizzled with Caramel',
      description: 'Cappuchino Drizzled with Caramel',
      price: 2.20,
      rate: 4.5,
      imageUrl:
          'https://cdn.pixabay.com/photo/2021/02/03/12/00/coffee-5977682_1280.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Bursting Blueberry',
      description: 'Bursting Blueberry - exactly what you need for the winter.',
      price: 19.99,
      rate: 4.5,
      imageUrl:
          'https://i.pinimg.com/originals/d2/20/cc/d220cc7597866bd990146ee2255e3672.jpg',
    ),
    Product(
      id: 'p4',
      title: 'Dalgona Whipped Macha',
      description: 'Dalgona Whipped Macha Latte, so green',
      price: 49.99,
      rate: 4.5,
      imageUrl:
          'https://www.justonecookbook.com/wp-content/uploads/2022/12/Matcha-Latte-4598-I-1.jpg',
    ),
  ];

  List<Product> get items {
    return [..._items];
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  List<Product> get favoriteItems {
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }

  void addProduct() {
    // _items.add(value);
    notifyListeners();
  }
}
