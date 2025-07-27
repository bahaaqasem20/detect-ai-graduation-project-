import 'package:detectai_project/constants/app_colors.dart';
import 'package:detectai_project/widgets/case_bottom_sheet.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  void _openCaseDetails(BuildContext context, String caseName) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        final screenHeight = MediaQuery.of(context).size.height;

        return SizedBox(
          height: screenHeight * 0.40,
          child: CaseBottomSheet(caseName: caseName),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    List<Map<String, dynamic>> caseList = [
      {"name": "Stolen Laptop", "id": "16542440", "status": "solved"},
      {"name": "Missing Phone", "id": "16542441", "status": "in progress"},
      {"name": "Fraud Report", "id": "16542442", "status": "solved"},
      {"name": "Fraud Report", "id": "16542442", "status": "in progress"},
      {"name": "Stolen Car", "id": "16542443", "status": "solved"},
      {"name": "Missing Person", "id": "16542444", "status": "in progress"},
      {"name": "Theft Case", "id": "16542445", "status": "solved"},
      {"name": "Assault Case", "id": "16542446", "status": "in progress"},
      {"name": "Vandalism Report", "id": "16542447", "status": "solved"},
      {"name": "Burglary Case", "id": "16542448", "status": "in progress"},
    ];

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.cards,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        iconSize: screenWidth * 0.07,
        selectedItemColor: AppColors.textLight,
        unselectedItemColor: Colors.white38,
        selectedLabelStyle: TextStyle(
          fontSize: screenWidth * 0.045,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: screenWidth * 0.04,
          fontWeight: FontWeight.normal,
        ),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "Add Case"),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: "Notification",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account"),
        ],
      ),

      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.background, AppColors.background],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(screenWidth * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Welcome Box
                Container(
                  padding: EdgeInsets.all(screenWidth * 0.04),
                  decoration: BoxDecoration(
                    color: AppColors.cards,
                    borderRadius: BorderRadius.circular(screenWidth * 0.05),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: screenWidth * 0.08,
                        backgroundImage: AssetImage('assets/images/logo.png'),
                      ),
                      SizedBox(width: screenWidth * 0.04),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Welcome Back, Bahaa",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenWidth * 0.045,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.008),
                            Row(
                              children: [
                                Icon(
                                  Icons.description,
                                  color: Colors.white,
                                  size: screenWidth * 0.05,
                                ),
                                SizedBox(width: screenWidth * 0.02),
                                Text(
                                  "Cases Number: 12",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: screenWidth * 0.038,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: screenHeight * 0.005),
                            Row(
                              children: [
                                Icon(
                                  Icons.check_circle,
                                  color: AppColors.textLight,
                                  size: screenWidth * 0.05,
                                ),
                                SizedBox(width: screenWidth * 0.02),
                                Text(
                                  "Solved Cases: 8",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: screenWidth * 0.038,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: screenHeight * 0.005),
                            Row(
                              children: [
                                Icon(
                                  Icons.autorenew,
                                  color: AppColors.textLight,
                                  size: screenWidth * 0.05,
                                ),
                                SizedBox(width: screenWidth * 0.02),
                                Text(
                                  "On Progress Cases: 4",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: screenWidth * 0.038,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // باقي محتوى الصفحة هنا حسب التاب _currentIndex
                SizedBox(
                  width: screenWidth * 0.04,
                  height: screenHeight * 0.04,
                ),

                /// Search
                TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: TextStyle(color: AppColors.hintColor),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: AppColors.textLight,
                    ),
                    fillColor: AppColors.cards,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(
                  width: screenWidth * 0.06,
                  height: screenHeight * 0.06,
                ),

                /// Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Cases",
                      style: TextStyle(
                        fontSize: screenWidth * 0.045,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textLight,
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.sort,
                        size: screenWidth * 0.05,
                        color: AppColors.textLight,
                      ),
                      label: Text(
                        "Sort",
                        style: TextStyle(
                          fontSize: screenWidth * 0.045,
                          color: AppColors.textLight,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: screenWidth * 0.02),
                Expanded(
                  child: ListView.builder(
                    itemCount: caseList.length,
                    itemBuilder: (context, index) {
                      final caseData = caseList[index];

                      return GestureDetector(
                        onTap: () => _openCaseDetails(
                          context,
                          "${caseData['name']}, ${caseData['id']}",
                        ),
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            vertical: screenHeight * 0.01,
                          ),
                          padding: EdgeInsets.all(screenWidth * 0.035),
                          decoration: BoxDecoration(
                            color: AppColors.cards,
                            borderRadius: BorderRadius.circular(
                              screenWidth * 0.03,
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.description,
                                color: AppColors.button,
                                size: screenWidth * 0.07,
                              ),
                              SizedBox(width: screenWidth * 0.03),
                              Expanded(
                                child: Text(
                                  "${caseData['name']}, ${caseData['id']}",
                                  style: TextStyle(
                                    color: AppColors.textLight,
                                    fontSize: screenWidth * 0.043,
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: caseData['status'] == "solved"
                                      ? AppColors.button
                                      : AppColors.textLight,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                padding: EdgeInsets.all(screenWidth * 0.01),
                                child: Icon(
                                  Icons.check,
                                  color: caseData['status'] == "solved"
                                      ? AppColors.textLight
                                      : AppColors.button,
                                  size: screenWidth * 0.045,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
