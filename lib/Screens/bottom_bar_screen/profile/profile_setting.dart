import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Services/profile.dart';
import '../../../models/profile.dart';
import '../../../providers/token_provider.dart';
  // token provider

class account_setting extends StatefulWidget {
  const account_setting({super.key});

  @override
  State<account_setting> createState() => _account_settingState();
}

class _account_settingState extends State<account_setting> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController storeController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  String selectedType = "Parchoon";
  final List<String> shopTypes = ["Parchoon", "Wholesale", "Distributor"];

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchProfileData();
  }

  Future<void> fetchProfileData() async {
    try {
      final token = Provider.of<TokenProvider>(context, listen: false).getToken();
      final profileService = ProfileService();
      final Profile? profile = await profileService.getProfile(token);

      if (profile != null && profile.user != null) {
        final user = profile.user!;

        setState(() {
          nameController.text = user.name ?? '';
          phoneController.text = user.phoneNumber ?? '';
          storeController.text = user.shopName ?? '';
          addressController.text = user.shopAddress ?? '';

          // If API has shopType field
          // selectedType = user.shopType ?? "Parchoon";

          isLoading = false;
        });
      } else {
        setState(() => isLoading = false);
      }
    } catch (e) {
      setState(() => isLoading = false);
      debugPrint("Error fetching profile: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),

      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const Text(
                  "Account Settings",
                  style: TextStyle(
                    color: Color(0xff121212),
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Inter",
                    letterSpacing: -1,
                  ),
                ),
                const Text(
                  "Please provide following details below",
                  style: TextStyle(
                    color: Color(0xff949494),
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Inter",
                    letterSpacing: -1,
                  ),
                ),
                const SizedBox(height: 20),

                // Name
                _buildTextField(nameController, prefix: null),

                const SizedBox(height: 12),

                // Phone
                _buildTextField(
                  phoneController,
                  prefix: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(
                      "Assets/images/flag.png",
                      height: 12,
                      width: 12,
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                // Store Name
                _buildTextField(storeController, prefix: null),

                const SizedBox(height: 12),

                // Address
                _buildTextField(addressController, prefix: null),

                const SizedBox(height: 12),

                // Dropdown
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xffF4F4F6),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: DropdownButton<String>(
                    value: selectedType,
                    isExpanded: true,
                    underline: const SizedBox(),
                    items: shopTypes.map((type) {
                      return DropdownMenuItem(
                        value: type,
                        child: Text(type),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedType = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),

          const Spacer(),

          // Buttons (unchanged)
          Container(
            padding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: Color(0x33000000)),
              ),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 160.5,
                  height: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF121212),
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      "Discard",
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Inter",
                        letterSpacing: -1,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 6),
                SizedBox(
                  width: 160.5,
                  height: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF5934),
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      // TODO: Save Changes -> Call Update API
                    },
                    child: const Text(
                      "Save Changes",
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Inter",
                        letterSpacing: -1,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, {Widget? prefix}) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffF4F4F6),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          contentPadding:
          const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          border: InputBorder.none,
          prefixIcon: prefix,
        ),
      ),
    );
  }
}
