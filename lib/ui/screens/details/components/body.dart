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
            ],
          ),
        ),
      ],
    );
  }
}
