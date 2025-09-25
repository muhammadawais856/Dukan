import 'package:flutter/material.dart';

import '../../../models/policies.dart';


class PolicyDetailScreen extends StatelessWidget {
  final Policy policy;

  const PolicyDetailScreen({super.key, required this.policy});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(policy.title ?? "Policy Detail"),
        backgroundColor: Color(0xffEEF0F6),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              policy.title ?? "Untitled",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text(
              policy.description ?? "No description",
              style: const TextStyle(fontSize: 16),
            ),
            const Spacer(),
            Text(
              "Last Updated: ${policy.updatedAt?.toLocal().toString().split(' ').first ?? 'N/A'}",
              style: TextStyle(color: Colors.grey[600], fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}
