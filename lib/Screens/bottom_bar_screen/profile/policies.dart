import 'package:dokan_retailer/Screens/bottom_bar_screen/profile/policies_detail.dart';
import 'package:dokan_retailer/providers/policies_provider.dart';
import 'package:dokan_retailer/providers/token_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class PoliciesScreen extends StatefulWidget {
  const PoliciesScreen({super.key});

  @override
  State<PoliciesScreen> createState() => _PoliciesScreenState();
}

class _PoliciesScreenState extends State<PoliciesScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      final token = Provider.of<TokenProvider>(context, listen: false).getToken();
      Provider.of<PolicyProvider>(context, listen: false).fetchPolicies(token);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Policies"),
        backgroundColor: Color(0xffEEF0F6), // adjust to your app theme
      ),
      body: Consumer<PolicyProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (provider.policies == null || provider.policies!.policies!.isEmpty) {
            return const Center(
              child: Text("No policies available."),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: provider.policies!.policies!.length,
            itemBuilder: (context, index) {
              final policy = provider.policies!.policies![index];
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 3,
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16),
                  title: Text(
                    policy.title ?? "Untitled Policy",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      policy.description ?? "No description",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                    ),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 18),
                  onTap: () {
                    // 👉 navigate to policy detail page if needed
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => PolicyDetailScreen(policy: policy),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
