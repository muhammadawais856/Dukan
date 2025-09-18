import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/register.dart';
import '../models/login.dart';

class AuthService {
  final String baseUrl = "https://karyana-apis-backend.vercel.app/"; // ✅ fixed

  /// 🔹 Register User
  Future<Register> registerUser({
    required String name,
    required String email,
    required String password,
    String? phoneNumber,
    String? shopName,
    String? shopAddress,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('${baseUrl}api/users/register'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "name": name,
          "email": email,
          "password": password,
          "phoneNumber": phoneNumber,
          "shopName": shopName,
          "shopAddress": shopAddress,
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Register.fromJson(jsonDecode(response.body));
      } else {
        final data = jsonDecode(response.body);
        return Register(
          success: false,
          message: data["message"] ?? response.reasonPhrase,
        );
      }
    } catch (e) {
      throw "Error during registration: $e";
    }
  }

  /// 🔹 Login User
  Future<Login> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('${baseUrl}api/users/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "email": email,
          "password": password,
        }),
      );

      print("🔹 Status Code: ${response.statusCode}");
      print("🔹 Body: ${response.body}");

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Login.fromJson(data);
      } else {
        return Login(
          success: false,
          message: data["message"] ?? "Login failed",
        );
      }
    } catch (e) {
      throw "Error during login: $e";
    }
  }
}
