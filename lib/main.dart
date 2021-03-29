import 'package:db_vendor/Main/Cart.dart';
import 'package:db_vendor/Main/HomeScreen.dart';
import 'package:db_vendor/Main/bottomNavigation.dart';
import 'package:db_vendor/Main/orders.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Discount Bazaar',
      theme: ThemeData(appBarTheme: AppBarTheme()),
      home: Navigation(),
    );
  }
}
