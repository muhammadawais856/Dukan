import 'package:dokan_retailer/Screens/bottom_bar_screen/profile/policies.dart';
import 'package:dokan_retailer/Screens/bottom_bar_screen/profile/profile_setting.dart';
import 'package:dokan_retailer/models/model.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dokan_retailer/providers/token_provider.dart';

import '../../../Services/profile.dart';
import '../../../models/profile.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  late Future<Profile?> _profileFuture;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // get token from provider
    final token = Provider.of<TokenProvider>(context, listen: false).getToken();
    _profileFuture = ProfileService().getProfile(token);
  }

  @override
  Widget build(BuildContext context) {
    final List<MenuItemModel> menuItems = [
      MenuItemModel(name: "Account Settings", page: account_setting()),
      MenuItemModel(name: "Terms & Conditions"),
      MenuItemModel(name: "Privacy Policy", page: PoliciesScreen()),
      MenuItemModel(name: "Help & Support"),
      MenuItemModel(name: "Rate Our App"),
      MenuItemModel(name: "Logout"), // no page
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xffEEF0F6),
        elevation: 0,
        title: const Text(
          "Profile",
          style: TextStyle(
            color: Color(0xFF121212),
            fontSize: 24,
            fontWeight: FontWeight.w700,
            fontFamily: "Inter",
            letterSpacing: -1,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(Icons.more_vert, color: Colors.black),
          ),
        ],
      ),
      body: FutureBuilder<Profile?>(
        future: _profileFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data?.user == null) {
            return const Center(child: Text("No profile data available"));
          }

          final user = snapshot.data!.user!;

          return Column(
            children: [
              // Profile Card
              Container(
                color: const Color(0xffEEF0F6),
                child: Container(
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        blurRadius: 6,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundImage:
                        AssetImage("Assets/images/profile.png"),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  user.name ?? "No Name",
                                  style: const TextStyle(
                                    color: Color(0xFF121212),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Inter",
                                    letterSpacing: -1,
                                  ),
                                ),
                                Image.asset(
                                  "Assets/images/edit.png",
                                  width: 20,
                                  height: 20,
                                )
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              user.email ?? "No Email",
                              style: const TextStyle(
                                color: Color(0xffFF5934),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Inter",
                                letterSpacing: -1,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              user.phoneNumber ?? "No Phone",
                              style: const TextStyle(
                                color: Color(0xFF121212),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Inter",
                                letterSpacing: -1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Menu List as Cards
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: menuItems.length,
                  itemBuilder: (context, index) {
                    final item = menuItems[index];
                    final isLogout = index == menuItems.length - 1;
                    return Card(
                      color: const Color(0xffEEF0F6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      margin: const EdgeInsets.only(bottom: 12),
                      elevation: 2,
                      child: ListTile(
                        title: Text(
                          item.name,
                          style: const TextStyle(
                            color: Color(0xFF121212),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Inter",
                            letterSpacing: -1,
                          ),
                        ),
                        trailing: isLogout
                            ? null
                            : const Icon(Icons.arrow_forward_ios, size: 16),
                        onTap: () {
                          if (isLogout) {
                            // clear token on logout
                            Provider.of<TokenProvider>(context, listen: false)
                                .setToken('');
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Logged out")),
                            );
                            // TODO: Navigate to login screen if needed
                          } else if (item.page != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => item.page!),
                            );
                          }
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
