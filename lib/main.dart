import 'package:coffee_delivery_app/resources/values/app_colors.dart';
import 'package:coffee_delivery_app/screens/main_navigator_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee Delivery App',
      theme: ThemeData(
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
    );
  }
}