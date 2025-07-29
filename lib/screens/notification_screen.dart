import 'package:detectai_project/constants/app_colors.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<Map<String, dynamic>> notifications = [
    {
      'title': 'New update',
      'message':
          'The new version of DetectAI has been announced. Please update the application as soon as possible.',
      'isNew': true,
    },
    {
      'title': 'New update',
      'message':
          'The new version of DetectAI has been announced. Please update the application as soon as possible.',
      'isNew': false,
    },
    {
      'title': 'New update',
      'message':
          'The new version of DetectAI has been announced. Please update the application as soon as possible.',
      'isNew': true,
    },
    {
      'title': 'New update',
      'message':
          'The new version of DetectAI has been announced. Please update the application as soon as possible.',
      'isNew': false,
    },
    {
      'title': 'New update',
      'message':
          'The new version of DetectAI has been announced. Please update the application as soon as possible.',
      'isNew': false,
    },
    {
      'title': 'New update',
      'message':
          'The new version of DetectAI has been announced. Please update the application as soon as possible.',
      'isNew': false,
    },
  ];

  Widget _buildSectionTitle(String title, double width, double height) {
    return Padding(
      padding: EdgeInsets.only(top: height * 0.025, bottom: height * 0.012),
      child: Text(
        title,
        style: TextStyle(
          color: AppColors.textLight,
          fontSize: width * 0.05,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildNotificationCardWithCard(
    Map<String, dynamic> notification,
    double width,
    double height,
  ) {
    return Card(
      color: AppColors.background,
      margin: EdgeInsets.only(bottom: height * 0.004),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(width * 0.025),
      ),
      elevation: 3,
      child: Padding(
        padding: EdgeInsets.all(width * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              notification['title'],
              style: TextStyle(
                color: AppColors.textLight,
                fontWeight: FontWeight.bold,
                fontSize: width * 0.045,
              ),
            ),
            SizedBox(height: height * 0.008),
            Text(
              notification['message'],
              style: TextStyle(
                color: AppColors.textLight,
                fontSize: width * 0.04,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    List<Map<String, dynamic>> newNotifications = notifications
        .where((n) => n['isNew'])
        .toList();
    List<Map<String, dynamic>> oldNotifications = notifications
        .where((n) => !n['isNew'])
        .toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Notifications',
            style: TextStyle(
              color: AppColors.textLight,
              fontSize: screenWidth * 0.06,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Container(
        color: AppColors.background,
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        child: ListView(
          children: [
            if (newNotifications.isNotEmpty) ...[
              _buildSectionTitle('New', screenWidth, screenHeight),
              ...newNotifications
                  .map(
                    (n) => _buildNotificationCardWithCard(
                      n,
                      screenWidth,
                      screenHeight,
                    ),
                  )
                  .toList(),
            ],
            if (oldNotifications.isNotEmpty) ...[
              SizedBox(height: screenHeight * 0.025),
              _buildSectionTitle('Earlier', screenWidth, screenHeight),
              ...oldNotifications
                  .map(
                    (n) => _buildNotificationCardWithCard(
                      n,
                      screenWidth,
                      screenHeight,
                    ),
                  )
                  .toList(),
            ],
          ],
        ),
      ),
    );
  }
}
