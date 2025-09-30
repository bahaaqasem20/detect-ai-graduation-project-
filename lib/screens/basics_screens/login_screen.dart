import 'package:detectai_project/auth/auth_service.dart';
import 'package:detectai_project/screens/basics_screens/home_screen.dart';
import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // get auth service
  final authService = AuthService();

  // text controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // login button pressed
  void login() async {
    // prepare data
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    // attempt login
    try {
      await authService.signInWithEmailPassword(email, password);
      // on success, navigate to main screen
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (context) => HomeScreen()),
      // );
    } catch (e) {
      if (mounted) {
        // show error
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Login failed: $e')));
      }
    }
  }

  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 30),
                      Center(
                        child: Image.asset(
                          'assets/images/logo.png',
                          width: constraints.maxWidth * 0.3,
                          height: constraints.maxWidth * 0.3,
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Center(
                        child: Text(
                          'Welcome to DetectAI!',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Center(
                        child: Text(
                          'Become an advanced investigator',
                          style: TextStyle(
                            fontSize: 18,
                            color: AppColors.textLight,
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      const Text(
                        'Email',
                        style: TextStyle(color: AppColors.textLight),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.textFormFeild,
                          hintText: 'Enter your email',
                          hintStyle: TextStyle(color: AppColors.hintColor),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Password',
                        style: TextStyle(color: AppColors.textLight),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: _passwordController,
                        obscureText: _obscurePassword,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.textFormFeild,
                          hintText: 'Enter your Password',
                          hintStyle: TextStyle(color: AppColors.hintColor),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.white70,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 38),
                      ElevatedButton(
                        onPressed: login,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.button,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Sign In',
                          style: TextStyle(
                            fontSize: 20,
                            color: AppColors.textLight,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Forget password?',
                            style: TextStyle(color: AppColors.textLight),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: const [
                          Expanded(
                            child: Divider(color: Colors.white38, thickness: 1),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              'OR',
                              style: TextStyle(color: Colors.white70),
                            ),
                          ),
                          Expanded(
                            child: Divider(color: Colors.white38, thickness: 1),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffF4F4F4),
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              'assets/images/google.png',
                              width: 20,
                              height: 20,
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'Continue with Google',
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(), // Push content if space available
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
