import 'package:db_vendor/Authorization/controllers/woocontroller.dart';
import 'package:db_vendor/categoriesmodal.dart';

import 'package:db_vendor/productsmodal.dart';
import 'package:db_vendor/ui/components/categorycard.dart';
import 'package:db_vendor/ui/screens/allcategories/all_categories.dart';
import 'package:db_vendor/ui/screens/productsall.dart/all_products.dart';
import 'package:flutter/material.dart';
import 'package:db_vendor/ui/components/product_card.dart';
import 'package:db_vendor/ui/models/Product.dart';
import 'package:get/get.dart';

import '../../../size_config.dart';
import 'section_title.dart';

class PopularCategories extends StatelessWidget {
  WooController _controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(
              title: "Popular Categories",
              press: () {
                Get.to(() => AllCategories());
              }),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Obx(
            () => Row(
              children: [
                ...List.generate(
                  _controller.categories.length,
                  (index) {
                    WooCategories wooProducts = _controller.categories[index];
                    return wooProducts.image == null
                        ? SizedBox.shrink()
                        : CategoryCard(product: wooProducts);
                    // here by default width and height is 0
                  },
                ),
                SizedBox(width: getProportionateScreenWidth(20)),
              ],
            ),
          ),
        )
      ],
    );
  }
}
