import 'package:detectai_project/constants/app_colors.dart';
import 'package:detectai_project/constants/input_field_type.dart';
import 'package:detectai_project/screens/crime_report_form/crf_victim_info2.dart';
import 'package:detectai_project/screens/main_screen.dart';
import 'package:detectai_project/widgets/ReusableInputField.dart';
import 'package:detectai_project/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class CrfMain extends StatelessWidget {
  final caseNameController = TextEditingController();
  final caseNumberController = TextEditingController();
  final crimeSourceController = TextEditingController();
  final crimeDateController = TextEditingController();
  final crimeTimeController = TextEditingController();
  final crimeLocationController = TextEditingController();

  CrfMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => MainScreen()),
              (route) => false,
            );
          },
          icon: Icon(Icons.arrow_back_ios_new, color: AppColors.textLight),
        ),
        backgroundColor: AppColors.background,
        elevation: 0,
        title: const Text(
          'Crime Report Form',
          style: TextStyle(color: AppColors.textLight),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              Row(
                children: [
                  ReusableInputField(
                    label: 'Case Name',
                    type: InputFieldType.text,
                    controller: caseNameController,
                    isHalfWidth: true,
                  ),
                  const SizedBox(width: 14),
                  ReusableInputField(
                    label: 'Case Number',
                    type: InputFieldType.number,
                    controller: caseNumberController,
                    isHalfWidth: true,
                  ),
                ],
              ),
              SizedBox(height: 20),
              ReusableInputField(
                label: 'How did you know about the crime?',
                type: InputFieldType.dropdown,
                controller: crimeSourceController,
                dropdownItems: ['Mobile Call', 'Police Report', 'Witness'],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  ReusableInputField(
                    label: 'Date',
                    type: InputFieldType.date,
                    controller: crimeDateController,
                    isHalfWidth: true,
                  ),
                  const SizedBox(width: 14),
                  ReusableInputField(
                    label: 'Time',
                    type: InputFieldType.text,
                    controller: crimeTimeController,
                    isHalfWidth: true,
                  ),
                ],
              ),
              SizedBox(height: 20),
              ReusableInputField(
                label: 'Location',
                type: InputFieldType.location,
                controller: crimeLocationController,
              ),
              const SizedBox(height: 20),
              CustomButton(
                text: 'Next',
                color: AppColors.button,
                onPressed: () {
                  // I use GetX
                  Get.offAll(CrfVictimInfo());
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
