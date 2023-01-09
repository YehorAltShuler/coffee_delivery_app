import 'package:coffee_delivery_app/widgets/main_navigator.dart';
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
        scaffoldBackgroundColor: const Color(0xFF201520),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFF201520),
          secondary: const Color(0xffefe3c8),
        ),
        appBarTheme: const AppBarTheme(
          color: Color(0x00201520),
          elevation: 0,
        ),
      ),
      home: const MainNavigator(),
    );
  }
}
