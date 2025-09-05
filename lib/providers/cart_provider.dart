import 'package:flutter/material.dart';
import '../models/model.dart';

class CartProvider with ChangeNotifier {
  List<cartitem> _items = [];

  List<cartitem> get items => _items;

  double get total => _items.fold(0, (sum, item) => sum + item.price * item.qty);

  // Add item to cart
  void addItem(cartitem item) {
    // If item already exists, increase quantity
    final index = _items.indexWhere((element) => element.name == item.name);
    if (index >= 0) {
      _items[index].qty += item.qty;
    } else {
      _items.add(item);
    }
    notifyListeners();
  }

  // Remove item from cart
  void removeItem(cartitem item) {
    _items.remove(item);
    notifyListeners();
  }

  // Update quantity of an existing item
  void updateQuantity(cartitem item, int qty) {
    final index = _items.indexWhere((element) => element.name == item.name);
    if (index >= 0) {
      _items[index].qty = qty;
      notifyListeners();
    }
  }

  // Clear cart
  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
