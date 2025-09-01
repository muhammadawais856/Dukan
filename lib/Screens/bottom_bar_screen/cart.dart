import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:dokan_retailer/models/model.dart';

class cart extends StatefulWidget {
  const cart({super.key});

  @override
  State<cart> createState() => _cartState();
}

class _cartState extends State<cart> {
  List<cartitem> cartItems = [
    cartitem(name: "Wheat Grain Bag", price: 1200, oldPrice: 1600, qty: 3, img: "Assets/images/wheat.png"),
    cartitem(name: "Wheat Grain Bag", price: 1200, oldPrice: 1600, qty: 1, img: "Assets/images/wheat.png"),
    cartitem(name: "Wheat Grain Bag", price: 1200, oldPrice: 1600, qty: 1, img: "Assets/images/wheat.png"),
    cartitem(name: "Wheat Grain Bag", price: 1200, oldPrice: 1600, qty: 2, img: "Assets/images/wheat.png"),
    cartitem(name: "Wheat Grain Bag", price: 1200, oldPrice: 1600, qty: 2, img: "Assets/images/wheat.png"),
  ];

  @override
  Widget build(BuildContext context) {
    final int total = cartItems.fold(0, (sum, item) => sum + item.price * item.qty);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 50),
          const Text(
            "Cart",
            style: TextStyle(
              color: Color(0xFF121212),
              fontSize: 24,
              fontWeight: FontWeight.w700,
              fontFamily: "Inter",
              letterSpacing: -1,
            ),
          ),
          const SizedBox(height: 20),
          const Divider(color: Color(0xffEEF0F6)),
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];

                return Slidable(
                  key: ValueKey('cart_$index'),
                  // Swipe from right to left
                  endActionPane: ActionPane(
                    extentRatio: 0.26,
                    motion: const StretchMotion(),
                    children: [
                      CustomSlidableAction(
                        autoClose: true,
                        padding: EdgeInsets.zero,
                        onPressed: (_) {
                          setState(() => cartItems.removeAt(index));
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(12),
                              bottomRight: Radius.circular(12),

                            ),
                            gradient: LinearGradient(
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft,
                              colors: [
                                Color(0xFFFF0000),
                                Color(0xFFFF0000),// Red
                                Color(0x00FF5934),
                                // Transparent orange
                              ],
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("Assets/images/delete.png", height: 24, width: 24),
                              const SizedBox(width: 8),
                              const Text(
                                "Delete",
                                style: TextStyle(
                                  color: Color(0xffFFFFFF),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Inter",
                                  letterSpacing: -1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xffEEF0F6),
                      borderRadius: BorderRadius.circular(12),

                    ),
                    child: ListTile(
                      leading: Image.asset(item.img, height: 40, width: 40),
                      title: Text(
                        item.name,
                        style: const TextStyle(
                          color: Color(0xFF121212),
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Inter",
                          letterSpacing: -1,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "x 10 Kg",
                            style: TextStyle(
                              color: const Color(0xff000000).withOpacity(0.66),
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Inter",
                              letterSpacing: -1,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "${item.price} Rs",
                                style: const TextStyle(
                                  color: Color(0xFFFF5934),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Inter",
                                  letterSpacing: -1,
                                ),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                "${item.oldPrice} Rs",
                                style: TextStyle(
                                  color: const Color(0xFF000000).withOpacity(0.66),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Inter",
                                  letterSpacing: -1,
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor: const Color(0xFF000000).withOpacity(0.66),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      trailing: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.grey.shade200,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              width: 28,
                              height: 28,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFEEF0F6),
                                  padding: EdgeInsets.zero,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    if (item.qty > 1) item.qty--;
                                  });
                                },
                                child: Image.asset("Assets/images/minus.png", height: 2, width: 14),
                              ),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              item.qty.toString().padLeft(2, "0"),
                              style: const TextStyle(
                                color: Color(0xff000000),
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Inter",
                                letterSpacing: -1,
                              ),
                            ),
                            const SizedBox(width: 6),
                            SizedBox(
                              width: 28,
                              height: 28,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF121212),
                                  foregroundColor: Colors.white,
                                  padding: EdgeInsets.zero,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    item.qty++;
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
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Bottom Checkout
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 19),
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: Color(0x33000000)),
              ),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Total",
                      style: TextStyle(
                        color: Color(0x66000000),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Inter",
                        letterSpacing: -1,
                      ),
                    ),
                    Text(
                      "$total Rs",
                      style: const TextStyle(
                        color: Color(0xFFFF5934),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Inter",
                        letterSpacing: -1,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 86,
                  height: 38,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF121212),
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Buy Now",
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
    );
  }
}
