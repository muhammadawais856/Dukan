import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/order_status/order_status_list.dart';

class OrderService {
  final String baseUrl = "https://karyana-apis-backend.vercel.app";

  // 🔹 Common headers
  Map<String, String> _headers(String token) => {
    "Content-Type": "application/json",
    "Authorization": "Bearer $token",
  };

  /// 🔹 Reusable function to fetch orders and filter by status
  Future<List<Order>> _getOrdersByStatus(String token, String status) async {
    try {
      final response = await http.get(
        Uri.parse("$baseUrl/api/orders"),
        headers: _headers(token),
      );

      if (response.statusCode == 200) {
        final data = orderstatuslistFromJson(response.body);

        // Filter by order status
        return data.orders!
            .where((order) =>
        order.status?.toLowerCase() == status.toLowerCase())
            .toList();
      } else {
        throw Exception(
          "Failed to load orders → ${response.statusCode}: ${response.body}",
        );
      }
    } catch (e) {
      throw Exception("Error fetching $status orders: $e");
    }
  }

  /// 🔹 Pending Orders
  Future<List<Order>> getPendingOrders(String token) =>
      _getOrdersByStatus(token, "pending");

  /// 🔹 Completed Orders
  Future<List<Order>> getCompletedOrders(String token) =>
      _getOrdersByStatus(token, "completed");

  /// 🔹 Cancelled Orders
  Future<List<Order>> getCancelledOrders(String token) =>
      _getOrdersByStatus(token, "cancelled");
}
