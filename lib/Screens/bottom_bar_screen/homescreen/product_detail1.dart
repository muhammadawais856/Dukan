import 'package:flutter/material.dart';
import 'package:dokan_retailer/models/product/product_list.dart'; // ✅ Correct Product model

class ProductDetailsPage extends StatelessWidget {
  final Product product;

  const ProductDetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final productName = product.name ?? "";
    final productImage = product.image ?? "";
    final productDescription = product.description ?? "";

    return Scaffold(
      appBar: AppBar(
        title: Text(
          productName.isNotEmpty ? productName : "Product",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            productImage.isNotEmpty
                ? Image.network(productImage, height: 200, fit: BoxFit.cover)
                : const Icon(Icons.image, size: 200),

            const SizedBox(height: 20),

            Text(
              productName.isNotEmpty ? productName : "No name",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Text("Price: Rs. ${product.price ?? 0}"),

            const SizedBox(height: 10),

            Text(
              productDescription.isNotEmpty
                  ? productDescription
                  : "No description available",
            ),
          ],
        ),
      ),
    );
  }
}
