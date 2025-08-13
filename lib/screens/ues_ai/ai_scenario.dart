import 'package:detectai_project/constants/app_colors.dart';
import 'package:detectai_project/widgets/app_bar_use_ia.dart';
import 'package:flutter/material.dart';

class AiScenario extends StatelessWidget {
  final String caseId;
  const AiScenario({super.key, required this.caseId});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBarUseIA(title: 'AI Scenario'),
      body: Container(
        color: AppColors.background,
        padding: EdgeInsets.all(screenWidth * 0.05),
        child: Text("AI Scenario Details"),
      ),
    );
  }
}
