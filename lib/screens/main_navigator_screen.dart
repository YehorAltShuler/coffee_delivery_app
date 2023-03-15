import 'package:coffee_delivery_app/resources/values/app_colors.dart';
import 'package:coffee_delivery_app/screens/cart_screen.dart';
import 'package:coffee_delivery_app/screens/favorites_screen.dart';
import 'package:coffee_delivery_app/screens/home_screen.dart';
import 'package:coffee_delivery_app/screens/news_screen.dart';
import 'package:flutter/material.dart';

import '../resources/values/custom_icons.dart';

class MainNavigatorScreen extends StatefulWidget {
  const MainNavigatorScreen({super.key});

  @override
  State<MainNavigatorScreen> createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigatorScreen> {
  final PageController _pageController = PageController();

  int _selectedIndex = 0;

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
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
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(boxShadow: [
          BoxShadow(
            color: AppColors.NAV_BAR_SHADOW_COLOR,
            blurRadius: 10,
            offset: Offset(0, -1),
          )
        ]),
        child: BottomNavigationBar(
          key: const ValueKey('BottomNavigationBar'),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.NAV_BAR_COLOR,
          selectedItemColor: Theme.of(context).colorScheme.secondary,
          unselectedItemColor: AppColors.FADED_SECONDARY_COLOR,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(CustomIcons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(CustomIcons.cart), label: 'Cart'),
            BottomNavigationBarItem(
              icon: Icon(CustomIcons.heart),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
                icon: Icon(CustomIcons.bell), label: 'News'),
          ],
          onTap: _onItemTapped,
          currentIndex: _selectedIndex,
        ),
      ),
    );
  }
}
