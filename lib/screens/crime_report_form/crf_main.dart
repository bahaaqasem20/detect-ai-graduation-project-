import 'package:flutter/material.dart';

class CrfMain extends StatelessWidget {
  const CrfMain({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(title: const Text('Crime Report Form')),
      // bottomNavigationBar: CustomBottomNavigationBar(
      //   currentIndex: 1,
      //   screenWidth: screenWidth,
      // ),
      body: Center(child: Text('Crime Report Form')),
    );
  }
}
