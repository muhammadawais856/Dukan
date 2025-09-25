import 'package:dokan_retailer/Services/search.dart';
import 'package:dokan_retailer/models/search.dart';


import 'package:dokan_retailer/providers/token_provider.dart';
import 'package:flutter/material.dart'; // adjust path
import 'package:provider/provider.dart';
 // adjust path

class search_screen extends StatefulWidget {
  const search_screen({super.key});

  @override
  State<search_screen> createState() => _search_screenState();
}

class _search_screenState extends State<search_screen> {
  final TextEditingController search = TextEditingController();
  final SearchService _searchService = SearchService();

  List<Product> _results = [];
  bool _isLoading = false;

  /// 🔍 Call API
  Future<void> _searchProducts(String query) async {
    if (query.isEmpty) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final token = Provider.of<TokenProvider>(context, listen: false).getToken();
      final response = await _searchService.searchProducts(query, token);

      setState(() {
        _results = response?.products ?? [];
      });
    } catch (e) {
      print("Search error: $e");
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xffEEF0F6),
        elevation: 0,
        title: const Text(
          "Search",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // 🔍 Search Field
            TextField(
              controller: search,
              onSubmitted: (value) => _searchProducts(value),
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(
                    "Assets/images/search.png",
                    height: 24,
                    width: 24,
                  ),
                ),
                hintText: "Search",
                hintStyle: const TextStyle(
                  color: Color(0xFFADADAF),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontFamily: "inter",
                  letterSpacing: -1,
                ),
                filled: true,
                fillColor: const Color(0xFFEEF0F6),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 18,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // 🔄 Loader
            if (_isLoading)
              const Center(child: CircularProgressIndicator()),

            // 📦 Results
            if (!_isLoading)
              Expanded(
                child: _results.isEmpty
                    ? const Center(
                  child: Text(
                    "No products found",
                    style: TextStyle(color: Colors.grey),
                  ),
                )
                    : ListView.builder(
                  itemCount: _results.length,
                  itemBuilder: (context, index) {
                    final product = _results[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      color: Color(0xffEEF0F6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        leading: product.image != null
                            ? Image.network(
                          product.image!,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        )
                            : const Icon(Icons.image_not_supported),
                        title: Text(product.name ?? "No name"),
                        subtitle: Text(
                          "Rs. ${product.price ?? 0}",
                          style: const TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
