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
      'Given user on the main_navigator_screen When BottomNavigationBarItem[0] is pressed Then _onItemTapped is called',
      (WidgetTester tester) async {
    // ASSEMBLE

    await tester.pumpWidget(const MyApp());

    final Map iconButtons = {
      find.byIcon(Icons.home): 'Home Screen',
      find.byIcon(Icons.shopping_cart): 'Cart Screen',
      find.byIcon(Icons.favorite): 'Favorites Screen',
      find.byIcon(Icons.notifications): 'News Screen',
    };

    //ACT

    // ignore: void_checks
    iconButtons.forEach((key, value) async* {
      await tester.tap(key);
      //ASSERT
      expect(value, findsOneWidget);
    });
  });
}
