import 'package:db_vendor/controllers/controllers.dart';
import 'package:db_vendor/modals/modals.dart';
import 'package:db_vendor/modals/size_config.dart';

import 'package:db_vendor/views/notification.dart';
import 'package:flutter/material.dart';
import 'package:db_vendor/views/views.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../../main.dart';
import 'icon_btn_with_counter.dart';
import 'search_field.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeHeader extends StatelessWidget {
  HomeHeader({
    Key key,
  }) : super(key: key);
  final CartController cartController = Get.find();
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
