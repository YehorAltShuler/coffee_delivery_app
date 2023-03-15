import 'package:coffee_delivery_app/providers/products_provider.dart';
import 'package:coffee_delivery_app/resources/values/app_colors.dart';
import 'package:coffee_delivery_app/screens/ProductDetails/product_details_screen.dart';
import 'package:coffee_delivery_app/screens/main_navigator_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => Products(),
      child: MaterialApp(
        title: 'Coffee Delivery App',
        theme: ThemeData(
          fontFamily: 'Rosarivo',
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            backgroundColor: AppColors.SECONDARY_COLOR,
          )),
          textTheme: ThemeData().textTheme.copyWith(
                headlineSmall: const TextStyle(color: Colors.white),
                labelLarge: const TextStyle(color: Colors.white),
                titleMedium: const TextStyle(color: Colors.white),
                titleSmall: const TextStyle(color: Colors.white),
                labelMedium: const TextStyle(color: Colors.white),
                labelSmall: const TextStyle(color: Colors.white),
                bodyMedium: const TextStyle(
                    color: Colors.white, fontFamily: 'OpenSans'),
              ),
          scaffoldBackgroundColor: AppColors.PRIMARY_COLOR,
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: AppColors.PRIMARY_COLOR,
            secondary: AppColors.SECONDARY_COLOR,
          ),
          appBarTheme: const AppBarTheme(
            color: AppColors.PRIMARY_COLOR,
            elevation: 0,
          ),
        ),
        home: const MainNavigatorScreen(),
        routes: {
          ProductDetailsScreen.routeName: (context) =>
              const ProductDetailsScreen()
        },
      ),
    );
  }
}
