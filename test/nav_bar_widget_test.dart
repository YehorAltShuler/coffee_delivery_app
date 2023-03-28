import 'package:coffee_delivery_app/resources/values/custom_icons.dart';
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
    expect(
        (find
                    .byKey(const ValueKey('BottomNavigationBar'))
                    .evaluate()
                    .single
                    .widget as BottomNavigationBar)
                .items
                .length ==
            4,
        true);
  });

  testWidgets(
      'Given user on the main_navigator_screen When BottomNavigationBarItem[i] is pressed Then _onItemTapped is called',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    final Map<IconData, String> iconButtons = {
      CustomIcons.home: 'Home Screen',
      CustomIcons.cart: 'Cart Screen',
      CustomIcons.heart: 'Favorites Screen',
      CustomIcons.bell: 'News Screen',
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
