import 'package:db_vendor/Authorization/views/otp.dart';
import 'package:db_vendor/Authorization/views/signIn.dart';
import 'package:db_vendor/orders/cartmodal.dart';
import 'package:db_vendor/ui/screens/cart/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:db_vendor/ui/components/coustom_bottom_nav_bar.dart';
import 'package:db_vendor/ui/enums.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

import '../../../main.dart';
import '../notification.dart';
import 'components/body.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'components/drawer.dart';
import 'components/icon_btn_with_counter.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Custdrawer(),
      appBar: AppBar(
        title: Text('Discount Bazaar'),
        centerTitle: true,
        actions: [
          ValueListenableBuilder<Box<CartModal>>(
            valueListenable: box.listenable(),
            builder: (context, Box<CartModal> cart, _) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconBtnWithCounter(
                  svgSrc: "assets/icons/Cart Icon.svg",
                  numOfitem: cart.length,
                  press: () => Get.to(
                    () => CartScreen(),
                  ),
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
            child: IconBtnWithCounter(
              svgSrc: "assets/icons/Bell.svg",
              numOfitem: 3,
              press: () {
                Get.to(
                  () => NotificationsPage(),
                );
              },
            ),
          ),
        ],
      ),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
