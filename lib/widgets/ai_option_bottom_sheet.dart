import 'package:flutter/material.dart';
import 'package:detectai_project/constants/app_colors.dart';

class AiOptionsBottomSheet extends StatelessWidget {
  const AiOptionsBottomSheet({
    super.key,
    required this.caseName,
    required this.caseId,
  });
  final String caseName;
  final String caseId;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsetsGeometry.all(screenWidth * 0.06),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Container(width: screenWidth * .04, height: screenHeight * .02, text),
          Text(
            "AI $caseName, $caseId",
            style: TextStyle(
              fontSize: screenWidth * .05,
              fontWeight: FontWeight.bold,
              color: AppColors.background,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: screenHeight * 0.05),
          _bulidAiButton(context, "Photo Analysis", 0),
          _bulidAiButton(context, "Video Analysis", 1),
          _bulidAiButton(context, "Text Analysis", 2),
          _bulidAiButton(context, "Sound Analysis", 3),
          _bulidAiButton(context, "AI Scenario", 4),
        ],
      ),
    );
  }

  Widget _bulidAiButton(BuildContext context, String title, int indext) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.background,
          minimumSize: Size(double.infinity, screenHeight * 0.05),
        ),
        onPressed: () {
          Navigator.pop(context);
        },

        child: Text(
          title,
          style: TextStyle(
            fontSize: screenWidth * .05,
            fontWeight: FontWeight.bold,
            color: AppColors.textLight,
          ),
        ),
      ),
    );
  }
}
