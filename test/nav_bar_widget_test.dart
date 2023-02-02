import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:coffee_delivery_app/main.dart';

void main() {
  testWidgets(
      'Given user on the main_navigator_screen When BottomNavigationBar Then there is 4 items in it',
      (WidgetTester tester) async {
    // ASSEMBLE
    await tester.pumpWidget(const MyApp());

    //ASSERT
    final bottomNavBarItems = find.byType(Icon);
    expect(bottomNavBarItems, findsNWidgets(4));
  });

  testWidgets(
      'Given user on the main_navigator_screen When BottomNavigationBarItem[i] is pressed Then _onItemTapped is called',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    final Map<IconData, String> iconButtons = {
      Icons.home: 'Home Screen',
      Icons.shopping_cart: 'Cart Screen',
      Icons.favorite: 'Favorites Screen',
      Icons.notifications: 'News Screen',
    };

    Future forEachAsyncMap(Map map) async {
      for (var element in map.entries) {
        await tester.tap(find.byIcon(element.key));
        await tester.pumpAndSettle();
        expect(find.text(element.value), findsOneWidget);
      }
    }

    await forEachAsyncMap(iconButtons);
  });
}
