import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/policies.dart'; // import your model file

class PolicyService {
  final String baseUrl = "https://karyana-apis-backend.vercel.app"; // replace with your backend base URL

  Map<String, String> _headers(String token) => {
    "Content-Type": "application/json",
    "Authorization": "Bearer $token", // if API requires token
  };

  /// Fetch all policies
  Future<Policies?> getPolicies(String token) async {
    try {
      final response = await http.get(
        Uri.parse("$baseUrl/api/privacy-policies"), // replace with actual API endpoint
        headers: _headers(token),
      );

      if (response.statusCode == 200) {
        return policiesFromJson(response.body);
      } else {
        print("Failed to load policies. Status: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Error fetching policies: $e");
      return null;
    }
  }
}
