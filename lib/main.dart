import 'package:detectai_project/auth/auth_gate.dart';
import 'package:detectai_project/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  // supabase
  await Supabase.initialize(
    url: 'https://lblxnpaemgjjroenefhz.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImxibHhucGFlbWdqanJvZW5lZmh6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTkxNzcxNTcsImV4cCI6MjA3NDc1MzE1N30.xIzfBIKJAzDC41FuBhSQPGNxBWJv8vbzcsKPhG3tOvY',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        fontFamily: 'SF',
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyLarge: TextStyle(color: AppColors.textLight),
          bodyMedium: TextStyle(color: AppColors.textLight),
        ),
      ),
      home: AuthGate(),
    );
  }
}
