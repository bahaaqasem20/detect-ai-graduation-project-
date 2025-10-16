import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  // ⚠️ غيّر الرابط حسب عنوان السيرفر عندك (localhost أو IP)
  static const String baseUrl = 'http://10.0.2.2:8000/api';

  // 🔹 إنشاء قضية جديدة
  static Future<int?> createCase(Map<String, dynamic> caseData) async {
    final url = Uri.parse('$baseUrl/cases');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(caseData),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['id'] ?? data['case_id'];
      } else {
        print('❌ Failed to create case: ${response.body}');
        return null;
      }
    } catch (e) {
      print('⚠️ Error creating case: $e');
      return null;
    }
  }

  // 🔹 إنشاء ضحية
  static Future<bool> createVictim(Map<String, dynamic> victimData) async {
    final url = Uri.parse('$baseUrl/victims');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(victimData),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        print('✅ Victim created successfully');
        return true;
      } else {
        print('❌ Failed to create victim: ${response.body}');
        return false;
      }
    } catch (e) {
      print('⚠️ Error creating victim: $e');
      return false;
    }
  }

  // 🔹 إنشاء شاهد
  static Future<bool> createWitness(Map<String, dynamic> witnessData) async {
    final url = Uri.parse('$baseUrl/witnesses');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(witnessData),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        print('✅ Witness created successfully');
        return true;
      } else {
        print('❌ Failed to create witness: ${response.body}');
        return false;
      }
    } catch (e) {
      print('⚠️ Error creating witness: $e');
      return false;
    }
  }

  // 🔹 إنشاء متهم
  static Future<bool> createAccused(Map<String, dynamic> accusedData) async {
    final url = Uri.parse('$baseUrl/accused');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(accusedData),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        print('✅ Accused created successfully');
        return true;
      } else {
        print('❌ Failed to create accused: ${response.body}');
        return false;
      }
    } catch (e) {
      print('⚠️ Error creating accused: $e');
      return false;
    }
  }
}
