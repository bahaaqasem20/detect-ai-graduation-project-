import 'package:detectai_project/constants/app_colors.dart';
import 'package:detectai_project/widgets/ai_option_bottom_sheet.dart';
import 'package:flutter/material.dart';

class CaseBottomSheet extends StatelessWidget {
  final String caseName;
  final String caseId;
  const CaseBottomSheet({
    super.key,
    required this.caseName,
    required this.caseId,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.all(screenWidth * 0.06),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "$caseName, $caseId",
            style: TextStyle(
              fontSize: screenWidth * 0.05,
              fontWeight: FontWeight.bold,
              color: AppColors.background,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: screenHeight * 0.05),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                builder: (context) {
                  return SizedBox(
                    height: screenHeight * 0.5,
                    child: AiOptionsBottomSheet(
                      caseName: caseName,
                      caseId: caseId,
                    ),
                  );
                },
              );
            },
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
