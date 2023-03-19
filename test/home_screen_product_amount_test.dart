import 'package:coffee_delivery_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  testWidgets('Test that HomeScreen have more than 0 Product Widgets',
      (WidgetTester tester) async {
    await mockNetworkImagesFor(() => tester.pumpWidget(const MyApp()));

    final productCard = find.byKey(const ValueKey('Home Screen Product Card'));
    expect(productCard, findsAtLeastNWidgets(1));
  });
}
