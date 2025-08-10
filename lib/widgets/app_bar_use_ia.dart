import 'package:detectai_project/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class AppBarUseIA extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  const AppBarUseIA({super.key, required this.title});

  @override
  _AppBarUseIAState createState() => _AppBarUseIAState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppBarUseIAState extends State<AppBarUseIA> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return AppBar(
      backgroundColor: AppColors.background,
      leading: IconButton(
        onPressed: () => Get.back(),
        icon: Icon(Icons.arrow_back, color: AppColors.textLight),
      ),
      title: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          widget.title,
          style: TextStyle(
            color: AppColors.textLight,
            fontSize: screenWidth * 0.06,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
