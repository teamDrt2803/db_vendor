import 'package:db_vendor/modals/categoriesmodal.dart';

import 'package:flutter/material.dart';
import 'components/body.dart';
import 'components/custom_app_bar.dart';

class CategoriesDetailsScreen extends StatelessWidget {
  static String routeName = "/catdetails";

  @override
  Widget build(BuildContext context) {
    final CategoryDetailsrguments agrs =
        ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: CustomAppBar(rating: 0.0),
      body: Body(product: agrs.product),
    );
  }
}

class CategoryDetailsrguments {
  final WooCategories product;
  CategoryDetailsrguments({@required this.product});
}
