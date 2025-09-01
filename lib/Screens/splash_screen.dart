import 'dart:async';

import 'package:dokan_retailer/Screens/onboarding.dart';
import 'package:flutter/material.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({super.key});

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => onboarding()),
      );
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFF5934),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Dokan", style: TextStyle(fontSize: 46, fontFamily: 'KronaOne',
                    fontWeight: FontWeight.w400, color: Color(0xFFFFFFFF),letterSpacing: -3.78),),
              ],
            ),
          ),

          Positioned(
            top: 425,
            left: 212,

            child: Text("Retailer App", style: TextStyle(fontSize: 18, fontFamily: 'Inter',
              fontWeight: FontWeight.w500, color: Color(0xFFFFFFFF),letterSpacing: -1),),),

          Positioned(
            left: 135,
            bottom: 24,

            child: Text("Sky pulse Solution", style: TextStyle(fontSize: 16, fontFamily: 'Inter',
                fontWeight: FontWeight.w500, color: Color(0xFFFFFFFF),letterSpacing: -1),),),
        ],
      )
    );
  }
}
