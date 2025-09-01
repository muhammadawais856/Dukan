
import 'package:dokan_retailer/Screens/bottom_bar_screen/homescreen/product_detail.dart';
import 'package:dokan_retailer/Widgets/custombutton.dart';
import 'package:dokan_retailer/models/model.dart';
import 'package:flutter/material.dart';

class wheat extends StatefulWidget {
  const wheat({super.key});

  @override
  State<wheat> createState() => _wheatState();
}

class _wheatState extends State<wheat> {
  @override
  List<wheatlist> items = [
    wheatlist(name: "Brand", image: "Assets/images/brand1.png"),
    wheatlist(name: "Brand", image: "Assets/images/brand2.png",page: wheat()),
    wheatlist(name: "Neon", image: "Assets/images/neon.png"),
    wheatlist(name: "Brand", image: "Assets/images/brand3.png"),
    wheatlist(name: "Brand", image: "Assets/images/brand4.png"),
  ];

  List<Product> product = [
    Product(title: "Wheat Grain Bag", image: "Assets/images/wheat3.png", price: 1200,
        oldPrice: 1600, heart: "Assets/images/hearticon.png"),
    Product(title: "Wheat Grain Bag", image: "Assets/images/wheat3.png", price: 1200,
        oldPrice: 1600, heart: "Assets/images/hearticon.png"),
    Product(title: "Wheat Grain Bag", image: "Assets/images/wheat3.png", price: 1200,
        oldPrice: 1600, heart: "Assets/images/hearticon.png"),
    Product(title: "Wheat Grain Bag", image: "Assets/images/wheat3.png", price: 1200,
        oldPrice: 1600, heart: "Assets/images/hearticon.png"),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white,),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
            child: Row(
              children: [
                Image.asset("Assets/images/wheat2.png", height: 33,width: 46,), SizedBox(width: 6,),
                Text("Wheat", style: TextStyle(fontSize: 24, fontFamily: 'Inter',
                    fontWeight: FontWeight.w700, color: Color(0xFF121212),letterSpacing: -1),),
              ],
            ),
          ),
          SizedBox(height: 24,),
          const Divider( color: Color(0xFFEEF0F6),),
          SizedBox(height: 24,),
          Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Choose Brands", style: TextStyle(fontSize: 18, fontFamily: 'Inter',
                    fontWeight: FontWeight.w600, color: Color(0xFF121212),letterSpacing: -1),),
                SizedBox(height: 16,),

                //List view

                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    itemCount: items.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {

                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // First item in the row
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              children: [
                                Image.asset(items[index].image, width: 60, height: 60),
                                const SizedBox(height: 6),
                                Text(items[index].name,style: TextStyle(fontSize: 14, fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500, color: Color(0xFF121212),letterSpacing: -1),),
                              ],
                            ),
                          ),
                        ],
                      );

                    },
                  ),
                ),

                SizedBox(height: 12,),

                Text("Choose Brands", style: TextStyle(fontSize: 18, fontFamily: 'Inter',
                    fontWeight: FontWeight.w600, color: Color(0xFF121212),letterSpacing: -1),),

                // Grid View

                SizedBox(
                  height: 400,
                  child: GridView.builder(
                    //shrinkWrap: true,
                    itemCount: product.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // 5 in each row
                      crossAxisSpacing: 4,
                      mainAxisSpacing: 14,
                      childAspectRatio: 0.57,
                    ),
                    itemBuilder: (context, index) {
                      final item = product[index];
                      return Card(
                        color: Color(0xFFEEF0F6),

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(item.image, height: 129, width: 144.5,
                            ),
                            const SizedBox(height: 3),
                            SizedBox(
                              height: 99,
                              width: 144.5,
                              child: Card(
                                color: Color(0xFFFFFFFF),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8,top: 6),
                                      child: Text(item.title, maxLines:1,style: TextStyle(color:Color(0xFF000000), fontSize: 14,
                                          fontWeight: FontWeight.w500, fontFamily: "Inter", letterSpacing: -1
                                      ),
                                      ),
                                    ),
                                    const Divider(color: Color(0xFFEEF0F6),),
                                    Row(
                                      children: [
                                        SizedBox(width: 8,),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("${item.price.toStringAsFixed(0)} Rs", style: TextStyle(color:Color(0xFFFF5934),
                                                fontSize: 16, fontWeight: FontWeight.w600, fontFamily: "Inter",
                                                letterSpacing: -1
                                            ),
                                            ),
                                            Text("${item.oldPrice.toStringAsFixed(0)} Rs", style: TextStyle(color:Color(0xFF000000).withOpacity(0.66),
                                              fontSize: 14, fontWeight: FontWeight.w500, fontFamily: "Inter",
                                              letterSpacing: -1, decoration: TextDecoration.lineThrough,decorationColor: Color(0xFF000000).withOpacity(0.66),
                                            ),),
                                          ],
                                        ), SizedBox(width: 47.5,),
                                        Image.asset(item.heart, height: 24, width: 24, fit: BoxFit.contain,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 6,),

                                  ],
                                ),

                              ),

                            ),
                            SizedBox(height: 6,),


                            blackbutton(text: "Buy Now", onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => product_detail()),
                              );
                            }),
                            SizedBox(height: 11,),
                          ],
                        ),
                      );
                    },
                  ),
                ),



              ],
            ),
          )

        ],
      ),

    );
  }
}
