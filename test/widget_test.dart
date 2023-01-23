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
      'Given user on the main_navigator_screen When BottomNavigationBarItem[1] is pressed Then _onItemTapped is called',
      (WidgetTester tester) async {
    // ASSEMBLE

    await tester.pumpWidget(const MyApp());

    //ACT
    await tester.tap(find.byIcon(Icons.shopping_cart));
    await tester.pump();

    //ASSERT
    expect(find.text('Cart Screen'), findsOneWidget);
  });
}
