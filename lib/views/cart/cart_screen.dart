import 'package:db_vendor/controllers/cartcontroller.dart';
import 'package:db_vendor/helpers/custappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/body.dart';
import 'components/check_out_card.dart';

class CartScreen extends StatelessWidget {
  static String routeName = '/cart';
  final CartController _cartController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
      bottomNavigationBar: Obx(
        () => _cartController.cartItems.isNotEmpty
            ? CheckoutCard()
            : SizedBox.shrink(),
      ),
    );
  }

  CustAppBar buildAppBar() {
    return CustAppBar(
      leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
          ),
          onPressed: () {
            Get.back();
          }),
      title: Text(
        'Your Cart',
      ),
      subtitle: Obx(
        () => Text(
          '${_cartController.cartItems.length} Items',
        ),
      ),
    );
  }
}
