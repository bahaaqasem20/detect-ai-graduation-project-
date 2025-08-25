import 'package:detectai_project/constants/input_field_type.dart';
import 'package:detectai_project/widgets/ReusableInputField.dart';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import 'custom_button.dart';

class AddEyewitnessForm extends StatelessWidget {
  final witnessFirstName = TextEditingController();
  final witnessLastName = TextEditingController();
  final witnessGender = TextEditingController();
  final witnessAge = TextEditingController();
  final witnessID = TextEditingController();
  final witnessStatus = TextEditingController();
  final witnessJob = TextEditingController();
  final witnessAddress = TextEditingController();
  final witnessVictimRelationship = TextEditingController();
  final witnessAtCrimeScene = TextEditingController();
  final witnessSayings = TextEditingController();

  AddEyewitnessForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                ReusableInputField(
                  label: "Witness First Name",
                  type: InputFieldType.text,
                  controller: witnessFirstName,
                  isHalfWidth: true,
                ),
                const SizedBox(width: 14),
                ReusableInputField(
                  label: "Witness Last Name",
                  type: InputFieldType.text,
                  controller: witnessLastName,
                  isHalfWidth: true,
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                ReusableInputField(
                  label: "Witness Gender",
                  type: InputFieldType.dropdown,
                  controller: witnessGender,
                  dropdownItems: ['male', 'female'],
                  isHalfWidth: true,
                ),
                const SizedBox(width: 14),

                ReusableInputField(
                  label: "Witness Age",
                  type: InputFieldType.number,
                  controller: witnessAge,
                  isHalfWidth: true,
                ),
              ],
            ),
            const SizedBox(height: 12),
            ReusableInputField(
              label: "Witness Id",
              type: InputFieldType.number,
              controller: witnessID,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                ReusableInputField(
                  label: "Witness Status",
                  type: InputFieldType.dropdown,
                  controller: witnessStatus,
                  dropdownItems: ['single', 'married', 'divorced'],
                  isHalfWidth: true,
                ),
                const SizedBox(width: 14),
                ReusableInputField(
                  label: "Witness Job",
                  type: InputFieldType.text,
                  controller: witnessJob,
                  isHalfWidth: true,
                ),
              ],
            ),
            const SizedBox(height: 12),

            ReusableInputField(
              label: "Witness 's address",
              type: InputFieldType.location,
              controller: witnessAddress,
            ),
            const SizedBox(height: 12),
            ReusableInputField(
              label: "Witness-victim relationship",
              type: InputFieldType.dropdown,
              controller: witnessVictimRelationship,
              dropdownItems: ['wife', 'husband', 'friend', 'coworker'],
            ),
            const SizedBox(height: 12),
            ReusableInputField(label: "Why was the witness at the crime scene ?", type: InputFieldType.text, controller: witnessAtCrimeScene),
            const SizedBox(height: 12),
            ReusableInputField(label: "What did the witness say about the crime ?", type: InputFieldType.text, controller: witnessSayings),
            const SizedBox(height: 16),
            CustomButton(
              text: 'Add',
              color: AppColors.button,
              onPressed: () {
              },
              width: double.infinity,
            ),

          ],
        ),
      ),
    );
  }
}
