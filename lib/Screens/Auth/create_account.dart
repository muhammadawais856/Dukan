
import 'package:dokan_retailer/Screens/Auth/login.dart';
import 'package:dokan_retailer/Widgets/custombutton.dart';
import 'package:flutter/material.dart';

import '../../Widgets/customText.dart';
import '../../Widgets/textfield.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white,),
      body: Padding(
        padding: const EdgeInsets.only(right: 20,left: 20, top: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text("Create Account", style: TextStyle(fontSize: 28, fontFamily: 'Inter',
                  fontWeight: FontWeight.w700, color: Color(0xFF121212),letterSpacing: -1),),

              SizedBox(height: 6,),

              customText1("Please provide following details to create an account."),

              SizedBox(height: 30,),

              customTextField(hintText: "Full Name", controller: name, keyboardType: TextInputType.name,),
              SizedBox(height: 10,),

              customTextField(hintText: "+92 ", controller: phone, keyboardType: TextInputType.number,
                prefixImage: "Assets/images/flag.png",
              ),
              SizedBox(height: 10,),

              customTextField(hintText: "Shop Name", controller: shop, keyboardType: TextInputType.name,),
              SizedBox(height: 10,),

              customTextField(hintText: "Email", controller: email, keyboardType: TextInputType.emailAddress,),
              SizedBox(height: 10,),

              customTextField(hintText: "Shop Address", controller: shopaddress, keyboardType: TextInputType.name,
              suffixImage: "Assets/images/map.png",
              ),
              SizedBox(height: 10,),

              customTextField(hintText: "Password", controller: password, keyboardType: TextInputType.number,),
              SizedBox(height: 55,),

              orangebutton(text: "Create Account",
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => login()),
                  );
                },
              ),
              SizedBox(height: 10,),

              whitebutton(
                firstText: "Already have an account?", secondText: "Login",
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => login()),
                  );
                }
                ,)



            ],
          ),
        ),
      ),
    );
  }
}


