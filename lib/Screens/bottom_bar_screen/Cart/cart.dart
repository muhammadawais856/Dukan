import 'package:dokan_retailer/Screens/bottom_bar_screen/Cart/checkout.dart';
import 'package:dokan_retailer/Screens/no_found.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // 🔹 CHANGED: Import Provider

import '../../../models/model.dart';
import '../../../providers/cart_provider.dart'; // 🔹 CHANGED: Import CartProvider

class cart extends StatefulWidget {
  const cart({super.key});

  @override
  State<cart> createState() => _cartState();
}

class _cartState extends State<cart> {
  @override
  Widget build(BuildContext context) {
    // 🔹 CHANGED: Use Provider instead of hardcoded list
    final cartItems = context.watch<CartProvider>().items;

    // 🔹 CHANGED: Total price using Provider
    final double total = context.watch<CartProvider>().total;

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

          /// 🛒 Cart Items List
          Expanded(
            child: cartItems.isEmpty
                ? const no_found()
                : ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];

                return CartSwipeItem(
                  key: ValueKey(item.hashCode),
                  maxSwipe: 100,
                  onDelete: () {
                    // 🔹 Remove item using Provider or local list
                    setState(() => cartItems.removeAt(index));
                  },
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
                            // Minus Button
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
                                  if (item.qty > 1)
                                    {
                                      setState(() {
                                        item.qty--;
                                      });
                                    }

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
                            // Plus Button
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


          /// 🛒 Bottom Checkout
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
                      "${total.toStringAsFixed(0)} Rs", // 🔹 CHANGED: Total from Provider
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
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => checkout(cartItems: cartItems)),
                      );
                    },
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

/// 🔹 Custom swipe widget that keeps your design and animates full-swipe on delete
class CartSwipeItem extends StatefulWidget {
  final Widget child;
  final VoidCallback onDelete;
  final double maxSwipe; // how far the partial swipe stops (px)

  const CartSwipeItem({
    super.key,
    required this.child,
    required this.onDelete,
    this.maxSwipe = 100.0,
  });

  @override
  State<CartSwipeItem> createState() => _CartSwipeItemState();
}

class _CartSwipeItemState extends State<CartSwipeItem> with SingleTickerProviderStateMixin {
  double _dx = 0.0;
  late final AnimationController _controller;
  late Animation<double> _anim;
  bool _isAnimating = false;
  bool _isDeleting = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 220));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _animateTo(double target, {bool deleting = false}) {
    _controller.stop();
    _anim = Tween<double>(begin: _dx, end: target).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut))
      ..addListener(() {
        setState(() {
          _dx = _anim.value;
        });
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _isAnimating = false;
          if (deleting) {
            widget.onDelete();
          }
        }
      });

    _isAnimating = true;
    _isDeleting = deleting;
    _controller.reset();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final double fullWidth = MediaQuery.of(context).size.width + 50;

    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        if (_isAnimating || _isDeleting) return;
        setState(() {
          _dx += details.delta.dx;
          if (_dx < -widget.maxSwipe) _dx = -widget.maxSwipe;
          if (_dx > 0) _dx = 0;
        });
      },
      onHorizontalDragEnd: (details) {
        if (_isAnimating || _isDeleting) return;
        if (_dx.abs() < widget.maxSwipe / 2) {
          _animateTo(0.0);
        } else {
          _animateTo(-widget.maxSwipe);
        }
      },
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: const LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [
                    Color(0xFFFF0000),
                    Color(0x00FF5934),
                    Color(0x00FF5934),
                  ],
                ),
              ),
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 20),
              child: GestureDetector(
                onTap: () {
                  if (_isAnimating) return;
                  _animateTo(-fullWidth, deleting: true);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
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
          ),
          Transform.translate(
            offset: Offset(_dx, 0),
            child: widget.child,
          ),
        ],
      ),
    );
  }
}
