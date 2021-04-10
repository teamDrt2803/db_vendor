import 'package:db_vendor/Authorization/controllers/cartcontroller.dart';
import 'package:db_vendor/productsmodal.dart';
import 'package:db_vendor/ui/components/default_button.dart';
import 'package:db_vendor/ui/screens/cart/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import '../../size_config.dart';
import 'components/body.dart';
import 'components/custom_app_bar.dart';
import 'components/top_rounded_container.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "/details";
  final CartController _cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    final ProductDetailsArguments agrs =
        ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: CustomAppBar(rating: double.parse(agrs.product.averageRating)),
      body: Body(product: agrs.product),
      bottomNavigationBar: SizedBox(
        //height: SizeConfig.screenHeight * 0.25,
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
              // bottom: getProportionateScreenWidth(20),
              // top: getProportionateScreenWidth(15),
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
  final WooProducts product;
  ProductDetailsArguments({@required this.product});
}
