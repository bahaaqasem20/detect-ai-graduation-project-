import 'package:flutter/material.dart';
import 'package:detectai_project/constants/app_colors.dart';
import 'package:detectai_project/widgets/custom_form.dart';

class CrfMain extends StatefulWidget {
  CrfMain({super.key});

  @override
  State<CrfMain> createState() => _CrfMainState();
}

class _CrfMainState extends State<CrfMain> {
  final _caseNameController = TextEditingController();

  final _caseNumberController = TextEditingController();

  final _knowAboutCrimeController = TextEditingController();

  final _dateController = TextEditingController();

  final _timeController = TextEditingController();

  final _howCrimeOccurredController = TextEditingController();

  final _locationController = TextEditingController();

  final _sceneController = TextEditingController();

  final _typeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: const Text(
          'Crime Report Form',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: CustomForm(
        buttonText: 'Next',
        onSubmit: (values) {
          print('Form submitted: $values');
          // Navigate or handle submission
        },
        fields: [
          CustomFormField(label: 'Case Name', controller: _caseNameController),
          CustomFormField(
            label: 'Case Number',
            controller: _caseNumberController,
            keyboardType: TextInputType.number,
          ),
          CustomFormField(
            label: 'How did you know about the crime?',
            controller: _knowAboutCrimeController,
          ),
          CustomFormField(
            label: 'Date',
            controller: _dateController,
            suffixIcon: const Icon(Icons.calendar_today, color: Colors.white70),
            keyboardType: TextInputType.datetime,
          ),
          CustomFormField(
            label: 'Time',
            controller: _timeController,
            suffixIcon: const Icon(Icons.access_time, color: Colors.white70),
            keyboardType: TextInputType.datetime,
          ),
          CustomFormField(
            label: 'How the crime occurred?',
            controller: _howCrimeOccurredController,
          ),
          CustomFormField(
            label: 'Crime Location',
            controller: _locationController,
            suffixIcon: const Icon(Icons.location_on, color: Colors.white70),
          ),
          CustomFormField(
            label: 'Crime Scene',
            controller: _sceneController,
            suffixIcon: const Icon(Icons.home, color: Colors.white70),
          ),
          CustomFormField(label: 'Type of crime?', controller: _typeController),
        ],
      ),
    );
  }
}
