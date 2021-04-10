import 'package:db_vendor/Authorization/controllers/cartcontroller.dart';
import 'package:db_vendor/productsmodal.dart';
import 'package:db_vendor/ui/models/Cart.dart';
import 'package:db_vendor/ui/screens/cart/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:db_vendor/ui/components/default_button.dart';
import 'package:db_vendor/ui/size_config.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import 'product_description.dart';
import 'top_rounded_container.dart';
import 'product_images.dart';

class Body extends StatelessWidget {
  final WooProducts product;
  Body({Key key, @required this.product}) : super(key: key);
  final CartController _cartController = Get.find();
  @override
  Widget build(BuildContext context) {
    return ListView(
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ProductImages(product: product),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              ProductDescription(
                product: product,
                pressOnSeeMore: () {},
              ),
              TopRoundedContainer(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: SizeConfig.screenWidth * 0.15,
                    right: SizeConfig.screenWidth * 0.15,
                    bottom: getProportionateScreenWidth(40),
                    top: getProportionateScreenWidth(15),
                  ),
                  child: Column(
                    children: [
                      DefaultButton(
                        color: kSecondaryColor.withOpacity(0.1),
                        text: "Add To Cart",
                        press: () {
                          _cartController.addToCart(products: product, item: 1);
                        },
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(20),
                      ),
                      DefaultButton(
                        text: "Buy Now",
                        press: () async {
                          await _cartController.addToCart(
                              products: product, item: 1);
                          Get.to(() => CartScreen());
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
