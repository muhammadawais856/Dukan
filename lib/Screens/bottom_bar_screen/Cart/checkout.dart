import 'package:dokan_retailer/Screens/bottom_bar_screen/Cart/confirm_order.dart';
import 'package:dokan_retailer/models/model.dart';
import 'package:flutter/material.dart';

class checkout extends StatefulWidget {
  final List<cartitem> cartItems;

  const checkout({super.key, required this.cartItems});

  @override
  State<checkout> createState() => _checkoutState();
}

class _checkoutState extends State<checkout> {
  @override
  Widget build(BuildContext context) {
    final double total = widget.cartItems.fold(
        0, (sum, item) => sum + (item.price * item.qty));
    double totalPrice = widget.cartItems.fold(0, (sum, item) => sum + (item.price * item.qty));
    int totalItems = widget.cartItems.fold(0, (sum, item) => sum + item.qty);


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Checkout",
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF121212),
                    letterSpacing: -1,
                  ),
                ),
                Image.asset("Assets/images/threedots.png", width: 24, height: 24),
              ],
            ),
          ),

          const Divider(color: Color(0xffEEF0F6)),
          const SizedBox(height: 20),

          // Delivery Address
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Delivery Address",
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF121212),
                      letterSpacing: -1),
                ),
                const SizedBox(height: 10),
                Container(
                  height: 94,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xffEEF0F6),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "SD-21, North Nazimabad, Karachi",
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF121212),
                              letterSpacing: -1),
                        ),
                        Text(
                          "Muhammad Wajahat",
                          style: TextStyle(
                              fontSize: 13,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              color: Color(0x66000000),
                              letterSpacing: -0.5),
                        ),
                        Text(
                          "+92321-6646491",
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              color: Color(0x66000000),
                              letterSpacing: -0.5),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                const Text(
                  "Items",
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF121212),
                      letterSpacing: -1),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),

          // Cart Items List
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                itemCount: widget.cartItems.length,
                itemBuilder: (context, index) {
                  final item = widget.cartItems[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 6),
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
                                "${item.price.toStringAsFixed(0)} Rs",
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
                                "${item.oldPrice.toStringAsFixed(0)} Rs",
                                style: TextStyle(
                                  color: const Color(0xFF000000).withOpacity(0.66),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Inter",
                                  letterSpacing: -1,
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor:
                                  const Color(0xFF000000).withOpacity(0.66),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            "Quantity",
                            style: TextStyle(
                              color: Color(0x66000000),
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Inter",
                              letterSpacing: -1,
                            ),
                          ),
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
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          // Bottom Total & Place Order
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
                      "${total.toStringAsFixed(0)} Rs",
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
                  width: 101,
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
                        MaterialPageRoute(
                          builder: (context) => confirm_order(
                            totalPrice: totalPrice,
                            totalItems: totalItems,
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      "Place Order",
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
