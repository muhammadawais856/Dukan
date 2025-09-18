import 'package:dokan_retailer/Screens/Auth/login.dart';
import 'package:dokan_retailer/Widgets/custombutton.dart';
import 'package:flutter/material.dart';

import '../../Services/Auth.dart';
import '../../Widgets/customText.dart';
import '../../Widgets/textfield.dart';
import '../../models/register.dart'; // ✅ Import Register model

class create_account extends StatefulWidget {
  const create_account({super.key});

  @override
  State<create_account> createState() => _create_accountState();
}

class _create_accountState extends State<create_account> {
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController shop = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController shopaddress = TextEditingController();
  TextEditingController password = TextEditingController();

  bool _isLoading = false; // 🔹 For circular indicator
  final AuthService _authService = AuthService();

  void _registerUser() async {
    setState(() {
      _isLoading = true;
    });

    try {
      Register response = await _authService.registerUser(
        name: name.text.trim(),
        email: email.text.trim(),
        password: password.text.trim(),
        phoneNumber: phone.text.trim(),
        shopName: shop.text.trim(),
        shopAddress: shopaddress.text.trim(),
      );

      if (response.success == true) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(response.message ?? "Account created successfully")),
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => login()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(response.message ?? "Registration failed")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
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
      appBar: AppBar(backgroundColor: Colors.white),
      body: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20, top: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Create Account",
                style: TextStyle(
                  fontSize: 28,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF121212),
                  letterSpacing: -1,
                ),
              ),
              SizedBox(height: 6),
              customText1("Please provide following details to create an account."),
              SizedBox(height: 30),
              customTextField(hintText: "Full Name", controller: name, keyboardType: TextInputType.name),
              SizedBox(height: 10),
              customTextField(
                hintText: "+92 ",
                controller: phone,
                keyboardType: TextInputType.number,
                prefixImage: "Assets/images/flag.png",
              ),
              SizedBox(height: 10),
              customTextField(hintText: "Shop Name", controller: shop, keyboardType: TextInputType.name),
              SizedBox(height: 10),
              customTextField(hintText: "Email", controller: email, keyboardType: TextInputType.emailAddress),
              SizedBox(height: 10),
              customTextField(
                hintText: "Shop Address",
                controller: shopaddress,
                keyboardType: TextInputType.name,
                suffixImage: "Assets/images/map.png",
              ),
              SizedBox(height: 10),
              customTextField(hintText: "Password", controller: password, keyboardType: TextInputType.text),
              SizedBox(height: 55),

              _isLoading
                  ? Center(child: CircularProgressIndicator()) // 🔹 Show loader
                  : orangebutton(
                text: "Create Account",
                onPressed: _registerUser, // ✅ Call function
              ),
              SizedBox(height: 10),

              whitebutton(
                firstText: "Already have an account?",
                secondText: "Login",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => login()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
