import 'package:flutter/material.dart';

class orangebutton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const orangebutton({
    super.key,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: 345,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFF5934), // Orange background
          foregroundColor: Colors.white,            // Text color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // Rounded corners
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: "Inter",
            letterSpacing: -1
          ),
        ),
      ),
    );
  }
}



class whitebutton extends StatelessWidget {
  final String firstText;   // small gray text
  final String secondText;  // main orange text
  final VoidCallback? onPressed;

  const whitebutton({
    super.key,
    required this.firstText,
    required this.secondText,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: 345,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side:  BorderSide(
              color: Color(0xFF000000).withOpacity(0.1),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          elevation: 0, // keeps it flat like design
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              firstText,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: "Inter",
                color: Color(0xFFBDBDBD), // small gray text
                letterSpacing: -1,
              ),
            ),
            Text(
              secondText,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                fontFamily: "Inter",
                color: Color(0xFFFF5934), // Orange main text
                letterSpacing: -1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// black button



class blackbutton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const blackbutton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 135,
      height: 38,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            fontFamily: "Inter",
            letterSpacing: -1
          ),
        ),
      ),
    );
  }
}

