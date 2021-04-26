import 'package:db_vendor/controllers/controllers.dart';
import 'package:db_vendor/modals/categoriesmodal.dart';
import 'package:db_vendor/helpers/categorycard.dart';
import 'package:db_vendor/modals/size_config.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:db_vendor/views/views.dart';

import 'section_title.dart';

class PopularCategories extends StatelessWidget {
  final WooController _controller = Get.find();
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
