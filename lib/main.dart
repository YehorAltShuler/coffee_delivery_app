import 'package:coffee_delivery_app/providers/cart_items_provider.dart';
import 'package:coffee_delivery_app/providers/products_provider.dart';
import 'package:coffee_delivery_app/resources/values/app_colors.dart';
import 'package:coffee_delivery_app/screens/product_details_screen/product_details_screen.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => ProductsProvider(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => CartItemsProvider(),
        ),
      ],
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
                headlineSmall: const TextStyle(color: AppColors.WHITE_COLOR),
                titleLarge: const TextStyle(color: AppColors.WHITE_COLOR),
                titleMedium: const TextStyle(color: AppColors.WHITE_COLOR),
                titleSmall: const TextStyle(color: AppColors.WHITE_COLOR),
                labelLarge: const TextStyle(color: AppColors.WHITE_COLOR),
                labelMedium: const TextStyle(color: AppColors.WHITE_COLOR),
                labelSmall: const TextStyle(color: AppColors.WHITE_COLOR),
                bodyLarge: const TextStyle(
                    color: AppColors.WHITE_COLOR, fontFamily: 'OpenSans'),
                bodyMedium: const TextStyle(
                    color: AppColors.WHITE_COLOR, fontFamily: 'OpenSans'),
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
