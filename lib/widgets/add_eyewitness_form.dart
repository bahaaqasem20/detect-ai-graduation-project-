import 'package:flutter/material.dart';
import '../constants/input_field_type.dart';
import 'ReusableInputField.dart';

class AddEyewitnessForm extends StatelessWidget {
  final TextEditingController witnessFirstName;
  final TextEditingController witnessLastName;
  final TextEditingController witnessGender;
  final TextEditingController witnessAge;
  final TextEditingController witnessID;
  final TextEditingController witnessStatus;
  final TextEditingController witnessJob;
  final TextEditingController witnessAddress;
  final TextEditingController witnessVictimRelationship;
  final TextEditingController witnessAtCrimeScene;
  final TextEditingController witnessSayings;

  const AddEyewitnessForm({
    super.key,
    required this.witnessFirstName,
    required this.witnessLastName,
    required this.witnessGender,
    required this.witnessAge,
    required this.witnessID,
    required this.witnessStatus,
    required this.witnessJob,
    required this.witnessAddress,
    required this.witnessVictimRelationship,
    required this.witnessAtCrimeScene,
    required this.witnessSayings,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
          label: "Witness's address",
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
        ReusableInputField(
          label: "Why was the witness at the crime scene?",
          type: InputFieldType.text,
          controller: witnessAtCrimeScene,
        ),
        const SizedBox(height: 12),
        ReusableInputField(
          label: "What did the witness say about the crime?",
          type: InputFieldType.text,
          controller: witnessSayings,
        ),
      ],
    );
  }
}
