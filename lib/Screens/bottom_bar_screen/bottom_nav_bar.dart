
import 'package:dokan_retailer/Screens/bottom_bar_screen/Cart/cart.dart';
import 'package:dokan_retailer/Screens/bottom_bar_screen/homescreen/home.dart';
import 'package:dokan_retailer/Screens/bottom_bar_screen/orders/order.dart';
import 'package:dokan_retailer/Screens/bottom_bar_screen/profile.dart';
import 'package:dokan_retailer/Screens/bottom_bar_screen/saved_item.dart';
import 'package:flutter/material.dart';

class bottom_nav_bar extends StatefulWidget {
  const bottom_nav_bar({super.key});

  @override
  State<bottom_nav_bar> createState() => _bottom_nav_barState();
}

class _bottom_nav_barState extends State<bottom_nav_bar> {
  @override
  int currentindex=0;
  List <Widget> screenlist = [
    home(),
    cart(),
    order(),
    saved_item(),
    profile()
  ];

  final List <String> icons = [
    'Assets/images/home.png',
    'Assets/images/cart.png',
    'Assets/images/order.png',
    'Assets/images/heart.png',
    'Assets/images/profile.png',

  ];

  Widget build(BuildContext context) {
    return Scaffold(
      body: screenlist.elementAt(currentindex),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: currentindex,
        onTap: (index){
          setState(() {
            currentindex=index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: List.generate(icons.length, (index){
          return BottomNavigationBarItem(icon: Image.asset(icons[index], height: 23.33,width: 23.33 ,
            color: currentindex == index ? Color(0xFFFF5934) : Color(0xFFBDBDBD),
          ),
            label: "",

          );

        })

      ),







    );
  }
}
