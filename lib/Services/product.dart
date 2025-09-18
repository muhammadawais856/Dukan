import 'dart:convert';
import 'package:dokan_retailer/models/product.dart';
import 'package:http/http.dart' as http;


class ProductService {
  final String baseUrl = "https://karyana-apis-backend.vercel.app";

  Future<Productlistmodel?> fetchProducts() async {
    try {
      final response = await http.get(
        Uri.parse("$baseUrl/api/products/all"), // ✅ correct endpoint
        headers: {"Content-Type": "application/json"},
      );

      print("🔹 Product API Response: ${response.body}");

      if (response.statusCode == 200) {
        return productlistmodelFromJson(response.body);
      } else {
        print("❌ Error: ${response.statusCode} - ${response.body}");
        return null;
      }
    } catch (e) {
      print("❌ Exception fetchProducts: $e");
      return null;
    }
  }
}