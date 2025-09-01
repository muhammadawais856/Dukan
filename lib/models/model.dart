
import 'package:flutter/cupertino.dart';
// home page grid view
class GridItem {
  final String name;
  final String image;
  final Widget? page;

  GridItem({required this.name, required this.image, this.page});
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
  int price;
  int oldPrice;
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