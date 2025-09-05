
import 'package:flutter/cupertino.dart';
// home page grid view
class GridItem {
  final String name;
  final String image;
  final String? price;
  final String? oldPrice;
  final Widget? page;

  GridItem({
    required this.name,
    required this.image,
     this.price,     // ✅ added
     this.oldPrice,  // ✅ added
    this.page,
  });
}


// wheat page list view

class wheatlist {
  final String name;
  final String image;
  final Widget? page;

  wheatlist({required this.name, required this.image, this.page});
}

// grid view model for wheat page
class Product {
  final String title;
  final String image;
  final double price;
  final double oldPrice;
  final String heart;

  Product({
    required this.title,
    required this.image,
    required this.price,
    required this.oldPrice,
    required this.heart,

  });
}

class cartitem {
  String name;
  double price;
  double oldPrice;
  int qty;
  String img;

  cartitem({
    required this.name,
    required this.price,
    required this.oldPrice,
    required this.qty,
    required this.img,
  });
}

class BillModel {
  final String userName;
  final List<ItemModel> items;
  final int itemsPrice;
  final int discount;
  final int totalBill;
  final String reference;
  final String dateTime;

  BillModel({
    required this.userName,
    required this.items,
    required this.itemsPrice,
    required this.discount,
    required this.totalBill,
    required this.reference,
    required this.dateTime,
  });
}

class ItemModel {
  final String name;
  final int qty;

  ItemModel({required this.name, required this.qty});
}


class OrderModel {
  final String orderId;
  final int items;
  final String address;
  final int amount;
  final String deliveryDate;
  final String status;

  OrderModel({
    required this.orderId,
    required this.items,
    required this.address,
    required this.amount,
    required this.deliveryDate,
    required this.status,
  });
}

class MenuItemModel {
  final String name;
  final Widget? page; // nullable page

  MenuItemModel({required this.name, this.page});
}

class BillItem {
  final String name;
  final double price;
  final int quantity;

  BillItem({
    required this.name,
    required this.price,
    required this.quantity,
  });
}


class CartItem {
  final String name;
  final int qty;
  final double price;

  CartItem({
    required this.name,
    required this.qty,
    required this.price,
  });
}

