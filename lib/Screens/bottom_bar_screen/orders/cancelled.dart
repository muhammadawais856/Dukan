import 'package:dokan_retailer/Services/order.dart';
import 'package:dokan_retailer/models/order/orderlist.dart';
import 'package:dokan_retailer/providers/token_provider.dart';
import 'package:flutter/material.dart';
import 'package:dokan_retailer/Screens/bottom_bar_screen/orders/order_detail.dart';
import 'package:provider/provider.dart';

class cancelled extends StatefulWidget {
  const cancelled({Key? key}) : super(key: key);

  @override
  State<cancelled> createState() => _cancelledState();
}

class _cancelledState extends State<cancelled> {
  late Future<Orderlist> _futureOrders;

  @override
  void initState() {
    super.initState();
    // don’t call API here, wait for token
  }

  @override
  Widget build(BuildContext context) {
    final tokenProvider = Provider.of<TokenProvider>(context);
    final token = tokenProvider.getToken();

    if (token.isEmpty) {
      return const Center(child: Text("No token found. Please login again."));
    }

    _futureOrders = OrderService().getCancelledOrders(token);

    return FutureBuilder<Orderlist>(
      future: _futureOrders,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        }

        if (!snapshot.hasData || snapshot.data!.orders!.isEmpty) {
          return const Center(child: Text("No cancelled orders"));
        }

        final orders = snapshot.data!.orders!;

        return ListView.builder(
          padding: const EdgeInsets.all(20),
          itemCount: orders.length,
          itemBuilder: (context, index) {
            final order = orders[index];
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderDetail(order: order),
                  ),
                );
              },
              child: Card(
                margin: const EdgeInsets.only(bottom: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                color: const Color(0xFFEEF0F6),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Left Column
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "ID # ${order.orderNumber ?? order.id}",
                            style: const TextStyle(
                              color: Color(0xFF121212),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Inter",
                              letterSpacing: -1,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            "${order.orderItems?.length ?? 0} items",
                            style: const TextStyle(
                              color: Color(0x66000000),
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Inter",
                              letterSpacing: -1,
                            ),
                          ),
                          Text(
                            order.shippingAddress?.address ?? "No address",
                            style: const TextStyle(
                              color: Color(0x66000000),
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Inter",
                              letterSpacing: -1,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Amount",
                                    style: TextStyle(
                                      color: Color(0x66000000),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Inter",
                                      letterSpacing: -1,
                                    ),
                                  ),
                                  Text(
                                    "${order.totalAmount ?? 0} Rs",
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
                              const SizedBox(width: 19),
                              Container(
                                height: 30,
                                child: const VerticalDivider(
                                  color: Color(0x40000000),
                                  thickness: 1,
                                ),
                              ),
                              const SizedBox(width: 6),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
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
                                  Text(
                                    order.deliveryDate != null
                                        ? "${order.deliveryDate!.toLocal()}".split(" ")[0]
                                        : "Not set",
                                    style: const TextStyle(
                                      color: Color(0xff121212),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Inter",
                                      letterSpacing: -1,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0x3DFF5934), // light red bg
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          order.status ?? "Cancelled",
                          style: const TextStyle(
                            color: Color(0xffFF5934), // red text
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Inter",
                            letterSpacing: -1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
