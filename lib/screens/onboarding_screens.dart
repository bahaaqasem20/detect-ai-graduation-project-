import 'package:detectai_project/constants/app_colors.dart';
import 'package:detectai_project/screens/login_screen.dart';
import 'package:detectai_project/widgets/onboarding_page.dart';
import 'package:flutter/material.dart';

class OnboardingScreens extends StatefulWidget {
  const OnboardingScreens({super.key});

  @override
  State<OnboardingScreens> createState() => _OnboardingScreensState();
}

class _OnboardingScreensState extends State<OnboardingScreens> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> pages = [
    {
      'title': 'DetectAI',
      'description':
          'Support investigators using digital evidence for crime scenes.',
      'image': 'assets/svg/1.svg',
    },
    {
      'title': 'Secure',
      'description':
          'DetectAI ensures strong security to protect your data and cases at all times.',
      'image': 'assets/svg/2.svg',
    },
    {
      'title': 'AI Scenario',
      'description':
          'DetectAI Creates possible scenarios for your various criminal cases.',
      'image': 'assets/svg/3.svg',
    },
  ];

  void _nextPage() {
    if (_currentPage == pages.length - 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
    } else {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.decelerate,
      );
    }
  }

  void _skip() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: pages.length,
              onPageChanged: (index) => setState(() => _currentPage = index),
              itemBuilder: (context, index) {
                final page = pages[index];
                return OnboardingPage(
                  title: page['title']!,
                  description: page['description']!,
                  imageAsset: page['image']!,
                );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: _currentPage == pages.length - 1
                ? SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: _nextPage,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.button,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Get Started',
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColors.textLight,
                        ),
                      ),
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: _skip,
                        child: const Text(
                          'Skip',
                          style: TextStyle(color: AppColors.textLight),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: _nextPage,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.button,
                        ),
                        child: Text(
                          'Next',
                          style: TextStyle(color: AppColors.textLight),
                        ),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
