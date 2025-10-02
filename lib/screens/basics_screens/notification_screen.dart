import 'package:detectai_project/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final supabase = Supabase.instance.client;
  List<Map<String, dynamic>> notifications = [];
  RealtimeChannel? _channel; // عشان نعمل unsubscribe

  @override
  void initState() {
    super.initState();
    fetchNotifications();
    subscribeToNotifications();
  }

  /// جلب البيانات من Supabase
  Future<void> fetchNotifications() async {
    final response = await supabase.from('notifications').select();

    setState(() {
      notifications = response
          .map<Map<String, dynamic>>(
            (n) => {
              'id': n['id'], // مهم عشان ما نكرر
              'title': n['title'],
              'message': n['message'],
              'isNew': n['is_new'],
            },
          )
          .toList();
    });
  }

  /// الاشتراك بالـ Realtime (insert فقط)
  void subscribeToNotifications() {
    _channel = supabase
        .channel('public:notifications')
        .onPostgresChanges(
          event: PostgresChangeEvent.insert,
          schema: 'public',
          table: 'notifications',
          callback: (payload) {
            final newNotif = payload.newRecord;

            // نتأكد إنه مش موجود مسبقاً
            if (notifications.any((n) => n['id'] == newNotif['id'])) return;

            setState(() {
              notifications.insert(0, {
                'id': newNotif['id'],
                'title': newNotif['title'],
                'message': newNotif['message'],
                'isNew': newNotif['is_new'],
              });
            });
          },
        )
        .subscribe();
  }

  @override
  void dispose() {
    // إلغاء الاشتراك عند مغادرة الشاشة
    if (_channel != null) {
      supabase.removeChannel(_channel!);
    }
    super.dispose();
  }

  /// UI Helpers
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
      color: AppColors.cards,
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
        child: notifications.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : ListView(
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
                    ...oldNotifications.map(
                      (n) => _buildNotificationCardWithCard(
                        n,
                        screenWidth,
                        screenHeight,
                      ),
                    ),
                  ],
                ],
              ),
      ),
    );
  }
}
