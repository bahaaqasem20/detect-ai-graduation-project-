import 'package:detectai_project/constants/app_colors.dart';
import 'package:detectai_project/screens/ues_ai/text_result.dart';
import 'package:detectai_project/widgets/app_bar_use_ia.dart';
import 'package:detectai_project/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class TextAnalysis extends StatelessWidget {
  final String caseId;
  const TextAnalysis({super.key, required this.caseId});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBarUseIA(title: 'Text Analysis'),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.02),
            // Spacer(),
            Expanded(
              child: TextField(
                textAlignVertical: TextAlignVertical.top,
                maxLines: null, // يسمح بسطور متعددة
                expands: true, // يملأ مساحة الـ SizedBox.expand
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),

                  hintText: 'write your text here...',
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.06),
            Padding(
              padding: EdgeInsets.only(bottom: screenHeight * 0.03),
              child: CustomButton(
                text: "Result",
                onPressed: () {
                  Get.to(() => TextResult(), arguments: caseId);
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
