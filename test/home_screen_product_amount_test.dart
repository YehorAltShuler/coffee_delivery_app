import 'package:coffee_delivery_app/main.dart';
import 'package:coffee_delivery_app/widgets/product_card.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Test that HomeScreen have more than 0 Product Widgets',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    final productCards = find.byType(ProductCard);
    expect(productCards, findsAtLeastNWidgets(1));
  });
}
