import 'package:dokan_retailer/Screens/bottom_bar_screen/Cart/bill.dart';
import 'package:dokan_retailer/Screens/bottom_bar_screen/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class confirm_order extends StatefulWidget {
  final double totalPrice;
  final int totalItems;

  const confirm_order({
    super.key,
    required this.totalPrice,
    required this.totalItems,
  });

  @override
  State<confirm_order> createState() => _confirm_orderState();
}

class _confirm_orderState extends State<confirm_order> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEEF0F6),
      body: Column(
        children: [
          Stack(
            children: [
              Container(height: 500),
              Image.asset("Assets/images/confirmbg1.png"),
              Positioned(
                left: 55,
                top: 90,
                child: Image.asset("Assets/images/confirmbg2.png", width: 90),
              ),
              Positioned(
                left: 50,
                child: Image.asset("Assets/images/bg3.png", width: 320),
              ),
              Positioned(
                top: 100,
                left: 0,
                child: Image.asset("Assets/images/bg4.png", width: 320),
              ),
              Positioned(
                top: 200,
                left: 190,
                child: Image.asset("Assets/images/bg5.png", width: 100),
              ),
              Positioned(
                top: 120,
                left: 127,
                child: Image.asset("Assets/images/bgtruck.png",
                    height: 121, width: 121),
              ),
              Padding(
                padding:
                const EdgeInsets.only(right: 20, left: 20, top: 235),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Your Order Has Been Placed Successfully",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF121212),
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Inter",
                        letterSpacing: -1,
                      ),
                    ),
                    const Text(
                      "Your order has been successfully placed and is on its way to being delivered. We appreciate your business and are excited to fulfill your purchase.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF121212),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Inter",
                        letterSpacing: -1,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Container(
                      height: 345,
                      width: 338,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xffFFFFFF),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              "Orders details",
                              style: TextStyle(
                                color: Color(0xFF121212),
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Inter",
                                letterSpacing: -1,
                              ),
                            ),
                          ),
                          const Divider(color: Color(0xffEEF0F6)),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Order ID",
                                  style: TextStyle(
                                    color: Color(0x66000000),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Inter",
                                    letterSpacing: -1,
                                  ),
                                ),
                                const Text(
                                  "#KR21241",
                                  style: TextStyle(
                                    color: Color(0xFF121212),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Inter",
                                    letterSpacing: -1,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                const Text(
                                  "Number of Items",
                                  style: TextStyle(
                                    color: Color(0x66000000),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Inter",
                                    letterSpacing: -1,
                                  ),
                                ),
                                Text(
                                  "${widget.totalItems}",
                                  style: const TextStyle(
                                    color: Color(0xFF121212),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Inter",
                                    letterSpacing: -1,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                const Text(
                                  "Delivery Address",
                                  style: TextStyle(
                                    color: Color(0x66000000),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Inter",
                                    letterSpacing: -1,
                                  ),
                                ),
                                const Text(
                                  "SD-21, North Nazimabad, Karachi",
                                  style: TextStyle(
                                    color: Color(0xFF121212),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Inter",
                                    letterSpacing: -1,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                const Text(
                                  "Expected Delivery",
                                  style: TextStyle(
                                    color: Color(0x66000000),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Inter",
                                    letterSpacing: -1,
                                  ),
                                ),
                                const Text(
                                  "Monday, 14 April",
                                  style: TextStyle(
                                    color: Color(0xFF121212),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Inter",
                                    letterSpacing: -1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Divider(color: Color(0xffEEF0F6)),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Total",
                                  style: TextStyle(
                                    color: Color(0xff121212),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Inter",
                                    letterSpacing: -1,
                                  ),
                                ),
                                Text(
                                  "${widget.totalPrice.toStringAsFixed(0)} Rs",
                                  style: const TextStyle(
                                    color: Color(0xffFF5934),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Inter",
                                    letterSpacing: -1,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 14),
          Container(
            padding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                        MaterialPageRoute(builder: (context) => bottom_nav_bar()),
                      );
                    },
                    child: const Text(
                      "Home",
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
                const SizedBox(width: 6),
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
                        MaterialPageRoute(builder: (context) => const bill()),
                      );
                    },
                    child: const Text(
                      "View Orders",
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
