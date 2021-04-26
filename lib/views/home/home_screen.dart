import 'package:db_vendor/modals/modals.dart';
import 'package:db_vendor/views/views.dart';
import 'package:flutter/material.dart';
import 'package:db_vendor/helpers/coustom_bottom_nav_bar.dart';
import 'package:db_vendor/helpers/enums.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../main.dart';
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
      //bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
