import 'package:detectai_project/constants/app_colors.dart';
import 'package:detectai_project/screens/home_page.dart';
import 'package:detectai_project/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        fontFamily: 'SF',
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyLarge: TextStyle(color: AppColors.textLight),
          bodyMedium: TextStyle(color: AppColors.textLight),
        ),
      ),
      home: HomePage(),
    );
  }
}
