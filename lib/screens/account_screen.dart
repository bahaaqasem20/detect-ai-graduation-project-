import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      // bottomNavigationBar: CustomBottomNavigationBar(
      //   currentIndex: 3,
      //   screenWidth: screenWidth,
      //   onTap: (index) {
      //     Navigator.popAndPushNamed(context, '/account');
      //   },
      // ),
      appBar: AppBar(title: const Text('Account')),
      body: Center(child: Text('Account Screen')),
    );
  }
}
