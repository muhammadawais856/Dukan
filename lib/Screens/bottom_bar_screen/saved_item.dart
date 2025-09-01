import 'package:dokan_retailer/Screens/bottom_bar_screen/homescreen/product_detail.dart';
import 'package:dokan_retailer/Widgets/custombutton.dart';
import 'package:dokan_retailer/Widgets/textfield.dart';
import 'package:dokan_retailer/models/model.dart';
import 'package:flutter/material.dart';

class saved_item extends StatefulWidget {
  const saved_item({super.key});

  @override
  State<saved_item> createState() => _saved_itemState();
}

class _saved_itemState extends State<saved_item> {

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
  @override
  TextEditingController search= TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20, top: 50),
            child: Column(
              children: [
                Text("Saved Items", style: TextStyle(fontSize: 24, fontFamily: 'Inter',
                  fontWeight: FontWeight.w700, color: Color(0xFF121212),letterSpacing: -1, ),textAlign: TextAlign.center,),

                SizedBox(height: 20,),

                customTextField(hintText: "Search", controller: search, prefixImage: "Assets/images/search.png",),
                SizedBox(height: 20,),
              ],
            ),
          ),


          Divider(color: Color(0xffEEF0F6),),
          //SizedBox(height: 20,),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: GridView.builder(
                //shrinkWrap: true,
                itemCount: product.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 5 in each row
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 14,
                  childAspectRatio: 0.59,
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
                                      fontWeight: FontWeight.w500, fontFamily: "Inter", letterSpacing: -1),
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
                                    Image.asset(
                                      item.heart, height: 24, width: 24, fit: BoxFit.contain,
                                      color: Color(0xffFF5934),colorBlendMode: BlendMode.srcIn,
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
          ),



        ],
      ),

    );
  }
}
