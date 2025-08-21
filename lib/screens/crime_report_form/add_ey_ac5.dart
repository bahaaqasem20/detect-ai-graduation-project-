// AddEyAc

import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';

class AddEyAc extends StatefulWidget {
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
      backgroundColor: Color(0xFF0B061C),
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
                // Form of Eyewitnesses
                // TextField(
                //   controller: eyewitnessNameController,
                //   decoration: InputDecoration(
                //     labelText: "Eyewitness Name",
                //     labelStyle: TextStyle(color: Colors.white70),
                //     filled: true,
                //     fillColor: Colors.white10,
                //     border: OutlineInputBorder(),
                //   ),
                // ),
                // const SizedBox(height: 10),
                // ElevatedButton(
                //   onPressed: () {
                //   },
                //   child: Text("Save Eyewitness"),
                // ),
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
                // Form of Accused
                // TextField(
                //   controller: accusedNameController,
                //   decoration: InputDecoration(
                //     labelText: "Accused Name",
                //     labelStyle: TextStyle(color: Colors.white70),
                //     filled: true,
                //     fillColor: Colors.white10,
                //     border: OutlineInputBorder(),
                //   ),
                // ),
                // const SizedBox(height: 10),
                // ElevatedButton(
                //   onPressed: () {
                //     // Add accused logic
                //   },
                //   child: Text("Save Accused"),
                // ),
              ],
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "previous",
                      style: TextStyle(color: AppColors.textLight, fontSize: 18),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
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
