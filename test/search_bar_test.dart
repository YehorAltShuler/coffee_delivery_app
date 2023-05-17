import 'package:coffee_delivery_app/main.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  testWidgets('Test that searchBar will work', (WidgetTester tester) async {
    await mockNetworkImagesFor(() => tester.pumpWidget(const MyApp()));

    final searchBar = find.byKey(const ValueKey('Products Search Bar'));
    final productCard = find.byKey(
      const ValueKey('Home Screen Product Card'),
    );

    expect(productCard, findsNWidgets(4));

    await tester.enterText(searchBar, 'DALGONA');
    await tester.pumpAndSettle();
    expect(productCard, findsOneWidget);
  });
}
