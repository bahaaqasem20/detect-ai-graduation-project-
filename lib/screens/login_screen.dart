import 'package:flutter/material.dart';
import 'package:detectai_project/widgets/custom_form.dart';
import 'package:detectai_project/widgets/custom_appbar.dart';
import 'package:detectai_project/constants/app_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _obscurePassword = true;
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CustomAppBar(title: 'Sign In', showBackButton: false),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: size.height * 0.25,
              child: Image.asset('assets/images/logo.png', fit: BoxFit.contain),
            ),
            const SizedBox(height: 24),

            CustomForm(
              buttonText: 'Sign In',
              fields: [
                CustomFormField(
                  label: 'Email',
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!value.contains('@')) {
                      return 'Invalid email format';
                    }
                    return null;
                  },
                ),
                CustomFormField(
                  label: 'Password',
                  controller: passwordController,
                  obscureText: _obscurePassword,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: AppColors.textLight,
                    ),
                    onPressed: _togglePasswordVisibility,
                  ),
                  validator: (value) {
                    if (value == null || value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
              ],
              onSubmit: (values) {
                debugPrint('Email: ${values['Email']}');
                debugPrint('Password: ${values['Password']}');
              },
            ),

            // const SizedBox(height: 8),
            // Align(
            //   alignment: Alignment.centerRight,
            //   child: TextButton(
            //     onPressed: () {
            //       debugPrint('Forgot Password? pressed');
            //     },
            //     child: const Text(
            //       'Forgot Password?',
            //       style: TextStyle(fontSize: 13, color: Colors.blue),
            //     ),
            //   ),
            // ),
            // const SizedBox(height: 24),
            // Center(
            //   child: TextButton(
            //     onPressed: () {
            //       debugPrint('Contact support pressed');
            //     },
            //     child: const Text(
            //       "Don't have an account? Contact support",
            //       style: TextStyle(fontSize: 14, color: Colors.blue),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
