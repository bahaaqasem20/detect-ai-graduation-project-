import 'package:detectai_project/constants/app_colors.dart';
import 'package:detectai_project/screens/ues_ai/video_result.dart';
import 'package:detectai_project/widgets/app_bar_use_ia.dart';
import 'package:detectai_project/widgets/custom_button.dart';
import 'package:detectai_project/widgets/upload_file.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class VideoAnalysis extends StatelessWidget {
  final String caseId;
  const VideoAnalysis({super.key, required this.caseId});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBarUseIA(title: 'Video Analysis'),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UploadFile(
              title: "Upload Video",
              description: "Upload any videos related to this case, (.mp4)",
              allowedExtensions: ['mp4'],
            ),
            SizedBox(height: screenHeight * 0.02),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(bottom: screenHeight * 0.03),
              child: CustomButton(
                text: "Result",
                onPressed: () {
                  Get.to(() => VideoResult(), arguments: {'caseId': caseId});
                },
                width: screenWidth * 0.9,
                color: AppColors.button,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
