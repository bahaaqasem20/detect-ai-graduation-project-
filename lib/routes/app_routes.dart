import 'package:detectai_project/screens/account_screen.dart';
import 'package:detectai_project/screens/crime_report_form/crf_main.dart';
import 'package:detectai_project/screens/home_screen.dart';
import 'package:detectai_project/screens/main_screen.dart';
import 'package:detectai_project/screens/notification_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String mainScreen = '/';
  static const String home = '/home';
  static const String add = '/add';
  static const String notifications = '/notifications';
  static const String account = '/account';

  static Map<String, WidgetBuilder> routes = {
    mainScreen: (context) => const MainScreen(),
    home: (context) => const HomeScreen(),
    add: (context) => const CrfMain(),
    notifications: (context) => const NotificationScreen(),
    account: (context) => const AccountScreen(),
  };
}
