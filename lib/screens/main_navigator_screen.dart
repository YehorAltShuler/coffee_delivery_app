import 'package:coffee_delivery_app/resources/values/app_colors.dart';
import 'package:coffee_delivery_app/screens/cart_screen.dart';
import 'package:coffee_delivery_app/screens/favorites_screen.dart';
import 'package:coffee_delivery_app/screens/home_screen.dart';
import 'package:coffee_delivery_app/screens/news_screen.dart';
import 'package:flutter/material.dart';

class MainNavigatorScreen extends StatefulWidget {
  const MainNavigatorScreen({super.key});

  @override
  State<MainNavigatorScreen> createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigatorScreen> {
  final PageController _pageController = PageController();

  int _seletedIndex = 0;

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
        onPageChanged: _onPageChanged,
        children: const [
          HomeScreen(),
          CartScreen(),
          FavoritesScreen(),
          NewsScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).colorScheme.primary,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        unselectedItemColor: AppColors.UNSELECTED_SECONDARY_COLOR,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'News'),
        ],
        onTap: _onItemTapped,
        currentIndex: _seletedIndex,
      ),
    );
  }
}
