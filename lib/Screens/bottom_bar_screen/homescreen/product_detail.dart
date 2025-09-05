import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/model.dart';
import '../../../providers/cart_provider.dart';

class product_detail extends StatefulWidget {
  final String name;
  final String image;
  final double price;
  final double oldPrice;
  const product_detail({
    super.key,required this.name,
    required this.image,
    required this.price,
    required this.oldPrice,});

  @override
  State<product_detail> createState() => _product_detailState();
}

class _product_detailState extends State<product_detail> {
  @override
  int quantity = 1;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white,),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 198,
              width: double.infinity,
              color: Color(0xFFEEF0F6),
              child: Image.asset(widget.image, height: 198, width: 375,)),

          Padding(
            padding: const EdgeInsets.only(top: 24, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${widget.name} Grain Bag", style: TextStyle(color:Color(0xFF121212), fontSize: 20,
                    fontWeight: FontWeight.w700, fontFamily: "inter", letterSpacing: -1),),

                Text(widget.name, style: TextStyle(color:Color(0xFFADADAF), fontSize: 14,
                    fontWeight: FontWeight.w500, fontFamily: "inter", letterSpacing: -1),),

                SizedBox(height: 8,),

                Row(
                  children: [
                    Text("${widget.price.toStringAsFixed(0)} Rs", style: TextStyle(color:Color(0xFFFF5934), fontSize: 16,
                        fontWeight: FontWeight.w600, fontFamily: "Inter", letterSpacing: -1),),
                    SizedBox(width: 3,),
                    Text("${widget.oldPrice.toStringAsFixed(0)} Rs", style: TextStyle(color:Color(0xFF000000), fontSize: 12,
                        fontWeight: FontWeight.w500, fontFamily: "Inter", letterSpacing: -1,
                        decoration: TextDecoration.lineThrough,decorationColor: Color(0xFF000000)),),
                  ],
                ),
                SizedBox(height: 24,),

                Text("Description", style: TextStyle(color:Color(0xFF121212), fontSize: 18,
                    fontWeight: FontWeight.w600, fontFamily: "Inter", letterSpacing: -1),),

            RichText(
              text: TextSpan(
                style: const TextStyle(color: Color(0xFFADADAF), fontSize: 14,
                  fontWeight: FontWeight.w500,fontFamily: "Inter", letterSpacing: -1,
                ),
                children: [
                  const TextSpan(
                    text: "Sed pellentesque ac nisl ipsum ipsum. Nunc ac malesuada massa faucibus quis. In etiam velit amet mi lorem proin duis ullamcorper et. Enim neque at... ",
                  ),
                  TextSpan(
                    text: "Read More",
                    style: const TextStyle(
                      color: Color(0xFF121212),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),



            ],
            ),
          ),
          SizedBox(height: 210,),

          Divider(color: Color(0xFF000000).withOpacity(0.33),),

          Padding(
            padding: const EdgeInsets.only(left: 24, top: 26),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Minus Button
              SizedBox(
              width: 28,
              height: 28,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFEEF0F6),
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),

                  ),
                ),
                onPressed: () {
                  if (quantity > 1) {
                    setState(() {
                      quantity--;
                    });
                  }
                },
                child: Image.asset("Assets/images/minus.png", height: 2, width: 14,)
              ),
            ),

                    SizedBox(width: 6,),


                    // Quantity Text
                Text(
                  quantity.toString().padLeft(2, "0"),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                SizedBox(width: 6,),

                // Plus Button
                SizedBox(
                  width: 28,
                  height: 28,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF121212), // black background
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        quantity++;
                      });
                    },
                    child: Image.asset(
                      "Assets/images/plus.png",
                      height: 14,
                      width: 14,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),

                SizedBox(width: 139 ,),

                SizedBox(
                  width: 100,
                  height: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF121212),
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      Provider.of<CartProvider>(context, listen: false).addItem(
                        cartitem(
                          name: widget.name,
                          price: widget.price,
                          oldPrice: widget.oldPrice,
                          qty: quantity,
                          img: widget.image,
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Item added to cart")),
                      );
                    },
                    child: Text(
                      "Add to Cart",
                      style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Inter",
                          letterSpacing: -1),
                    ),
                  ),
                ),


              ],
            ),
          ),
          

        ],
      ),
    );
  }
}


