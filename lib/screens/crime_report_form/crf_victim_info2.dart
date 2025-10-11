import 'package:detectai_project/constants/app_colors.dart';
import 'package:detectai_project/constants/input_field_type.dart';
import 'package:detectai_project/controllers/crime_report_controller.dart';
import 'package:detectai_project/screens/crime_report_form/crf_main.dart';
import 'package:detectai_project/screens/crime_report_form/crf_related_info3.dart';
import 'package:detectai_project/widgets/ReusableInputField.dart';
import 'package:detectai_project/widgets/custom_button.dart';
import 'package:detectai_project/widgets/previous_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/route_manager.dart';

class CrfVictimInfo extends StatelessWidget {
  final controller = Get.find<CrimeReportController>();

  final victimFirstName = TextEditingController();
  final victimlastName = TextEditingController();
  final victimGender = TextEditingController();
  final victimAge = TextEditingController();
  final victimID = TextEditingController();
  final victimStatus = TextEditingController();
  final victimJob = TextEditingController();
  final victimAddress = TextEditingController();
  CrfVictimInfo({super.key});

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
                "Basic Information of The Victim",
                style: TextStyle(
                  color: AppColors.textLight,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 18),
              Row(
                children: [
                  ReusableInputField(
                    label: 'Victim First Name',
                    type: InputFieldType.text,
                    controller: victimFirstName,
                    isHalfWidth: true,
                  ),
                  const SizedBox(width: 14),
                  ReusableInputField(
                    label: 'Victim last Name',
                    type: InputFieldType.text,
                    controller: victimlastName,
                    isHalfWidth: true,
                  ),
                ],
              ),
              SizedBox(height: 12),
              ReusableInputField(
                label: 'Victim ID',
                type: InputFieldType.number,
                controller: victimID,
              ),
              SizedBox(height: 12),
              Row(
                children: [
                  ReusableInputField(
                    label: 'Victim Gender',
                    type: InputFieldType.dropdown,
                    controller: victimGender,
                    isHalfWidth: true,
                    dropdownItems: ['male', 'female'],
                  ),
                  const SizedBox(width: 14),
                  ReusableInputField(
                    label: 'Victim Age',
                    type: InputFieldType.number,
                    controller: victimAge,
                    isHalfWidth: true,
                  ),
                ],
              ),
              SizedBox(height: 12),
              ReusableInputField(
                label: 'Victim Address',
                type: InputFieldType.location,
                controller: victimAddress,
              ),
              SizedBox(height: 12),
              Row(
                children: [
                  ReusableInputField(
                    label: 'Victim Status',
                    type: InputFieldType.dropdown,
                    controller: victimStatus,
                    isHalfWidth: true,
                    dropdownItems: ['single', 'mareid'],
                  ),
                  const SizedBox(width: 14),
                  ReusableInputField(
                    label: 'Victim Job',
                    type: InputFieldType.text,
                    controller: victimJob,
                    isHalfWidth: true,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PreviousButton(
                    text: "Previous",
                    onPressed: () {
                      // add with data
                      Get.offAll(CrfMain());
                    },
                  ),
                  CustomButton(
                    text: 'Next',
                    color: AppColors.button,
                    onPressed: () {
                      // save data to controller
                      controller.victimFirstName.value = victimFirstName.text;
                      controller.victimLastName.value = victimlastName.text;
                      controller.victimID.value = victimID.text;
                      controller.victimGender.value = victimGender.text;
                      controller.victimAge.value = victimAge.text;
                      controller.victimAddress.value = victimAddress.text;
                      controller.victimStatus.value = victimStatus.text;

                      // I use GetX
                      Get.to(CrfRelatedInfo());
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
