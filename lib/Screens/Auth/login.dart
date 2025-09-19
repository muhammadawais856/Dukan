import 'package:dokan_retailer/Screens/bottom_bar_screen/bottom_nav_bar.dart';
import 'package:dokan_retailer/Screens/Auth/create_account.dart';
import 'package:dokan_retailer/Widgets/customText.dart';
import 'package:dokan_retailer/Widgets/custombutton.dart';
import 'package:dokan_retailer/Widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../../Services/Auth.dart';
import '../../models/login.dart';
import '../../providers/token_provider.dart'; // ✅ Login model

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool _isLoading = false; // 🔹 Loader flag
  final AuthService _authService = AuthService();

  void _loginUser() async {
    if (email.text.isEmpty || password.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter email and password")),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      Login response = await _authService.loginUser(
        email: email.text.trim(),
        password: password.text.trim(),
      );

      if (response.success == true && response.token != null) {
        Provider.of<TokenProvider>(context, listen: false).setToken(response.token!);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(response.message ?? "Login successful")),
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => bottom_nav_bar()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(response.message ?? "Login failed")),
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
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 30, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Login",
                style: TextStyle(
                  fontSize: 28,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF121212),
                  letterSpacing: -1,
                ),
              ),
              SizedBox(height: 6),
              customText1(
                "Please enter the email and password associated with \nyour account.",
              ),
              SizedBox(height: 30),
              customTextField(
                hintText: "Email",
                controller: email,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 30),
              customTextField(
                hintText: "Password",
                controller: password,
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 279),

              _isLoading
                  ? Center(child: CircularProgressIndicator()) // 🔹 Loader
                  : orangebutton(
                text: "Login",
                onPressed: _loginUser, // ✅ Call login service
              ),
              SizedBox(height: 10),

              whitebutton(
                firstText: "Don’t have an account?",
                secondText: "Create Account",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => create_account()),
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
