import 'package:detectai_project/constants/app_colors.dart';
import 'package:detectai_project/constants/input_field_type.dart';
import 'package:detectai_project/screens/home_screen.dart';
import 'package:detectai_project/screens/main_screen.dart';
import 'package:detectai_project/widgets/ReusableInputField.dart';
import 'package:flutter/material.dart';

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
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.textLight,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  ReusableInputField(
                    label: 'Case Name',
                    type: InputFieldType.text,
                    controller: caseNameController,
                    isHalfWidth: true,
                  ),
                  const SizedBox(width: 10),
                  ReusableInputField(
                    label: 'Case Number',
                    type: InputFieldType.number,
                    controller: caseNumberController,
                    isHalfWidth: true,
                  ),
                ],
              ),
              ReusableInputField(
                label: 'How did you know about the crime?',
                type: InputFieldType.dropdown,
                controller: crimeSourceController,
                dropdownItems: ['Mobile Call', 'Police Report', 'Witness'],
              ),
              Row(
                children: [
                  ReusableInputField(
                    label: 'Date',
                    type: InputFieldType.date,
                    controller: crimeDateController,
                    isHalfWidth: true,
                  ),
                  const SizedBox(width: 10),
                  ReusableInputField(
                    label: 'Time',
                    type: InputFieldType.text,
                    controller: crimeTimeController,
                    isHalfWidth: true,
                  ),
                ],
              ),
              ReusableInputField(
                label: 'Location',
                type: InputFieldType.location,
                controller: crimeLocationController,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // save or next
                },
                child: const Text("Next"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
