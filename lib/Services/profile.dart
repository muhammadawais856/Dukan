
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../models/profile.dart';


class ProfileService {
  final String baseUrl = "https://karyana-apis-backend.vercel.app";

  Map<String, String> _headers(String token) => {
    "Content-Type": "application/json",
    "Authorization": "Bearer $token",
  };

  Future<Profile?> getProfile(String token) async {
    try {
      final response = await http.get(
        Uri.parse("$baseUrl/api/users/profile"),
        headers: _headers(token),
      );

      debugPrint("🔹 Profile API Response: ${response.body}");

      if (response.statusCode == 200) {
        return profileFromJson(response.body);
      } else {
        debugPrint("Error fetching profile: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      debugPrint("Error fetching profile: $e");
      return null;
    }
  }
}
