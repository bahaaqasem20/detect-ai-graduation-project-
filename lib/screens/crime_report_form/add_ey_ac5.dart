import 'package:detectai_project/controllers/crime_report_controller.dart';
import 'package:detectai_project/screens/basics_screens/main_screen.dart';
import 'package:detectai_project/screens/crime_report_form/crf_aditional_notes4.dart';
import 'package:detectai_project/widgets/add_accused_form.dart';
import 'package:detectai_project/widgets/add_eyewitness_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_colors.dart';

class AddEyAc extends StatefulWidget {
  const AddEyAc({super.key});

  @override
  _AddEyAcState createState() => _AddEyAcState();
}

class _AddEyAcState extends State<AddEyAc> {
  final controller = Get.find<CrimeReportController>();

  bool showEyewitnessForm = false;
  bool showAccusedForm = false;

  // Eyewitness Controllers
  final witnessFirstNameController = TextEditingController();
  final witnessLastNameController = TextEditingController();
  final witnessGenderController = TextEditingController();
  final witnessAgeController = TextEditingController();
  final witnessIDController = TextEditingController();
  final witnessStatusController = TextEditingController();
  final witnessJobController = TextEditingController();
  final witnessAddressController = TextEditingController();
  final witnessVictimRelationshipController = TextEditingController();
  final witnessAtCrimeSceneController = TextEditingController();
  final witnessSayingsController = TextEditingController();

  // Accused Controllers
  final accusedFirstNameController = TextEditingController();
  final accusedLastNameController = TextEditingController();
  final accusedGenderController = TextEditingController();
  final accusedAgeController = TextEditingController();
  final accusedIDController = TextEditingController();
  final accusedStatusController = TextEditingController();
  final accusedJobController = TextEditingController();
  final accusedAddressController = TextEditingController();
  final accusedVictimRelationshipController = TextEditingController();
  final accusedIndictmentListController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.background,
        title: const Text(
          "Crime Report Form",
          style: TextStyle(color: AppColors.textLight),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Eyewitness section
              GestureDetector(
                onTap: () {
                  setState(() {
                    showEyewitnessForm = !showEyewitnessForm;
                  });
                },
                child: const Text(
                  "Add Eyewitnesses +",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              if (showEyewitnessForm) ...[
                const SizedBox(height: 18),
                AddEyewitnessForm(
                  witnessFirstName: witnessFirstNameController,
                  witnessLastName: witnessLastNameController,
                  witnessGender: witnessGenderController,
                  witnessAge: witnessAgeController,
                  witnessID: witnessIDController,
                  witnessStatus: witnessStatusController,
                  witnessJob: witnessJobController,
                  witnessAddress: witnessAddressController,
                  witnessVictimRelationship:
                      witnessVictimRelationshipController,
                  witnessAtCrimeScene: witnessAtCrimeSceneController,
                  witnessSayings: witnessSayingsController,
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    // Add Eyewitness name or other logic here
                    final fullName =
                        "${witnessFirstNameController.text} ${witnessLastNameController.text}";
                    controller.addEyewitness(fullName as Map<String, String>);
                    witnessFirstNameController.clear();
                    witnessLastNameController.clear();
                    setState(() {});
                  },
                  child: const Text("Add Eyewitness"),
                ),
                Obx(
                  () => Column(
                    children: controller.eyewitnesses
                        .map(
                          (e) => ListTile(
                            title: Text(
                              e as String,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                const SizedBox(height: 20),
              ],

              // Accused section
              GestureDetector(
                onTap: () {
                  setState(() {
                    showAccusedForm = !showAccusedForm;
                  });
                },
                child: const Text(
                  "Add Accused +",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              if (showAccusedForm) ...[
                const SizedBox(height: 18),
                AddAccusedForm(
                  accusedFirstName: accusedFirstNameController,
                  accusedLastName: accusedLastNameController,
                  accusedGender: accusedGenderController,
                  accusedAge: accusedAgeController,
                  accusedID: accusedIDController,
                  accusedStatus: accusedStatusController,
                  accusedJob: accusedJobController,
                  accusedAddress: accusedAddressController,
                  accusedVictimRelationship:
                      accusedVictimRelationshipController,
                  accusedIndictmentList: accusedIndictmentListController,
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    final fullName =
                        "${accusedFirstNameController.text} ${accusedLastNameController.text}";
                    controller.addAccused(fullName as Map<String, String>);
                    accusedFirstNameController.clear();
                    accusedLastNameController.clear();
                    setState(() {});
                  },
                  child: const Text("Add Accused"),
                ),
                Obx(
                  () => Column(
                    children: controller.accused
                        .map(
                          (e) => ListTile(
                            title: Text(
                              e as String,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],

              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Get.off(CrfAditionalNotes());
                    },
                    child: Text(
                      "Previous",
                      style: TextStyle(
                        color: AppColors.textLight,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(MainScreen());
                    },
                    child: Text(
                      "Skip",
                      style: TextStyle(
                        color: AppColors.textLight,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.button,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 28,
                        vertical: 14,
                      ),
                      elevation: 4,
                    ),
                    onPressed: () {
                      Get.to(MainScreen());
                    },
                    child: Text(
                      "Next",
                      style: TextStyle(
                        color: AppColors.textLight,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
