import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resturant/models/shop.dart';
import 'package:resturant/pages/cart_page.dart';

import 'package:resturant/pages/intro_page.dart';
import 'package:resturant/pages/menu_page.dart';
//A REATURANT APP TO MANAGE CARTS WITH PROVIDER...LIST CURRESTLY AD THE DATABASE(CAN MODIFY TO  A LOCAL STORAGE OR A REAL TIME DATABASE)
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context)=> Shop(),
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     home: const IntroPage(),
     routes: {
      '/intropage': (context) => const IntroPage(),
      '/menupage': (context) => const MenuPage(),
      '/cartpage': (context) => const CartPage(),
     },
    );
  }
}