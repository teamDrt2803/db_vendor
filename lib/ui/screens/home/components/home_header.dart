import 'package:db_vendor/Authorization/controllers/cartcontroller.dart';
import 'package:db_vendor/orders/cartmodal.dart';
import 'package:db_vendor/ui/screens/notification.dart';
import 'package:flutter/material.dart';
import 'package:db_vendor/ui/screens/cart/cart_screen.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../../../main.dart';
import '../../../size_config.dart';
import 'icon_btn_with_counter.dart';
import 'search_field.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeHeader extends StatelessWidget {
  HomeHeader({
    Key key,
  }) : super(key: key);
  CartController cartController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchField(),
          ValueListenableBuilder<Box<CartModal>>(
            valueListenable: box.listenable(),
            builder: (context, Box<CartModal> cart, _) {
              return IconBtnWithCounter(
                svgSrc: "assets/icons/Cart Icon.svg",
                numOfitem: cart.length,
                press: () => Get.to(() => CartScreen()),
              );
            },
          ),
          IconBtnWithCounter(
            svgSrc: "assets/icons/Bell.svg",
            numOfitem: 3,
            press: () {
              Get.to(() => NotificationsPage());
            },
          ),
        ],
      ),
    );
  }
}
