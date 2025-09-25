import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/search.dart';   // update path according to your project

class SearchService {
  final String baseUrl = "https://karyana-apis-backend.vercel.app"; // 🔹 replace with your API

  /// Search products by query
  Future<Search?> searchProducts(String query, String token) async {
    try {
      final response = await http.get(
        Uri.parse("$baseUrl/api/products/search?name=$query"), // 👈 use query
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      if (response.statusCode == 200) {
        return Search.fromJson(json.decode(response.body));
      } else {
        throw Exception("Failed to search products: ${response.body}");
      }
    } catch (e) {
      print("Search error: $e");
      return null;
    }
  }

}
