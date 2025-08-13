import 'package:detectai_project/constants/app_colors.dart';
import 'package:detectai_project/constants/input_field_type.dart';
import 'package:detectai_project/screens/crime_report_form/crf_aditional_notes4.dart';
import 'package:detectai_project/screens/crime_report_form/crf_victim_info2.dart';
import 'package:detectai_project/widgets/ReusableInputField.dart';
import 'package:detectai_project/widgets/custom_button.dart';
import 'package:detectai_project/widgets/previous_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';

class CrfRelatedInfo extends StatelessWidget {
  final victimDoing = TextEditingController();
  final expectedLocation = TextEditingController();
  final victimValuables = TextEditingController();
  final victimBelongings = TextEditingController();
  final victimHealth = TextEditingController();
  CrfRelatedInfo({super.key});

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
                "Crime-related Information",
                style: TextStyle(
                  color: AppColors.textLight,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 18),
              ReusableInputField(
                label: 'What was the victim doing at the time of the crime ?',
                type: InputFieldType.text,
                controller: victimDoing,
              ),
              SizedBox(height: 12),
              ReusableInputField(
                label: 'Was the victim in an expected or unfamiliar location ?',
                type: InputFieldType.dropdown,
                controller: expectedLocation,
                dropdownItems: ['yes, he/she was', 'yes, he/she was not'],
              ),
              SizedBox(height: 12),
              ReusableInputField(
                label: 'Did the victim have any valuables?',
                type: InputFieldType.dropdown,
                controller: victimValuables,
                dropdownItems: ['yes, he/she did', 'No, he/she did not'],
              ),
              SizedBox(height: 12),
              ReusableInputField(
                label: 'Victims belongings ?',
                type: InputFieldType.text,
                controller: victimBelongings,
              ),
              SizedBox(height: 12),
              ReusableInputField(
                label: 'The victims health condition',
                type: InputFieldType.dropdown,
                controller: victimHealth,
                dropdownItems: ['healthy', 'unhealthy'],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PreviousButton(
                    text: "Previous",
                    onPressed: () {
                      // add with data
                      Get.offAll(CrfVictimInfo());
                    },
                  ),
                  CustomButton(
                    text: 'Next',
                    color: AppColors.button,
                    onPressed: () {
                      // I use GetX
                      Get.offAll(CrfAditionalNotes());
                    },
                    // width: double.infinity,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
