import 'package:detectai_project/widgets/upload_file.dart';
import 'package:flutter/cupertino.dart';
import '../constants/input_field_type.dart';
import 'ReusableInputField.dart';

class AddAccusedForm extends StatelessWidget {
  final TextEditingController accusedFirstName;
  final TextEditingController accusedLastName;
  final TextEditingController accusedGender;
  final TextEditingController accusedAge;
  final TextEditingController accusedID;
  final TextEditingController accusedStatus;
  final TextEditingController accusedJob;
  final TextEditingController accusedAddress;
  final TextEditingController accusedVictimRelationship;
  final TextEditingController accusedIndictmentList;

  const AddAccusedForm({
    super.key,
    required this.accusedFirstName,
    required this.accusedLastName,
    required this.accusedGender,
    required this.accusedAge,
    required this.accusedID,
    required this.accusedStatus,
    required this.accusedJob,
    required this.accusedAddress,
    required this.accusedVictimRelationship,
    required this.accusedIndictmentList,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
              controller: accusedAge,
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
          label: "Why was the accused put on the indictment list?",
          type: InputFieldType.text,
          controller: accusedIndictmentList,
        ),
        const SizedBox(height: 12),
        UploadFile(
          title: 'Upload any files belonging to the accused',
          description:
              'Any files related to the accused, including photos or documents (.jpeg, .pdf).',
          allowedExtensions: ['jpeg', 'pdf'],
        ),
      ],
    );
  }
}
