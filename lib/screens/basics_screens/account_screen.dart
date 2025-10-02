import 'package:detectai_project/auth/auth_service.dart';
import 'package:detectai_project/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  // get auth service
  final authService = AuthService();

  // logout function
  void logout() async {
    await authService.signOut();
  }

  bool isEditing = false;
  late TextEditingController nameController;
  File? _profileImage;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: 'Bahaa Alden Qasem');
  }

  //  pickImage
  Future<void> _pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _profileImage = File(picked.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentEmail = authService.getCurrentUser();
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: const Text(
          'Account',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.textLight,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                isEditing = !isEditing;
              });
            },
            child: Text(
              isEditing ? 'Save' : 'Edit',
              style: const TextStyle(color: AppColors.textLight),
            ),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: isTablet ? 500 : double.infinity,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    GestureDetector(
                      onTap: isEditing ? _pickImage : null,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.grey[800],
                        child: ClipOval(
                          child: SizedBox(
                            width: 100,
                            height: 100,
                            child: _profileImage != null
                                ? Image.file(_profileImage!, fit: BoxFit.cover)
                                : Image.asset(
                                    'assets/images/user.png',
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),
                    _label('Name'),
                    isEditing
                        ? _editableBox(nameController)
                        : _infoBox(nameController.text),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(child: _statBox('Solved Cases', '8')),
                        const SizedBox(width: 12),
                        Expanded(child: _statBox('On Progress Cases', '4')),
                      ],
                    ),
                    // const SizedBox(height: 16),
                    // _label('Phone number'),
                    // _infoBox('0592089037'),
                    const SizedBox(height: 16),
                    _label('Email'),
                    _infoBox(currentEmail.toString()),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: logout,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.logOutButton,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Log Out',
                        style: TextStyle(
                          fontSize: 20,
                          color: AppColors.textLight,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _label(String text) => Padding(
    padding: const EdgeInsets.only(bottom: 6.0),
    child: Text(
      text,
      style: const TextStyle(color: AppColors.textLight, fontSize: 18),
    ),
  );

  Widget _infoBox(String content) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
    decoration: BoxDecoration(
      color: const Color(0xFF1C1B2E),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Text(
      content,
      style: const TextStyle(color: AppColors.hintColor, fontSize: 18),
    ),
  );

  Widget _editableBox(TextEditingController controller) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 12),
    decoration: BoxDecoration(
      color: const Color(0xFF1C1B2E),
      borderRadius: BorderRadius.circular(10),
    ),
    child: TextField(
      controller: controller,
      style: const TextStyle(color: AppColors.textLight),
      decoration: const InputDecoration(border: InputBorder.none),
    ),
  );

  Widget _statBox(String title, String value) => Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: const Color(0xFF1C1B2E),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: AppColors.textLight,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: const TextStyle(color: Colors.white70, fontSize: 14),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}
