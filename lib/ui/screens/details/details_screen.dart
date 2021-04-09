import 'package:db_vendor/productsmodal.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';
import 'components/custom_app_bar.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "/details";

  @override
  Widget build(BuildContext context) {
    final ProductDetailsArguments agrs =
        ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: CustomAppBar(rating: double.parse(agrs.product.averageRating)),
      body: Body(product: agrs.product),
    );
  }
}

class ProductDetailsArguments {
  final WooProducts product;
  ProductDetailsArguments({@required this.product});
}
