import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://10.0.2.2:8000/api'; // للسيرفر المحلي

  static Future<bool> submitCrimeReport(Map<String, dynamic> reportData) async {
    var url = Uri.parse('$baseUrl/crime-report');
    try {
      var response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(reportData),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print('✅ Report uploaded successfully');
        return true;
      } else {
        print('❌ Upload failed: ${response.body}');
        return false;
      }
    } catch (e) {
      print('⚠️ Error: $e');
      return false;
    }
  }
}
