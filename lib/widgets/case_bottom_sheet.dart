import 'package:detectai_project/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CaseBottomSheet extends StatelessWidget {
  final String caseName;
  const CaseBottomSheet({super.key, required this.caseName});

  @override
  Widget build(BuildContext context) {
    // نجيب عرض وارتفاع الشاشة
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.all(screenWidth * 0.06),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            caseName,
            style: TextStyle(
              fontSize: screenWidth * 0.05,
              fontWeight: FontWeight.bold,
              color: AppColors.background,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: screenHeight * 0.05),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.button,
              minimumSize: Size(double.infinity, screenHeight * 0.05),
            ),
            child: Text(
              "Use AI",
              style: TextStyle(
                color: AppColors.textLight,
                fontSize: screenWidth * 0.045,
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.01),
          TextButton(
            onPressed: () {},
            child: Text(
              "show case data and edit",
              style: TextStyle(fontSize: screenWidth * 0.04),
            ),
          ),
        ],
      ),
    );
  }
}
