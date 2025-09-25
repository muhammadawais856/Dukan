import 'package:dokan_retailer/Screens/bottom_bar_screen/Cart/bill.dart';
import 'package:dokan_retailer/Screens/bottom_bar_screen/bottom_nav_bar.dart';
import 'package:dokan_retailer/Screens/no_found.dart';
import 'package:dokan_retailer/Screens/splash_screen.dart';
import 'package:dokan_retailer/providers/cart_provider.dart';
import 'package:dokan_retailer/providers/category_provider.dart';
import 'package:dokan_retailer/providers/policies_provider.dart';
import 'package:dokan_retailer/providers/token_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => TokenProvider()),
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
        ChangeNotifierProvider(create: (_) => PolicyProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: splash_screen()
    );
  }
}
