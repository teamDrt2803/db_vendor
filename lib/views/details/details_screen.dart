import 'package:db_vendor/controllers/controllers.dart';
import 'package:db_vendor/helpers/constants.dart';
import 'package:db_vendor/modals/modals.dart';
import 'package:db_vendor/helpers/default_button.dart';
import 'package:db_vendor/modals/size_config.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:db_vendor/views/views.dart';
import 'components/body.dart';
import 'components/custom_app_bar.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "/details";
  final CartController _cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    final ProductDetailsArguments agrs =
        ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar:
          CustomAppBar(rating: double.parse(agrs.product.rating.toString())),
      body: Body(product: agrs.product),
      bottomNavigationBar: SizedBox(
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: getProportionateScreenWidth(15),
            horizontal: getProportionateScreenWidth(30),
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, -15),
                blurRadius: 20,
                color: Color(0xFFDADADA).withOpacity(0.15),
              )
            ],
          ),
          child: Padding(
            padding: EdgeInsets.only(
              left: SizeConfig.screenWidth * 0.15,
              right: SizeConfig.screenWidth * 0.15,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DefaultButton(
                  color: kSecondaryColor.withOpacity(0.1),
                  text: "Add To Cart",
                  press: () {
                    _cartController.addToCart(products: agrs.product, item: 1);
                  },
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                DefaultButton(
                  text: "Buy Now",
                  press: () async {
                    await _cartController.addToCart(
                        products: agrs.product, item: 1);
                    Get.to(() => CartScreen());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProductDetailsArguments {
  final Products product;
  ProductDetailsArguments({@required this.product});
}
