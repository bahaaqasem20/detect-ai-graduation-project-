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
                    controller.addEyewitness({
                      "first_name": witnessFirstNameController.text,
                      "last_name": witnessLastNameController.text,
                      "gender": witnessGenderController.text,
                      "age": witnessAgeController.text,
                      "id_number": witnessIDController.text,
                      "status": witnessStatusController.text,
                      "job": witnessJobController.text,
                      "address": witnessAddressController.text,
                      "victim_relationship":
                          witnessVictimRelationshipController.text,
                      "at_crime_scene": witnessAtCrimeSceneController.text,
                      "sayings": witnessSayingsController.text,
                    });

                    // Clear fields
                    witnessFirstNameController.clear();
                    witnessLastNameController.clear();
                    witnessGenderController.clear();
                    witnessAgeController.clear();
                    witnessIDController.clear();
                    witnessStatusController.clear();
                    witnessJobController.clear();
                    witnessAddressController.clear();
                    witnessVictimRelationshipController.clear();
                    witnessAtCrimeSceneController.clear();
                    witnessSayingsController.clear();

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
                              "${e['first_name']} ${e['last_name']}",
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
                    controller.addAccused({
                      "first_name": accusedFirstNameController.text,
                      "last_name": accusedLastNameController.text,
                      "gender": accusedGenderController.text,
                      "age": accusedAgeController.text,
                      "id_number": accusedIDController.text,
                      "status": accusedStatusController.text,
                      "job": accusedJobController.text,
                      "address": accusedAddressController.text,
                      "victim_relationship":
                          accusedVictimRelationshipController.text,
                      "indictment_list": accusedIndictmentListController.text,
                    });

                    // Clear fields
                    accusedFirstNameController.clear();
                    accusedLastNameController.clear();
                    accusedGenderController.clear();
                    accusedAgeController.clear();
                    accusedIDController.clear();
                    accusedStatusController.clear();
                    accusedJobController.clear();
                    accusedAddressController.clear();
                    accusedVictimRelationshipController.clear();
                    accusedIndictmentListController.clear();

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
                              "${e['first_name']} ${e['last_name']}",
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
                    child: const Text(
                      "Previous",
                      style: TextStyle(
                        color: AppColors.textLight,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(const MainScreen());
                    },
                    child: const Text(
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
                    onPressed: () async {
                      await controller.submitReport();
                      Get.to(const MainScreen());
                    },
                    child: const Text(
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
