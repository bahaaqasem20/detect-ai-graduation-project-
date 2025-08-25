import 'package:detectai_project/screens/basics_screens/home_screen.dart';
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
  bool showEyewitnessForm = false;
  bool showAccusedForm = false;

  final TextEditingController eyewitnessNameController =
      TextEditingController();
  final TextEditingController accusedNameController = TextEditingController();

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
                child: Text(
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
                AddEyewitnessForm(),
                const SizedBox(height: 20),
              ],
          
              // Accused section
              SizedBox(height: 22),
              GestureDetector(
                onTap: () {
                  setState(() {
                    showAccusedForm = !showAccusedForm;
                  });
                },
                child: Text(
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
                // AddAccusedForm(),
                AddAccusedForm(),
              ],
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Get.off(CrfAditionalNotes());
                    },
                    child: Text(
                      "previous",
                      style: TextStyle(color: AppColors.textLight, fontSize: 18),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(MainScreen());
                    },
                    child: Text(
                      "skip",
                      style: TextStyle(color: AppColors.textLight, fontSize: 18),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.button,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 28, vertical: 14),
                      elevation: 4,
                    ),
                    onPressed: () {
                      //     Action
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
