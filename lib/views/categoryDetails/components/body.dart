import 'package:db_vendor/modals/categoriesmodal.dart';
// import 'package:db_vendor/ui/screens/categorydetails/components/product_images.dart';
import 'package:flutter/material.dart';

import 'product_description.dart';
import 'top_rounded_container.dart';
import 'product_images.dart';

class Body extends StatelessWidget {
  final WooCategories product;
  Body({Key key, @required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView(
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CategoryImages(product: product),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              CategoryDescription(
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
