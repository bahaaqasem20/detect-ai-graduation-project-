import 'package:detectai_project/screens/ues_ai/ai_scenario.dart';
import 'package:detectai_project/screens/ues_ai/image_analysis.dart';
import 'package:detectai_project/screens/ues_ai/sound_analysis.dart';
import 'package:detectai_project/screens/ues_ai/text_analysis.dart';
import 'package:detectai_project/screens/ues_ai/video_analysis.dart';
import 'package:flutter/material.dart';
import 'package:detectai_project/constants/app_colors.dart';
import 'package:get/route_manager.dart';

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
          _bulidAiButton(context, "Image Analysis", 0),
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
          backgroundColor: AppColors.button,
          minimumSize: Size(double.infinity, screenHeight * 0.05),
        ),
        onPressed: () {
          Navigator.pop(context);
          switch (indext) {
            case 0:
              Get.to(() => ImageAnalysis(caseId: caseId));
              break;
            case 1:
              Get.to(() => VideoAnalysis(caseId: caseId));
              break;
            case 2:
              Get.to(() => TextAnalysis(caseId: caseId));
              break;
            case 3:
              Get.to(() => SoundAnalysis(caseId: caseId));
              break;
            case 4:
              Get.to(() => AiScenario(caseId: caseId));
              break;
          }
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
