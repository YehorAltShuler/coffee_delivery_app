import 'package:coffee_delivery_app/screens/cart_screen.dart';
import 'package:coffee_delivery_app/screens/favorites_screen.dart';
import 'package:coffee_delivery_app/screens/home_screen.dart';
import 'package:coffee_delivery_app/screens/news_screen.dart';
import 'package:flutter/material.dart';

class MainNavigator extends StatefulWidget {
  const MainNavigator({super.key});

  @override
  State<MainNavigator> createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  PageController _pageController = PageController();

  int _seletedIndex = 0;

  List<Widget> _screens = [
    HomeScreen(),
    CartScreen(),
    FavoritesScreen(),
    NewsScreen(),
  ];

  void _onPageChanged(int index) {
    setState(() {
      _seletedIndex = index;
    });
  }

  void _onItemTapped(int i) {
    _pageController.jumpToPage(i);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _screens,
        onPageChanged: _onPageChanged,
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).colorScheme.primary,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        unselectedItemColor: Color(0xFF746863),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ''),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: '',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
        ],
        onTap: _onItemTapped,
        currentIndex: _seletedIndex,
      ),
    );
  }
}
