import 'package:detectai_project/widgets/upload_file.dart';
import 'package:flutter/cupertino.dart';

import '../constants/app_colors.dart';
import '../constants/input_field_type.dart';
import 'ReusableInputField.dart';
import 'custom_button.dart';

class AddAccusedForm extends StatelessWidget {
  final accusedFirstName = TextEditingController();
  final accusedLastName = TextEditingController();
  final accusedGender = TextEditingController();
  final accusedAge = TextEditingController();
  final accusedID = TextEditingController();
  final accusedStatus = TextEditingController();
  final accusedJob = TextEditingController();
  final accusedAddress = TextEditingController();
  final accusedVictimRelationship = TextEditingController();
  final accusedIndictmentList = TextEditingController();
  final witnessSayings = TextEditingController();
  AddAccusedForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                ReusableInputField(
                  label: "Accused First Name",
                  type: InputFieldType.text,
                  controller: accusedFirstName,
                  isHalfWidth: true,
                ),
                const SizedBox(width: 14),
                ReusableInputField(
                  label: "Accused Last Name",
                  type: InputFieldType.text,
                  controller: accusedLastName,
                  isHalfWidth: true,
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                ReusableInputField(
                  label: "Accused Gender",
                  type: InputFieldType.dropdown,
                  controller: accusedGender,
                  dropdownItems: ['male', 'female'],
                  isHalfWidth: true,
                ),
                const SizedBox(width: 14),

                ReusableInputField(
                  label: "Accused Age",
                  type: InputFieldType.number,
                  controller: accusedGender,
                  isHalfWidth: true,
                ),
              ],
            ),
            const SizedBox(height: 12),
            ReusableInputField(
              label: "Accused Id",
              type: InputFieldType.number,
              controller: accusedID,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                ReusableInputField(
                  label: "Accused Status",
                  type: InputFieldType.dropdown,
                  controller: accusedStatus,
                  dropdownItems: ['single', 'married', 'divorced'],
                  isHalfWidth: true,
                ),
                const SizedBox(width: 14),
                ReusableInputField(
                  label: "Accused Job",
                  type: InputFieldType.text,
                  controller: accusedJob,
                  isHalfWidth: true,
                ),
              ],
            ),
            const SizedBox(height: 12),

            ReusableInputField(
              label: "Accused's address",
              type: InputFieldType.location,
              controller: accusedAddress,
            ),
            const SizedBox(height: 12),
            ReusableInputField(
              label: "Accused-victim relationship",
              type: InputFieldType.dropdown,
              controller: accusedVictimRelationship,
              dropdownItems: ['wife', 'husband', 'friend', 'coworker'],
            ),
            const SizedBox(height: 12),
            ReusableInputField(
              label: "Why was the accused put on the indictment list ?",
              type: InputFieldType.text,
              controller: accusedIndictmentList,
            ),
            const SizedBox(height: 12),
            UploadFile(
              title: 'Upload any files belonging to the accused',
              description:
              'any files related to the accused, including photos or files. (.jpeg .pdf)',
              allowedExtensions: ['jpeg', 'pdf'],
            ),
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
