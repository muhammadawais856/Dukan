
import 'package:flutter/material.dart';

class no_found extends StatefulWidget {
  const no_found({super.key});

  @override
  State<no_found> createState() => _no_foundState();
}

class _no_foundState extends State<no_found> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back)),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "Assets/images/cloud.png",
                height: 180,
                width: 180,
              ),
              SizedBox(height: 15),
              Text("No Data Found",style: TextStyle(fontSize: 24,
                  fontWeight: FontWeight.w700,letterSpacing: -0.5),),
              SizedBox(height: 5),
              Text("Please add or import data first",style: TextStyle(fontSize: 18,
                  fontWeight: FontWeight.w400,letterSpacing: 0),),
            ],
          ),
        )

    );
  }
}

