
import 'package:dokan_retailer/Screens/Auth/create_account.dart';
import 'package:dokan_retailer/Widgets/customText.dart';
import 'package:dokan_retailer/Widgets/custombutton.dart';
import 'package:flutter/material.dart';

import 'Auth/login.dart';

class onboarding extends StatelessWidget {
  const onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(height: 229, color:Color(0xFFF5F5F5)),
              Padding(
                padding: const EdgeInsets.only(top: 75,left: 21),
                child: Text("Dokan", style: TextStyle(fontSize: 28.4, fontFamily: 'KronaOne',
                    fontWeight: FontWeight.w400, color: Color(0xFFFF5934),letterSpacing: -2.34),),
              ),

              Positioned(
                top: 103,
                left: 83,
                child: Text("Retailer App", style: TextStyle(fontSize: 11.11, fontFamily: 'Inter',
                  fontWeight: FontWeight.w400, color: Color(0xFF121212),letterSpacing: -0.62),),
              )
            ],
          ),

          SizedBox(height: 30,),

          Container(

            child: Padding(
              padding: const EdgeInsets.only(left: 21),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Welcome to Dokan!", style: TextStyle(fontSize: 28, fontFamily: 'Inter',
                      fontWeight: FontWeight.w700, color: Color(0xFF121212),letterSpacing: -1),),
                  SizedBox(height: 24,),

                  Row(
                    children: [
                      Image.asset("Assets/images/shopping-cart.png", height: 28, width: 28,),
                      SizedBox(width: 10,),
                      customText1("We make shopping for your business easier \n than ever before")
                    ],
                  ), SizedBox(height: 24,),

                  Row(
                    children: [
                      Image.asset("Assets/images/list.png", height: 28, width: 28,),
                      SizedBox(width: 10,),
                      customText1("Our app offers extensive product listings")
                    ],
                  ), SizedBox(height: 24,),

                  Row(
                    children: [
                      Image.asset("Assets/images/choice.png", height: 28, width: 28,),
                      SizedBox(width: 10,),
                      customText1("Our ordering system is user-friendly")
                    ],
                  ), SizedBox(height: 24,),

                  Row(
                    children: [
                      Image.asset("Assets/images/store.png", height: 28, width: 28,),
                      SizedBox(width: 10,),
                      customText1("Find everything you need to keep your business \n running smoothly")
                    ],
                  ), SizedBox(height: 24,),

                  Row(
                    children: [
                      Image.asset("Assets/images/phone.png", height: 28, width: 28,),
                      SizedBox(width: 10,),
                      customText1("Start shopping now and experience the \n convenience!")
                    ],
                  ), SizedBox(height: 60,),

                  orangebutton(text: "Create Account",
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => create_account()),
                    );
                  },
                  ),

                  SizedBox(height: 10,),

                  whitebutton(firstText: "Have an account?", secondText: "Login",
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => login()),);

                  },
                  )



                ],
              ),
            ),
          )


        ],
      ),

    );
  }
}
