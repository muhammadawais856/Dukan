import 'package:dokan_retailer/Screens/bottom_bar_screen/Cart/confirm_order.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class bill extends StatefulWidget {
  const bill({super.key});

  @override
  State<bill> createState() => _billState();
}

class _billState extends State<bill> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFF5934),
      body: SafeArea(
        child: Column(
          children: [
            // Top bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),

            // White container with receipt
            Expanded(
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xffFFFFFF),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 16),
                    // Logo
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container( ),
                        Text(
                          "Dokan",
                          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w400,
                            color: Color(0xffFF5934),fontFamily: "KronaOne", letterSpacing: -2.34),),
                        Positioned(
                          top: 27,
                          left: 178,
                          child: Text(
                          "Retailer App",
                          style: TextStyle(fontSize: 11.11, fontWeight: FontWeight.w500,
                              color: Color(0xff121212),fontFamily: "KronaOne", letterSpacing: -0.62),),),
                      ],
                    ),

                    SizedBox(height: 16),

                    // Transaction completed
                    Text("Transaction Completed", style: TextStyle( color: Color(0xff121212),
                      fontSize: 24, fontWeight: FontWeight.w700, fontFamily: "Inter", letterSpacing: -1,),),
                    SizedBox(height: 4),
                    Text("11:13 03-09-2023", style: TextStyle( color: Color(0xff2E2E2E),
                      fontSize: 13, fontWeight: FontWeight.w500, fontFamily: "Inter", letterSpacing: -1,),),

                    const SizedBox(height: 16),

                    // Amount
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                        color: const Color(0xffEEF4EB),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        "32,400 Rs",
                        style: TextStyle(
                          fontSize: 32, fontWeight: FontWeight.bold,
                          color: Color(0xffFF5934),fontFamily: "Inter", letterSpacing: -1,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: DottedLine(
                        dashLength: 6,   // length of each dash
                        dashGapLength: 4, // gap between dashes
                        lineThickness: 1,
                        dashColor: Colors.grey,
                      ),
                    ),


                    // Details
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: [
                              Text("Paid by:",
                                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500,
                                  color: Color(0xff2E2E2E),fontFamily: "Inter", letterSpacing: -0.5,),),

                              Text("Muhammad Wajahat",
                                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600,
                                  color: Color(0xff000000),fontFamily: "Inter", letterSpacing: -0.5,),),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Items:", textAlign: TextAlign.right,
                                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500,
                                  color: Color(0xff2E2E2E),fontFamily: "Inter", letterSpacing: -0.5,),),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text("10 KG Wheat Bag × 10",
                                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600,
                                      color: Color(0xff000000),fontFamily: "Inter", letterSpacing: -0.5,),),
                                  Text("10 KG Sugar Bag × 5",
                                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600,
                                      color: Color(0xff000000),fontFamily: "Inter", letterSpacing: -0.5,),),
                                  Text("5 KG Rice Bag × 7",
                                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600,
                                      color: Color(0xff000000),fontFamily: "Inter", letterSpacing: -0.5,),),

                                ],
                              )


                            ],
                          ),

                          SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Items price",
                                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500,
                                  color: Color(0xff2E2E2E),fontFamily: "Inter", letterSpacing: -0.5,),),
                              Text("32,000 Rs",
                                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600,
                                  color: Color(0xff000000),fontFamily: "Inter", letterSpacing: -0.5,),),
                            ],
                          ),
                          SizedBox(height: 12,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Discount",
                                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500,
                                  color: Color(0xff2E2E2E),fontFamily: "Inter", letterSpacing: -0.5,),),
                              Text("-300 Rs",
                                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600,
                                  color: Color(0xff000000),fontFamily: "Inter", letterSpacing: -0.5,),),
                            ],
                          ),
                          SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Total Bill",
                                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500,
                                  color: Color(0xff2E2E2E),fontFamily: "Inter", letterSpacing: -0.5,),),
                              Text("32,400 Rs",
                                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600,
                                  color: Color(0xff000000),fontFamily: "Inter", letterSpacing: -0.5,),),
                            ],
                          ),

                        ],
                      ),
                    ),

                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: DottedLine(
                        dashLength: 6,   // length of each dash
                        dashGapLength: 4, // gap between dashes
                        lineThickness: 1,
                        dashColor: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text("Reference: 0x12414131255",
                        style: TextStyle(color: Colors.grey)),



                  ],

                ),

              ),


            ),




            // Bottom Buttons
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>confirm_order()),
                        );
                      },
                      child: const Text(
                        "Share",
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
                  SizedBox(width: 6,),

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
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>bill()),
                        );
                      },
                      child: const Text(
                        "Download",
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
      ),
    );
  }
}


// ✅ Zigzag clipper
class ZigZagClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    const double zigzagHeight = 10.0;
    const double zigzagWidth = 15.0;

    final Path path = Path();
    path.moveTo(0, 0);

    for (double x = 0; x < size.width; x += zigzagWidth) {
      path.lineTo(x + zigzagWidth / 2, zigzagHeight);
      path.lineTo(x + zigzagWidth, 0);
    }

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}