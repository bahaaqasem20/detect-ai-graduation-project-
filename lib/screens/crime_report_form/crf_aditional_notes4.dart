import 'package:detectai_project/constants/app_colors.dart';
import 'package:detectai_project/constants/input_field_type.dart';
import 'package:detectai_project/widgets/ReusableInputField.dart';
import 'package:detectai_project/widgets/custom_button.dart';
import 'package:detectai_project/widgets/upload_file.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class CrfAditionalNotes extends StatelessWidget {
  final criminalRecord = TextEditingController();
  final lastPerson = TextEditingController();
  final victimBehavior = TextEditingController();

  CrfAditionalNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.background,
        title: const Text(
          "Crime Report Form",
          style: TextStyle(color: AppColors.textLight),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                "Additional notes",
                style: TextStyle(
                  color: AppColors.textLight,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 18),
              ReusableInputField(
                label: 'Does the victim have a criminal record ?',
                type: InputFieldType.dropdown,
                controller: criminalRecord,
                dropdownItems: ['yes, he/she does', 'no, he/she does not'],
              ),
              SizedBox(height: 12),
              ReusableInputField(
                label: 'Who was the last person to see the victim ?',
                type: InputFieldType.text,
                controller: lastPerson,
              ),
              SizedBox(height: 12),
              ReusableInputField(
                label: 'Victims behavior in recent days',
                type: InputFieldType.dropdown,
                controller: victimBehavior,
                dropdownItems: ['normal', 'angry', 'stress', 'happy'],
              ),
              SizedBox(height: 12),
              // Upload files
              UploadFile(),
              SizedBox(height: 20),
              CustomButton(
                text: 'Next',
                color: AppColors.button,
                onPressed: () {
                  // I use GetX
                  Get.offAll("");
                },

                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
